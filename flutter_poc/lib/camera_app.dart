import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'camera_preview.dart';

class CameraApp extends StatelessWidget {
  final CameraDescription camera;

  const CameraApp({Key? key, required this.camera}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CameraPreviewScreen(camera: camera),
    );
  }
}