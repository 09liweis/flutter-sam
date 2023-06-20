import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../widgets/dialog.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  showComfirmDialog(message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ComfirmDialog(title: 'Login Error', message: message);
      },
    );
  }

  Future<void> _login() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      print(username);
      return;
    }

    // Your API endpoint for login
    String url = 'https://samliweisen.onrender.com/api/user/login';

    // Create the request body
    Map<String, String> requestBody = {
      'eml': username,
      'pwd': password,
    };

    try {
      final response = await http.post(Uri.parse(url), body: requestBody);

      if (response.statusCode == 200) {
        // Login successful
        var responseData = jsonDecode(response.body);
        print(responseData);
        // Do something with the response data
      } else {
        // Login failed
        var error = jsonDecode(response.body)['msg'];
        // Show an error message to the user
        showComfirmDialog(error);
      }
    } catch (e) {
      // Error occurred during the API call
      showComfirmDialog('An error occurred. Please try again later.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Login'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Login',
              style: TextStyle(
                  fontSize: 30, fontFamily: 'Roboto', color: Colors.green),
            ),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              child: const Text('Login'),
              onPressed: _login,
            ),
          ],
        ),
      ),
    );
  }
}
