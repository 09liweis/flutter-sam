import 'package:flutter/material.dart';
import 'package:fluttersam/screens/profile_screen.dart';
import 'package:fluttersam/services/api_service.dart';
import 'package:fluttersam/utils/share_preferences.dart';
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
      showComfirmDialog('username or passowrd is empty');
      return;
    }

    // Your API endpoint for login
    String url = 'user/login';

    // Create the request body
    Map<String, String> requestBody = {
      'eml': username,
      'pwd': password,
    };

    try {
      final response = await ApiService.post(url, requestBody);
      var responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // Login successful
        SharedPreferencesHelper.setUserToken(responseBody['token']);

        // Navigate to the profile screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
      } else {
        // Login failed
        var error = responseBody['msg'];
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
              'Please Login',
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
            const SizedBox(height: 40.0),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.amber)),
              child: const Text('Login'),
              onPressed: _login,
            ),
          ],
        ),
      ),
    );
  }
}
