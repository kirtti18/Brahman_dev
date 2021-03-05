import 'package:auto_route/auto_route.dart';
import 'package:b1/routes/approute.gr.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final botToastBuilder = BotToastInit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      debugShowCheckedModeBanner: false,
      navigatorObservers: [BotToastNavigatorObserver()],
      onGenerateRoute: AppRouter(),
      builder: (context, child) {
        child = ExtendedNavigator<AppRouter>(router: AppRouter());
        child = botToastBuilder(context, child);
        return child;
      },
    );
  }
}
