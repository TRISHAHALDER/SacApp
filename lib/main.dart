import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sac_event_manager/homePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sac_event_manager/search2.dart';
import 'package:sac_event_manager/testfetch.dart';
import 'package:sac_event_manager/fetch.dart';

import 'adminpage.dart';

 Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
