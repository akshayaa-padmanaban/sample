import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main.dart';

class OTPPage extends StatefulWidget {
  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> with RouteAware {
  final List<TextEditingController> _ctrls = List.generate(6, (_) => TextEditingController());

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    _ctrls.forEach((c) => c.dispose());
    super.dispose();
  }

  @override
  void didPopNext() {
    _ctrls.forEach((c) => c.clear());
  }

  void _verify() => Navigator.pushNamed(context, '/mpin');
  void _resend() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('OTP Resent')));
    _ctrls.forEach((c) => c.clear());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Verify OTP")),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Text('Enter the 6‑digit code', style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6, (i) {
                return Container(
                  width: 40,
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  child: TextField(
                    controller: _ctrls[i],
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(counterText: ''),
                    onChanged: (v) {
                      if (v.isNotEmpty && i < 5) FocusScope.of(context).nextFocus();
                    },
                  ),
                );
              }),
            ),
            SizedBox(height: 24),
            ElevatedButton(onPressed: _verify, child: Text('Verify')),
            TextButton(onPressed: _resend, child: Text('Resend OTP')),
          ],
        ),
      ),
    );
  }
}
