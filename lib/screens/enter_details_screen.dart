import 'package:flutter/material.dart';
import 'package:myapp/providers/user_provider.dart';
import 'package:myapp/screens/details_screen.dart';
import 'package:provider/provider.dart';

class EnterDetailsScreen extends StatefulWidget {
  EnterDetailsScreen({Key? key}) : super(key: key);

  @override
  State<EnterDetailsScreen> createState() => _EnterDetailsScreenState();
}

class _EnterDetailsScreenState extends State<EnterDetailsScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String name = "";
  String gender = "";
  String age = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), labelText: 'Name'),
                controller: _nameController,
                onSaved: (text) => name = text ?? "",
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), labelText: 'Age'),
                controller: _genderController,
                onSaved: (text) => gender = text ?? "",
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), labelText: 'Gender'),
                controller: _ageController,
                onSaved: (text) => age = text ?? "",
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    // _formKey.currentState.save();
                    Provider.of<UserProvider>(context, listen: false)
                        .addNameAndAge(_nameController.text,
                            _ageController.text, _genderController.text)
                        .then((vla) {
                      return Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen()));
                    });
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
