import 'package:flutter/material.dart';
import 'login.dart';
import 'verification.dart';
import 'otp.dart';
import 'mpin.dart';
import 'dashboard.dart';

final RouteObserver<ModalRoute<void>> routeObserver = RouteObserver<ModalRoute<void>>();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final _lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.grey[100],
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      labelStyle: const TextStyle(color: Colors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        minimumSize: const Size.fromHeight(48),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: Colors.teal),
    ),
    iconTheme: const IconThemeData(color: Colors.black),
  );

  static final _darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.teal,
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFF2A2A2A),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide.none,
      ),
      labelStyle: TextStyle(color: Colors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
        minimumSize: const Size.fromHeight(48),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: Colors.teal),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample Application',
      theme: _lightTheme,
      darkTheme: _darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/',
      navigatorObservers: [routeObserver],
      routes: {
        '/': (_) =>  LoginPage(),
        '/verification': (_) =>  VerificationPage(),
        '/otp': (_) =>  OTPPage(),
        '/mpin': (_) =>  MPINPage(),
        '/dashboard': (_) =>  DashboardPage(),
      },
    );
  }
}
