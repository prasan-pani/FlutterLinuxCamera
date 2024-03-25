import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io' show Platform;

import 'camera_preview.dart';

List<CameraDescription>? cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid || Platform.isIOS) {
    cameras = await availableCameras();
  }

  runApp(const CameraApp());
}

class CameraApp extends StatelessWidget {
  const CameraApp({super.key});

  @override
  Widget build(BuildContext context) {
    final CameraDescription? frontCamera = cameras?.isNotEmpty == true ? cameras?.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.front,
    ) : null;

    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Platform.isLinux ? const LinuxCameraView() : (frontCamera != null ? CameraPreviewScreen(camera: frontCamera) : const Text('No front camera found')),
        )
      ),
    );
  }
}

class LinuxCameraView extends StatelessWidget {
  final MethodChannel _channel = const MethodChannel('com.example.flutter_linux_camera_app/linux_camera');

  const LinuxCameraView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _getCameraView(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          // Placeholder for actual camera view. You might want to return an Image widget or similar here.
          return Center(child: Text('Camera view would be here. Data: ${snapshot.data}'));
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }

  Future<String> _getCameraView() async {
    final String cameraView = await _channel.invokeMethod('getCameraView');
    return cameraView;
  }
}