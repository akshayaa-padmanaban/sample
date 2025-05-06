import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main.dart';

class MPINPage extends StatefulWidget {
  @override
  _MPINPageState createState() => _MPINPageState();
}

class _MPINPageState extends State<MPINPage> with RouteAware {
  final _ctrl = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    _ctrl.dispose();
    super.dispose();
  }

  @override
  void didPopNext() => _ctrl.clear();

  void _verify() => Navigator.pushNamed(context, '/dashboard');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MPIN Authentication")),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.lock_outline, size: 48, color: Colors.tealAccent[700]),
            SizedBox(height: 16),
            TextField(
              controller: _ctrl,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(4),
              ],
              obscureText: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(labelText: 'Enter 4‑digit MPIN'),
            ),
            SizedBox(height: 24),
            ElevatedButton(onPressed: _verify, child: Text('Verify MPIN')),
            TextButton(onPressed: () {}, child: Text('Forgot MPIN?')),
          ],
        ),
      ),
    );
  }
}
