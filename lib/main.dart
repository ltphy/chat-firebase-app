import 'package:chat_app_firebase/screens/bands_screen/bands_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

bool USE_FIRESTORE_EMULATOR = false;

void main() async {
  //
  WidgetsFlutterBinding.ensureInitialized();
  // initialized firebase
  await Firebase.initializeApp();
  if (USE_FIRESTORE_EMULATOR) {

    String host = defaultTargetPlatform == TargetPlatform.android
        ? '10.0.2.2:8080'
        : 'localhost:8080';

    FirebaseFirestore.instance.settings = Settings(
        host: host, sslEnabled: false, persistenceEnabled: false);

  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BandsScreen(),
    );
  }
}
