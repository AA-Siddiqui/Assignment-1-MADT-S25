// login_page.dart
import 'package:assignment_1_q_1/pages/main_page.dart';
import 'package:assignment_1_q_1/widget/get_size.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int pageNo = 0;
  final PageController pageController = PageController();
  Size formSize = Size.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff9735ec), Color(0xffd620ff)],
            stops: [0.25, 0.75],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 256,
                height: 256,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(128),
                ),
                child: Image.network(
                    "https://play-lh.googleusercontent.com/LyyerN01SOlgfaRZTFa2N6lc2wJeFkp4rPtoXDEPvHGjwZI58n2vSWezlgpf_eF82A"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: CustomSlidingSegmentedControl<int>(
                  initialValue: pageNo,
                  children: {
                    0: Text(
                      "Existing",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: pageNo == 0 ? Colors.white : Colors.deepPurple,
                      ),
                    ),
                    1: Text(
                      "New User",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: pageNo == 1 ? Colors.white : Colors.deepPurple,
                      ),
                    ),
                  },
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  thumbDecoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xff9735ec), Color(0xffd620ff)],
                      stops: [0.25, 0.75],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                    ),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: .3),
                        blurRadius: 4.0,
                        spreadRadius: 1.0,
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                      ),
                    ],
                  ),
                  duration: Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  onValueChanged: (v) {
                    setState(() {
                      pageNo = v;
                      pageController.animateToPage(
                        pageNo,
                        duration: Durations.medium1,
                        curve: Curves.easeInOut,
                      );
                    });
                  },
                ),
              ),
              Expanded(
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: pageController,
                  children: [
                    Stack(
                      children: [
                        GetSize(
                          onChildSize: (size) {
                            setState(() {
                              formSize = size;
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                bottom: 30,
                                left: 15,
                                right: 15,
                                top: 10,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _makeInputField(
                                    Icons.person,
                                    "Username",
                                  ),
                                  _makeInputField(
                                    Icons.email,
                                    "Email",
                                  ),
                                  _makeInputField(
                                    Icons.lock,
                                    "Password",
                                    obscureText: true,
                                  ),
                                  _makeInputField(
                                    Icons.lock,
                                    "Confirm Password",
                                    obscureText: true,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        _makeHangingGradientButton("Sign Up"),
                      ],
                    ),
                    Stack(
                      children: [
                        GetSize(
                          onChildSize: (size) {
                            setState(() {
                              formSize = size;
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                bottom: 30,
                                left: 15,
                                right: 15,
                                top: 10,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _makeInputField(
                                    Icons.person,
                                    "Username",
                                  ),
                                  _makeInputField(
                                    Icons.lock,
                                    "Password",
                                    obscureText: true,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        _makeHangingGradientButton("Login"),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Column(
                            children: [
                              TextButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (buildContext) => MyHomePage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Forget Password?",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Divider(
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "OR",
                                    style: TextStyle(
                                      color: Colors.white,
                                      backgroundColor: Color(0xffd620ff),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: Icon(Icons.facebook_rounded),
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: Icon(FontAwesomeIcons.google),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _makeInputField(IconData icon, String label,
      {bool obscureText = false}) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: Icon(icon),
        label: Text(
          label,
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Positioned _makeHangingGradientButton(String buttonText) {
    return Positioned(
      top: formSize.height - 15,
      left: formSize.width / 2 - 50,
      right: formSize.width / 2 - 50,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            colors: [
              Color(0xff9735ec),
              Color(0xffd620ff),
            ],
          ),
        ),
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (buildContext) => MyHomePage(),
              ),
            );
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
          ),
          child: Text(
            buttonText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
