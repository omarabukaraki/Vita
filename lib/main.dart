import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vitafit/firebase_options.dart';
import 'package:vitafit/login_page.dart';
import 'core/app_color.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.kPrimary),
        useMaterial3: true,
      ),
      home: (FirebaseAuth.instance.currentUser != null &&
              FirebaseAuth.instance.currentUser!.emailVerified)
          ? const HomePage()
          : const LoginPage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pop(context);
              },
              child: const Text('logout'))),
    );
  }
}
