import 'package:flutter/material.dart';
import 'package:myapp/components/login_tile.dart';
import 'package:myapp/models/data.dart';
import 'package:myapp/providers/user_provider.dart';
import 'package:myapp/screens/details_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    setIdHelper();
  }

  void setIdHelper() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int id = preferences.getInt("id") ?? 0;
    if (id != 0) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => DetailsScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return LoginTile(list[index]);
          }),
    );
  }
}
