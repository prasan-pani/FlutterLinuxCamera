import 'package:flutter/material.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'hello_ffi.dart'; // Import your FFI bindings

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _nativeMessage = 'Unknown';

  @override
  void initState() {
    super.initState();
    _loadNativeMessage();
  }

  // Load message from the native code
  void _loadNativeMessage() {
    final Pointer<Utf8> messagePtr = getHelloWorld();
    setState(() {
      _nativeMessage = messagePtr.toDartString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter FFI Demo'),
        ),
        body: Center(
          // Display the native message in a Text widget
          child: Text(_nativeMessage),
        ),
      ),
    );
  }
}
