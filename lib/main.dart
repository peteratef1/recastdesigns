import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_recast/theme.dart' as apptheme;
import 'screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const AlterNowApp());
}

class AlterNowApp extends StatelessWidget {
  const AlterNowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlterNow',
      debugShowCheckedModeBanner: false,
      theme: apptheme.AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}
