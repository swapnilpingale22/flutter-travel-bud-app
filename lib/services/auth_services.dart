// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:travel_bud/constants/error_handling.dart';
import 'package:travel_bud/constants/utils.dart';
import 'package:travel_bud/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:travel_bud/screens/login/login_screen.dart';
import 'package:travel_bud/screens/onbooarding/homestay_title.dart';
import 'package:travel_bud/secrets/secret.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/user_provider.dart';

class AuthService {
//sign up user
  void signUpUser({
    required BuildContext context,
    required String name,
    required int mobileNo,
    required String email,
    required String password,
  }) async {
    try {
      UserModel user = UserModel(
        name: name,
        mobileNo: mobileNo,
        email: email,
        password: password,
        type: '',
        id: '',
        token: '',
      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: json.encode(user.toJson()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackbar(
            context,
            'Account created',
            Colors.green,
          );
        },
      );
    } catch (e) {
      showSnackbar(
        context,
        e.toString(),
        Colors.brown,
      );
    }
  }

  //sign in user
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/Json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          showSnackbar(
            context,
            "You're signed in",
            Colors.green,
          );
          final prefs = await SharedPreferences.getInstance();

          Provider.of<UserProvider>(context, listen: false).setUser(res.body);

          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);

          Navigator.pushNamedAndRemoveUntil(
            context,
            HomeStayTitle.routeName,
            (route) => false,
          );
        },
      );
    } catch (e) {
      showSnackbar(
        context,
        e.toString(),
        Colors.brown,
      );
    }
  }

  //get user data
  void getUserData(
    BuildContext context,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('$uri/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        },
      );

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('$uri/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
        );

        var userProvider = Provider.of<UserProvider>(
          context,
          listen: false,
        );
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
      );
    }
  }

  void logOut(BuildContext context) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      await prefs.setString('x-auth-token', '');

      Navigator.pushNamedAndRemoveUntil(
        context,
        LoginScreen.routeName,
        (route) => false,
      );

      showSnackbar(
        context,
        'You are logged out successfully.',
        Colors.green,
      );
    } catch (e) {
      showSnackbar(
        context,
        e.toString(),
        Colors.brown,
      );
    }
  }
}
