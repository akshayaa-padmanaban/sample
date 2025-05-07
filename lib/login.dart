import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> with RouteAware {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void didPopNext() {
    usernameController.clear();
    passwordController.clear();
  }

  Future<void> onLogin() async {
    setState(() => isLoading = true);
    await Future.delayed(Duration(seconds: 1));
    setState(() => isLoading = false);
    Navigator.pushNamed(context, '/verification');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 24),
                  TextField(
                    controller: usernameController,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))],
                    decoration: InputDecoration(labelText: 'Username'),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'Password'),
                  ),
                  SizedBox(height: 24),
                  isLoading
                      ? Center(child: CircularProgressIndicator())
                      : ElevatedButton(onPressed: onLogin, child: Text('Log In')),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text('Forgot Password?'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
