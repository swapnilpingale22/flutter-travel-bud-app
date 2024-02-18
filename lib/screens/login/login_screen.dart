// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_bud/common_widgets/custom_button.dart';
import 'package:travel_bud/common_widgets/custom_textfield.dart';
import 'package:travel_bud/screens/login/sign_up_screen.dart';
import 'package:travel_bud/screens/onbooarding/homestay_title.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login-screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isChecked = false;
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  bool _isPasswordVisible = false;
  bool _isObscure = true;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const SizedBox(height: 30),
                const Text(
                  'Test Bud',
                  style: TextStyle(
                    fontSize: 46,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Glad to see you!',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  child: Form(
                    key: _signInFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Email'),
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Enter your email',
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Please enter your Email';
                            }
                            if (!emailRegex.hasMatch(val)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        const Text('Password'),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'Enter your password',
                          obscureTextValue: _isObscure,
                          suffixIcon: IconButton(
                            icon: _isPasswordVisible
                                ? const Icon(
                                    CupertinoIcons.eye_slash_fill,
                                    color: Colors.blue,
                                  )
                                : const Icon(
                                    CupertinoIcons.eye_fill,
                                    color: Colors.black26,
                                  ),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Please enter your Password';
                            }
                            if (val.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          width: double.infinity,
                          child: InkWell(
                            onTap: () {},
                            child: const Text(
                              'Forgot Password?',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (newValue) {
                        setState(() {
                          _isChecked = newValue!;
                        });
                      },
                      activeColor: Colors.blue,
                    ),
                    const Text('Remember Me'),
                  ],
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: 'Login',
                  onTap: () {
                    if (_signInFormKey.currentState!.validate()) {
                      Navigator.pushNamed(
                        context,
                        HomeStayTitle.routeName,
                      );
                    }
                  },
                ),
                const SizedBox(height: 10),
                const Text(
                  'OR',
                  style: TextStyle(
                    color: Colors.black38,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.red,
                      child: FaIcon(
                        FontAwesomeIcons.google,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 50),
                    CircleAvatar(
                      backgroundColor: Colors.blue.shade800,
                      child: const FaIcon(
                        FontAwesomeIcons.facebookF,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Dont have an account? '),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          SignUpScreen.routeName,
                        );
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
