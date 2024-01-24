// widgets/search_button.dart

import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SearchButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'جست و جو',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'IranSans',
            color: Colors.white,
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.orange,
      ),
    );
  }
}
