import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/user_model.dart';
import 'model/wallet_provider.dart';
import 'SplashScreen/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MultiProvider(
          providers: [
          ChangeNotifierProvider(create: (context) => WalletProvider()),
          ],
        child: MyApp(),
      ),
  );


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});




  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GigEase',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Colors.red,
          secondary: Color(0xFFFEF9EB),

        ),
      ),
      home:  SplahScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
