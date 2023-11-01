import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udesc_v2/database/database.dart';
import 'package:udesc_v2/pages/adm_page/add_item_page.dart';
import 'package:udesc_v2/pages/adm_page/adm_page.dart';
import 'package:udesc_v2/pages/auth_pages/login_page.dart';
import 'package:udesc_v2/pages/auth_pages/signup_page.dart';
import 'package:udesc_v2/pages/home_page/home_page.dart';
import 'package:udesc_v2/provider/provider.dart';

void main() {
  runApp(
    // MultiProvider(
    //   providers: [
    //     Provider(
    //       create: (context) => MyDatabase(),
    //     ),
    //     ChangeNotifierProvider(
    //       create: (context) => CartProvider(),
    //     ),
    //   ],
    //   child: const MyApp(),
    // ),
      ChangeNotifierProvider(create: (context) => MyProvider(), child: const MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      routes: {
        "/homepage": (context) => const HomePage(),
        "/signup_page": (context) => const SignUpPage(),
        "/adm_page": (context) => const AdmPage(),
        "/add_item_page": (context) => const AddItemPage(),
      },
    );
  }
}
