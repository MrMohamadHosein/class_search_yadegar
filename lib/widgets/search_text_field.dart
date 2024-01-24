// widgets/search_text_field.dart

import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;

  const SearchTextField({required this.controller, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextField(
        controller: controller,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.right,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'IranSans',
          color: Colors.black,
        ),
        decoration: InputDecoration(
          floatingLabelAlignment: FloatingLabelAlignment.start,
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'IranSans',
            color: Colors.black,
          ),
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.white70,
        ),
      ),
    );
  }
}
