import 'package:flutter/material.dart';
import 'package:myapp/models/user_model.dart';
import 'package:myapp/providers/user_provider.dart';
import 'package:myapp/screens/details_screen.dart';
import 'package:myapp/screens/enter_details_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginTile extends StatefulWidget {
  late UserModel user;
  LoginTile(this.user, {Key? key}) : super(key: key);

  @override
  State<LoginTile> createState() => _LoginTileState();
}

class _LoginTileState extends State<LoginTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.list),
      trailing: widget.user.id != context.watch<UserProvider>().id
          ? ElevatedButton(
              onPressed: () async {
                await Provider.of<UserProvider>(context, listen: false)
                    .addToSP(widget.user.id);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EnterDetailsScreen()));
              },
              child: const Text("Sign-in"))
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              onPressed: () async => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => DetailsScreen())),
              child: const Text("Enter")),
      title: Text(widget.user.name),
      subtitle: Text(widget.user.atype),
    );
  }
}
