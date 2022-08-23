import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // text controllers
    final _emailInput = TextEditingController();
    final _passwordInput = TextEditingController();

    final int number = 4;

    void _signIn() {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("asdf"))
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo image
              Icon(
                Icons.android,
                size: 100,
              ),

              // welcome title
              Text(
                "Welcome To Trexis!",
                style: GoogleFonts.comicNeue(fontSize: 36),
              ),

              // space of 8
              SizedBox(height: 8),

              // welcome sub text
              Text(
                "Login by providing your\'s credentials:)",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),

              // space of 24
              SizedBox(height: 48),

              // email input text field
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12)),
                child: TextField(
                  controller: _emailInput,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email_rounded),
                  ),
                ),
              ),

              // space of 12
              SizedBox(height: 12),

              // password text field
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: TextField(
                    controller: _passwordInput,
                    obscureText: true,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.deepPurple,
                            ),
                            borderRadius: BorderRadius.circular(12)),
                        border: InputBorder.none,
                        hintText: "Password",
                        prefixIcon: Icon(Icons.password)),
                  ),
                ),
              ),

              // space of 12
              SizedBox(height: 12),

              // sign in button
              InkWell(
                onTap: _signIn,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(16)),
                  child: Center(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),

              // space of 20
              SizedBox(height: 20),

              // are you member and register texts
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'No Trexis Account?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Register Here",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
