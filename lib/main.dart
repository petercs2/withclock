import 'package:dial_clock/pages/check_con/check_con_binding.dart';
import 'package:dial_clock/pages/check_con/check_con_live.dart';
import 'package:dial_clock/pages/check_con/check_con_view.dart';
import 'package:dial_clock/pages/dial_custom/dial_custom_binding.dart';
import 'package:dial_clock/pages/dial_custom/dial_custom_view.dart';
import 'package:dial_clock/pages/dial_main/dial_main_binding.dart';
import 'package:dial_clock/pages/dial_main/dial_main_view.dart';
import 'package:dial_clock/pages/dial_setting/dial_setting_binding.dart';
import 'package:dial_clock/pages/dial_setting/dial_setting_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Color primaryColor = Colors.black;
Color bgColor = Colors.black;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final int? type = prefs.getInt('type');
  if (type == null) {
    await prefs.setInt('type', 0);
  }
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Deeps,
      initialRoute: '/',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Deeps = [
  GetPage(name: '/', page: () => const DialCustomView(), binding: DialCustomBinding()),
  GetPage(name: '/dial_main', page: () => const DialMainPage(), binding: DialMainBinding()),
  GetPage(name: '/dial_live', page: () => const CheckConLive()),
  GetPage(name: '/dial_setting', page: () => const DialSettingPage(), binding: DialSettingBinding()),
  GetPage(name: '/dial_check', page: () => const CheckConView(), binding: CheckConBinding()),
];