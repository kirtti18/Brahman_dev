import 'package:auto_route/auto_route.dart';
import 'package:b1/constraints/app_constraints.dart';
import 'package:b1/controllers/base.dart';
import 'package:b1/models/brahmin.dart';
import 'dart:io';
import 'package:b1/models/user.dart';
import 'package:b1/routes/approute.dart';
import 'package:b1/routes/approute.gr.dart';
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
      //google sign in start
      GoogleSignInAccount googleUser = await googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      //google sign in end
      //creating a new user in firebase auth
      var cred = await firebaseAuth.signInWithCredential(credential);
      User firebaseUser = cred.user; // get a new user from firebase auth
      if (firebaseUser != null) {
        var preference = await SharedPreferences.getInstance();
        AppUser user = new AppUser(
          name: googleUser.displayName,
          email: googleUser.email,
          userId: firebaseUser.uid,
          imageUrl: googleUser.photoUrl,
        );
        if (isBramhin) {
          Brahman _brahmin = new Brahman(
            name: googleUser.displayName,
            address: "",
            brahmanId: firebaseUser.uid,
            lat: 0.0,
            long: 0.0,
            phone: "",
          );
          //for brmhin
          /// if user data already exist (if user data available on fire store )
          var bramhinSnapshot = await firestore
              .collection(AppConstraints.bramhins)
              .where("brahmanId", isEqualTo: firebaseUser.uid)
              .get();
          //means a new bramhin
          if (bramhinSnapshot.docs.isEmpty) {
            //redirect to another screen
            ExtendedNavigator.root.replace(
              Routes.brahmanSignup,
              arguments: BrahmanSignupArguments(
                bramhin: _brahmin,
              ),
            );
          } else {
            //create a new bramhin
            await firestore
                .collection(AppConstraints.bramhins)
                .doc(firebaseUser.uid)
                .set(brahmin.toMap());
          }
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
  }

  Future<void> createNewBramhin({Brahman bramhin}) async {
    try {
      showLoading();
      await firestore
          .collection(AppConstraints.bramhins)
          .doc(bramhin.brahmanId)
          .set(bramhin.toMap());
      showToast("Your account has been sucessfully created");
      ExtendedNavigator.root.replace(Routes.myHomePage);
      closeLoadings();
    } catch (e) {
      showToast(e.message);
    }
  }

  Future<void> updateProfile({AppUser name}) async {
    try {
      showLoading();
      setAppState(AppState.Busy);
      if (_file != null) {
        Reference reference =
            storage.ref().child("${name.userId}.${_file.path.split(".").last}");
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
