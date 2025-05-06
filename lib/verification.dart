import 'package:flutter/material.dart';

class VerificationPage extends StatelessWidget {
  void _sendOTP(BuildContext ctx) {
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(content: Text('OTP Sent Successfully')),
    );
    Future.delayed(Duration(seconds: 1), () => Navigator.pushNamed(ctx, '/otp'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Send OTP")),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () => _sendOTP(context),
          icon: Icon(Icons.send),
          label: Text("Send OTP"),
        ),
      ),
    );
  }
}
