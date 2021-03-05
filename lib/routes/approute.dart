import 'package:auto_route/auto_route_annotations.dart';
import 'package:b1/screens/brahmanprofile.dart';
import 'package:b1/screens/brahman_Signup.dart';
import 'package:b1/screens/edit_profile.dart';
import 'package:b1/screens/homepage.dart';
import 'package:b1/screens/login.dart';
import 'package:b1/screens/notification.dart';
import 'package:b1/screens/splash.dart';

export 'approute.gr.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    MaterialRoute(page: SplashScreen, initial: true),
    MaterialRoute(page: Bprofile),
    MaterialRoute(page: BrahmanSignup),
    MaterialRoute(page: EditProfile),
    MaterialRoute(page: MyHomePage),
    MaterialRoute(page: Login),
    MaterialRoute(page: Notification1),
  ],
)
class $AppRouter {}
