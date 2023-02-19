import 'package:flutter/material.dart';

class CustomSnackBar {
  static showSnack(context, String message, Color color ){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message, style:TextStyle( fontSize: 16, fontWeight: FontWeight.w500 , color: color),))
    );
  }
}