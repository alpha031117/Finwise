import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//need context to accurately locate the widget in widget tree
void showSnackBar({required BuildContext context, required String text}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

void httpErrorHandle(
    {required http.Response response,
    required BuildContext
        context, //a locator to track widget in the widget tree SO THAT SNACK BAR COULD BE SHOWN SUCCUSSFULLY
    required VoidCallback onSuccess}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400: //client error
      showSnackBar(context: context, text: json.decode(response.body)['msg']);
      break;
    case 500: //server error
      showSnackBar(context: context, text: json.decode(response.body)['error']);
      break;
    default:
      showSnackBar(context: context, text: response.body);
      break;
  }
}
