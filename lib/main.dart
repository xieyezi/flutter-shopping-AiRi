import 'package:AiRi/global.dart';
import 'package:AiRi/pages/login/login_page.dart';
import 'package:AiRi/pages/main/main_view.dart';
import 'package:AiRi/router/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:AiRi/styles/colors.dart';
import 'pages/main/main_binding.dart';

void main() => Global.init().then((e) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: MainBinding(),
      enableLog: true,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      unknownRoute: AppPages.unknownRoute,
      home: OKToast(
        child: RefreshConfiguration(
          hideFooterWhenNotFull: true, // Viewport不满一屏时,禁用上拉加载更多功能
          enableBallisticLoad: true, // 可以通过惯性滑动触发加载更多
          child: MaterialApp(
            title: 'AiRi',
            localizationsDelegates: [
              RefreshLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('en'),
              const Locale('zh'),
            ],
            localeResolutionCallback: (Locale? locale, Iterable<Locale> supportedLocales) {
              return locale;
            },
            theme: ThemeData(
              primarySwatch: Colors.purple,
              primaryColor: AppColors.primaryColor,
              accentColor: AppColors.primaryColorAccent,
            ),
            debugShowCheckedModeBanner: false,
            home: Global.isLogin ? MainPage() : LoginPage(),
          ),
        ),
      ),
    );
  }
}
