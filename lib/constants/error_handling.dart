import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:travel_bud/constants/utils.dart';

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;

    case 400:
      showSnackbar(
        context,
        jsonDecode(response.body)['msg'],
        Colors.purple,
      );
      break;

    case 500:
      showSnackbar(
        context,
        jsonDecode(response.body)['error'],
        Colors.red,
      );
      break;

    default:
      showSnackbar(
        context,
        response.body,
        const Color.fromARGB(255, 6, 110, 86),
      );
  }
}
