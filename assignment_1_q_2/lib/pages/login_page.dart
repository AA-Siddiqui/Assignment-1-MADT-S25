// login_page.dart
import 'package:assignment_1_q_2/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Image.asset("assets/images/hanging_plant.png"),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height / 10 * 6,
            decoration: BoxDecoration(
              color: Color(0xFF329e60),
              borderRadius: BorderRadius.vertical(top: Radius.circular(36)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(36),
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomForm(),
                    FilledButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          child: Center(child: Text("Sign In")),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "New User? ",
                          style: TextStyle(
                            color: Colors.white54,
                          ),
                        ),
                        Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomForm extends StatefulWidget {
  const CustomForm({
    super.key,
  });

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final FocusNode _focusNodeUsername = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();

  Color usernameColor = Colors.white54;
  Color passwordColor = Colors.white54;

  void _focusChangeUsername() {
    setState(() {
      usernameColor =
          _focusNodeUsername.hasFocus ? Colors.white : Colors.white54;
    });
  }

  void _focusChangePassword() {
    setState(() {
      passwordColor =
          _focusNodePassword.hasFocus ? Colors.white : Colors.white54;
    });
  }

  @override
  void initState() {
    super.initState();
    _focusNodeUsername.addListener(_focusChangeUsername);
    _focusNodePassword.addListener(_focusChangePassword);
  }

  @override
  void dispose() {
    super.dispose();
    _focusNodeUsername.removeListener(_focusChangeUsername);
    _focusNodePassword.removeListener(_focusChangePassword);
    _focusNodeUsername.dispose();
    _focusNodePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          focusNode: _focusNodeUsername,
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: usernameColor),
            ),
            prefixIcon: Icon(
              Icons.person,
              color: usernameColor,
            ),
            labelText: "Username",
            labelStyle: TextStyle(color: usernameColor),
          ),
        ),
        TextFormField(
          focusNode: _focusNodePassword,
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: passwordColor),
            ),
            prefixIcon: Icon(
              Icons.lock,
              color: passwordColor,
            ),
            labelText: "Password",
            labelStyle: TextStyle(color: passwordColor),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            "Forget Password?",
            style: TextStyle(color: Colors.white54),
          ),
        ),
      ],
    );
  }
}
