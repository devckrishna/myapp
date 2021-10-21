import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/providers/user_provider.dart';
import 'package:myapp/screens/details_screen.dart';
import 'package:myapp/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
