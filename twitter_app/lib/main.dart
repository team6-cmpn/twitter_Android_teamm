// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
//import 'package:flutter/services.dart';

import './unused/constants.dart';
import './components/google_sign_in.dart';
import './screens/welcome/welcome_screen.dart';

//import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: await_only_futures
  await Firebase.initializeApp();

  // await Hive.initFlutter();

  // Hive.registerAdapter(TransactionAdapter());
  // await Hive.openBox<Transaction>('transactions');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false, //see what does this make
        title: 'twitter_app',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: WelcomeScreen(),
      ),
    );
  }
}
