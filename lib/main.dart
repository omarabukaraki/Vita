import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vitafit/firebase_options.dart';
import 'package:vitafit/login_page.dart';
import 'core/app_color.dart';
import 'home_feature/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const VitaFit());
}

class VitaFit extends StatelessWidget {
  const VitaFit({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VitaFit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.kPrimary),
        useMaterial3: true,
      ),
      home: (FirebaseAuth.instance.currentUser != null)
          ? const HomePage()
          : const LoginPage(),
    );
  }
}
