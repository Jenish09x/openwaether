import 'package:flutter/cupertino.dart';
import 'package:openwaether/screen/manage/view/manage_screen.dart';
import 'package:openwaether/screen/settings/view/setting_screen.dart';
import 'package:openwaether/screen/splash/view/splash_screen.dart';
import '../screen/home/view/home_screen.dart';

Map<String,WidgetBuilder>app_routes={
  '/':(context) => const SplashScreen(),
  'home':(context) => const HomeScreen(),
  'setting':(context) => const SettingScreen(),
  'manage':(context) => const ManageScreen(),
};