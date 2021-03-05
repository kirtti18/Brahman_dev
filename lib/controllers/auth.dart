import 'package:auto_route/auto_route.dart';
import 'package:b1/constraints/app_constraints.dart';
import 'package:b1/controllers/base.dart';
import 'package:b1/models/brahmin.dart';
import 'dart:io';
import 'package:b1/models/user.dart';
import 'package:b1/routes/approute.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends BaseController {
  final picker = ImagePicker();

  List<AppUser> _users = [];
  List<AppUser> get users => _users;

  File _file;
  File get file => _file;

  pickImage() async {
    final pickedFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 50);
    _file = File(pickedFile.path);
    notifyListeners();
  }

  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<void> isSignedIn() async {
    try {
      showLoading();
      var isLoggedIn = await googleSignIn.isSignedIn();
      if (isLoggedIn) {
        ExtendedNavigator.root.replace(Routes.myHomePage);
      } else {
        ExtendedNavigator.root.replace(Routes.login);
      }
      closeLoadings();
    } catch (e) {
      showToast(e.message);
      closeLoadings();
    }
  }

  Future<void> signIn({@required bool isBramhin, Brahman brahmin}) async {
    try {
      showLoading();
      GoogleSignInAccount googleUser = await googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      User firebaseUser =
          (await firebaseAuth.signInWithCredential(credential)).user;

      if (firebaseUser != null) {
        var preference = await SharedPreferences.getInstance();
        AppUser user = new AppUser();
        user.name = googleUser.displayName;
        user.email = googleUser.email;
        user.userId = firebaseUser.uid;
        user.imageUrl = googleUser.photoUrl;
        if (isBramhin != null) {
          Brahman _brahmin = new Brahman();
          _brahmin.name = googleUser.displayName;
          _brahmin.brahmanId = _brahmin.address = "";

          //for brmhin
          /// if user data already exist (if user data available on fire store )
          var bramhinSnapshot = await firestore
              .collection(AppConstraints.bramhins)
              .where("brahmanId", isEqualTo: firebaseUser.uid)
              .get();
          if (bramhinSnapshot.docs.isEmpty) {
            ExtendedNavigator.root.replace(
              Routes.brahmanSignup,
              arguments: BrahmanSignupArguments(
                name: googleUser.displayName,
                userId: firebaseUser.uid,
                email: googleUser.email,
                imgUrl: googleUser.photoUrl,
              ),
            );
          } else {
            await firestore
                .collection(AppConstraints.bramhins)
                .doc(firebaseUser.uid)
                .set(brahmin.toMap());
          }

          /// just save and sign in
          /// if not

          /// ask for phone , name, address
          /// save to bramhin details
          /// go to home
        } else {
          //for other user
          await firestore
              .collection(AppConstraints.users)
              .doc(firebaseUser.uid)
              .set(user.toMap());
        }
        await preference.setString("name", googleUser.displayName);
        await preference.setString("email", googleUser.email);
        await preference.setString("userid", firebaseUser.uid);
        closeLoadings();
        ExtendedNavigator.root.replace(Routes.myHomePage);
      }
    } catch (e) {
      showToast(e.message);
    }

    Future<void> updateProfile({AppUser name}) async {
      try {
        showLoading();
        setAppState(AppState.Busy);
        if (_file != null) {
          Reference reference = storage
              .ref()
              .child("${name.userId}.${_file.path.split(".").last}");
          UploadTask task = reference.putFile(_file);
          name.imageUrl =
              await (await task.whenComplete(() {})).ref.getDownloadURL();
        }
        await firestore
            .collection(AppConstraints.users)
            .doc(name.userId)
            .update(name.toMap())
            .then((_) {
          showToast("updated");
          _users.removeWhere((e) => e.userId == name.userId);
          _users.add(name);
        });
        setAppState(AppState.Idel);
        closeLoadings();
      } catch (e) {
        showToast(e.message);
        closeLoadings();
      }
    }
  }
}
