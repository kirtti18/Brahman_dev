// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../models/brahmin.dart';
import '../screens/brahman_Signup.dart';
import '../screens/brahmanprofile.dart';
import '../screens/edit_profile.dart';
import '../screens/homepage.dart';
import '../screens/login.dart';
import '../screens/notification.dart';
import '../screens/splash.dart';

class Routes {
  static const String splashScreen = '/';
  static const String bprofile = '/Bprofile';
  static const String brahmanSignup = '/brahman-signup';
  static const String editProfile = '/edit-profile';
  static const String myHomePage = '/my-home-page';
  static const String login = '/Login';
  static const String notification1 = '/Notification1';
  static const all = <String>{
    splashScreen,
    bprofile,
    brahmanSignup,
    editProfile,
    myHomePage,
    login,
    notification1,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreen, page: SplashScreen),
    RouteDef(Routes.bprofile, page: Bprofile),
    RouteDef(Routes.brahmanSignup, page: BrahmanSignup),
    RouteDef(Routes.editProfile, page: EditProfile),
    RouteDef(Routes.myHomePage, page: MyHomePage),
    RouteDef(Routes.login, page: Login),
    RouteDef(Routes.notification1, page: Notification1),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SplashScreen(),
        settings: data,
      );
    },
    Bprofile: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Bprofile(),
        settings: data,
      );
    },
    BrahmanSignup: (data) {
      final args = data.getArgs<BrahmanSignupArguments>(
        orElse: () => BrahmanSignupArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => BrahmanSignup(
          key: args.key,
          bramhin: args.bramhin,
        ),
        settings: data,
      );
    },
    EditProfile: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => EditProfile(),
        settings: data,
      );
    },
    MyHomePage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => MyHomePage(),
        settings: data,
      );
    },
    Login: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Login(),
        settings: data,
      );
    },
    Notification1: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Notification1(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension AppRouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushSplashScreen() => push<dynamic>(Routes.splashScreen);

  Future<dynamic> pushBprofile() => push<dynamic>(Routes.bprofile);

  Future<dynamic> pushBrahmanSignup({
    Key key,
    Brahman bramhin,
  }) =>
      push<dynamic>(
        Routes.brahmanSignup,
        arguments: BrahmanSignupArguments(key: key, bramhin: bramhin),
      );

  Future<dynamic> pushEditProfile() => push<dynamic>(Routes.editProfile);

  Future<dynamic> pushMyHomePage() => push<dynamic>(Routes.myHomePage);

  Future<dynamic> pushLogin() => push<dynamic>(Routes.login);

  Future<dynamic> pushNotification1() => push<dynamic>(Routes.notification1);
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// BrahmanSignup arguments holder class
class BrahmanSignupArguments {
  final Key key;
  final Brahman bramhin;
  BrahmanSignupArguments({this.key, this.bramhin});
}
