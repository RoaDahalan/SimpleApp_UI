import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project5/Cards.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        actions: [
          PopupMenuButton<String>(
            icon: Icon(
              Icons.language,
              size: 30,
              color: Colors.white,
            ),
            onSelected: (String value) {
              if (value == 'en') {
                context.setLocale(Locale('en'));
              } else {
                context.setLocale(Locale('ar'));
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'en',
                  child: Center(child: Text("English")),
                ),
                PopupMenuItem<String>(
                  value: 'ar',
                  child: Center(child: Text("Arabic")),
                ),
              ];
            },
          ),
        ],
      ),
      backgroundColor: Colors.blue[800],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "_Login".tr(),
                  style: GoogleFonts.lobster(
                    fontSize: 80,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
              ),
              SizedBox(height: 51),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "_Email".tr(),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Colors.blue[800],
                  ),
                ),
              ),
              SizedBox(height: 22),
              TextField(
                controller: passController,
                decoration: InputDecoration(
                  labelText: "_Password".tr(),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.blue[800],
                  ),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                height: 50,
                width: 100,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    elevation: 7,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Cards()),
                    );
                  },
                  child: Text(
                    "_Login".tr(),
                    style: TextStyle(fontSize: 17, color: Colors.blue[600]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
