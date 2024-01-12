import 'package:flutter/material.dart';
import 'package:openwaether/screen/home/provider/home_provider.dart';
import 'package:openwaether/utils/app_routes.dart';
import 'package:openwaether/utils/theme_data.dart';
import 'package:openwaether/utils/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: HomeProvider()),
        ChangeNotifierProvider.value(value: ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (BuildContext context, value, Widget? child) {
          value.changeTheme();
          return MaterialApp(
            theme: value.isLight?darkTheme:lightTheme,
            debugShowCheckedModeBanner: false,
            routes: app_routes,
          );
        },
      ),
    ),
  );
}
