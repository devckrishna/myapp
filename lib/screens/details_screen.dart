import 'package:flutter/material.dart';
import 'package:myapp/providers/user_provider.dart';
import 'package:myapp/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String name = "";
  String age = "";
  String gender = "";

  @override
  void initState() {
    // TODO: implement initState
    getDetails();
    super.initState();
  }

  void getDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      name = preferences.getString("name") ?? "";
      age = preferences.getString("age") ?? "";
      gender = preferences.getString("gender") ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "name: " + name,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
          ),
          Text(
            "age: " + age,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
          ),
          Text(
            "gender: " + gender,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
          ),
          Container(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              onPressed: () async {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
                await Provider.of<UserProvider>(context, listen: false)
                    .removeFromSP();
              },
              child: Text("LogOut"),
            ),
          )
        ],
      ),
    ));
  }
}
