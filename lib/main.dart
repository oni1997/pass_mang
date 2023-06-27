import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PasswordManager(),
    );
  }
}

class PasswordManager extends StatefulWidget {
  @override
  _PasswordManagerState createState() => _PasswordManagerState();
}

class _PasswordManagerState extends State<PasswordManager> {
  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _savePassword() async {
    final String website = _websiteController.text;
    final String username = _usernameController.text;
    final String password = _passwordController.text;

    final response = await savePasswordLocally(website, username, password);

    if (response == 'success') {
      // Password saved successfully
      _websiteController.clear();
      _usernameController.clear();
      _passwordController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password saved successfully')),
      );
    } else {
      // Failed to save password
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save password')),
      );
    }
  }

  Future<String> savePasswordLocally(
      String website, String username, String password) async {
    final Map<String, String> data = {
      'website': website,
      'username': username,
      'password': password,
    };

    // Send the data to the Python backend locally
    final response = await Future.delayed(Duration(seconds: 1), () {
      // Simulating delay for local file operation
      try {
        // Make a POST request to the local Python server
        // Replace 'http://localhost:5000/save-password' with your local server URL
        // Make sure your local server is running on the specified URL
        http.post(
          Uri.parse('http://localhost:5000/save-password'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(data),
        );

        return 'success';
      } catch (e) {
        return 'failure';
      }
    });

    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password Manager'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _websiteController,
              decoration: InputDecoration(labelText: 'Website'),
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            ElevatedButton(
              onPressed: _savePassword,
              child: Text('Save Password'),
            ),
          ],
        ),
      ),
    );
  }
}