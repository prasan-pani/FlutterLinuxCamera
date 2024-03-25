import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraPreviewScreen extends StatefulWidget {
  final CameraDescription camera;

  const CameraPreviewScreen({Key? key, required this.camera}) : super(key: key);

  @override
  CameraPreviewScreenState createState() => CameraPreviewScreenState();
}

class CameraPreviewScreenState extends State<CameraPreviewScreen> {
  late CameraController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      body: CameraPreview(_controller),
    );
  }
}