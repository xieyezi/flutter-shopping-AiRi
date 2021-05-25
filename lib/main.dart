import 'dart:io';
import 'package:AiRi/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:AiRi/styles/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/main/main_page.dart';
import 'pages/main/store/main_provider.dart';
import 'pages/shopping_cart/store/shopping_cart_global_provider.dart';

Future<void> main() async {
  // 判断是否已经登录
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLogin = prefs.getBool('isLogin') ?? false;
  print('是否已经登录---' + isLogin.toString());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainProvider()),
        ChangeNotifierProvider(create: (_) => ShopingCartGlobalProvider()),
      ],
      child: MyApp(
        isLogin: isLogin,
      ),
    ),
  );
  // 透明状态栏
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  final isLogin;
  const MyApp({Key? key, this.isLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OKToast(
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
          home: isLogin ? MainPage() : LoginPage(),
        ),
      ),
    );
  }
}
