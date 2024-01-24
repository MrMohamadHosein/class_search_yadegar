// admin_login_page.dart
import 'package:flutter/material.dart';

class AdminLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/admin_logo.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            // Username Field
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15.0),
            // Password Field
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            // Login Button
            ElevatedButton(
              onPressed: () {
                // Add your login logic here
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
