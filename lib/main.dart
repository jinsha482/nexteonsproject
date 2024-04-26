import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'global/config/config.dart';
import 'global/providers/provider_list.dart';

import 'global/routes/routes.dart';
import 'global/styles/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  

  //*--- Hive
  Directory document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  await Hive.openBox<String>(Config.dbName);

  //*---To set the screen orientation
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(
    MultiProvider(providers: providerList, child: const MyApp()),
  );
}

GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return Platform.isIOS
            ? CupertinoApp(
                title: 'Nexteons',
                // routes: routes,
                initialRoute: '/',
                theme: const CupertinoThemeData(
                    barBackgroundColor: kWhite, primaryColor: Colors.black),
                navigatorKey: navigationKey,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: const [
                    DefaultWidgetsLocalizations.delegate,
                    DefaultMaterialLocalizations.delegate,
                    DefaultCupertinoLocalizations.delegate
                  ])
            : MaterialApp(
                 routes: routes,
                title: 'Nexteons',
                initialRoute: '/',
                navigatorKey: navigationKey,
                debugShowCheckedModeBanner: false,
                theme: ThemeData.light().copyWith(
                  searchBarTheme: SearchBarThemeData(
                      backgroundColor: MaterialStateProperty.all(kWhite)),
                ));
      },
      designSize: const Size(430, 932),
    );
  }
}
