import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jci/src/utils/AppColors.dart';
import 'package:logger/logger.dart';

import 'pages/home/home_page.dart';
import 'pages/login/login_page.dart';
import 'utils/Constants.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyApp> createState() => _MyAppState();
}

final logger = Logger(
  printer: PrettyPrinter(),
);

final loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0),
);

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: Colors.white,
    //   statusBarIconBrightness: Brightness.dark,
    // ));

    if (kReleaseMode) {
      Logger.level = Level.nothing;
    } else {
      Logger.level = Level.debug;
    }

    var _route = <String, WidgetBuilder>{
      Constants.HOME_ROUTE: (context) => HomePage(),
      Constants.LOGIN_ROUTE: (context) => LoginPage(),
    };

    return FutureBuilder(
        future: Init.instance.initialize(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(
              home: Container(
                color: Colors.white,
              ),
              debugShowCheckedModeBanner: false,
              builder: BotToastInit(),
              theme: ThemeData(
                  primarySwatch: Colors.blue,
                  fontFamily: Constants.APP_FONT,
                  scaffoldBackgroundColor: Colors.white),
            );
          }

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: Constants.APP_NAME,
            builder: BotToastInit(),
            theme: ThemeData(
              primarySwatch: AppColors.COLOR_SWATCH,
              fontFamily: Constants.APP_FONT,
            ),
            routes: _route,
            home: LoginPage(),
          );
        });

    void showAlertDialog(BuildContext context, String message) {
      showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: Text(Constants.TEXT_FAILED),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                child: Text(
                  Constants.TEXT_CONFIRM,
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                },
              ),
            ],
          );
        },
      );
    }
  }
}

class Init {
  Init._();

  static final instance = Init._();

  Future initialize() async {
    await Future.delayed(const Duration(seconds: 3));
  }
}
