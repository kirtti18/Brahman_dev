import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

enum AppState { Busy, Idel }

class BaseController extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  AppState _appstate = AppState.Idel;
  AppState get appstate => _appstate;

  void setAppState(AppState value) {
    _appstate = value;
    notifyListeners();
  }

  void showLoading() => BotToast.showLoading();

  void closeLoadings() => BotToast.closeAllLoading();

  void showToast(String message) {
    BotToast.showText(text: message);
  }
}
