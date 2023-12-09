import 'package:flutter/material.dart';
import 'package:petersfinal/aboutpage.dart';
import 'package:petersfinal/dataservice.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LocalDataService _localDataService;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _localDataService = LocalDataService();
    _localDataService.saveCredentials({
      'username': 'admin',
      'password': 'Password1',
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Peters Mobile App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Username:',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Enter your username'),
            ),
            SizedBox(height: 10),
            Text(
              'Password:',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Enter your password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _login(),
              child: Text('Sign In'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () => _navigateToAbout(),
                        child: Text('About'),
                      ),
                      Text(
                        'Version: 1.0.1',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _login() async {
  final savedCredentials = await _localDataService.getCredentials();
  final enteredUsername = _usernameController.text;

  if (savedCredentials == null || savedCredentials['username'] != enteredUsername) {
    _showSnackBar('Username does not exist');
  } else {
    final username = savedCredentials['username'];
    final password = savedCredentials['password'];

    if (_usernameController.text == username && _passwordController.text == password) {
      _showSnackBar('Login success');
    } else {
      _showSnackBar('Incorrect password');
    }
  }
}


  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _navigateToAbout() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AboutPage()),
    );
  }
}
