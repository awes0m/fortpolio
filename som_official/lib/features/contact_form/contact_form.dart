import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../../constants/constants.dart';
import '../../utils/utils.dart';
import '../home/homepage.dart';

class ContactFormPage extends StatefulWidget {
  static const String routeName = '/contact-form';
  const ContactFormPage({Key? key}) : super(key: key);

  @override
  _ContactFormPageState createState() => _ContactFormPageState();
}

class _ContactFormPageState extends State<ContactFormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  String name = "";
  String email = "";
  String message = "";

  Future<void> _submit() async {
    await dotenv.load(fileName: "../../../assets/.env");
    try {
      final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");

      final http.Response response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          // "service_id": serviceId,
          // "template_id": templateId,
          // "user_id": apiKey,
          "service_id": dotenv.env['serviceId'].toString(),
          "template_id": dotenv.env['templateId'].toString(),
          "user_id": dotenv.env['apiKey'].toString(),
          "template_params": {
            "name": _nameController.text,
            "message": _messageController.text,
            "user_email": _emailController.text
          }
        }),
      );
      if (response.statusCode != 200) {
        appSnackBar(context, "Error: ${response.body}");
        return;
      }
      appSnackBar(context, "Success");
      // print(response.body.toString());
      Navigator.restorablePopAndPushNamed(context, HomePage.routeName);
    } on Exception catch (e) {
      appSnackBar(context, e.toString());
      // print(e.toString());
    }
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to go back without submiting'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.restorablePopAndPushNamed(
                    context, HomePage.routeName),
                child: const Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: SizedBox(
          width: 400,
          height: 700,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: kCaptionColor, width: 1),
                      shape: BoxShape.rectangle,
                      borderRadius: const BorderRadius.all(Radius.circular(7))),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      onWillPop: _onWillPop,
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Contact Form',
                            style: GoogleFonts.oswald(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                                labelText: 'Your Name',
                                focusColor: Colors.white,
                                focusedBorder: OutlineInputBorder()),
                            keyboardType: TextInputType.emailAddress,
                            onFieldSubmitted: (value) {
                              setState(() {
                                name = value;
                              });
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),

                          TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                                labelText: 'Your E-Mail',
                                focusColor: Colors.white,
                                focusedBorder: OutlineInputBorder()),
                            keyboardType: TextInputType.emailAddress,
                            onFieldSubmitted: (value) {
                              setState(() {
                                email = value;
                              });
                            },
                            validator: (value) {
                              if (value!.isEmpty || !value.contains('@')) {
                                return 'Invalid email!';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),

                          // this is where the
                          // input goes
                          TextFormField(
                            controller: _messageController,
                            minLines: 2,
                            maxLines: 10,
                            decoration: const InputDecoration(
                                labelText: 'Your Message for me!',
                                focusColor: Colors.white,
                                focusedBorder: OutlineInputBorder()),
                            validator: (value) {
                              if (value!.length < 7) {
                                return 'Tell a little more about it Please!';
                              }
                              return null;
                            },
                            onFieldSubmitted: (value) {
                              setState(() {
                                message = value;
                              });
                            },
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(300, 40),
                                backgroundColor: kPrimaryColor),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _submit();
                              }
                            },
                            child: const Text(
                              "Submit",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
                // this is where
                // the form field
                // are defined
              ]),
        ),
      ),
    );
  }
}
