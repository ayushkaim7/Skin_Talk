import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class StartScan extends StatefulWidget {
  const StartScan({super.key});

  @override
  State<StartScan> createState() => _StartScanState();
}

class _StartScanState extends State<StartScan> {
  List<CameraDescription> cameras = [];
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    callCam();
    if (cameras.isNotEmpty) {
      controller = CameraController(cameras[0], ResolutionPreset.max);
      controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      }).catchError((Object e) {
        if (e is CameraException) {
          switch (e.code) {
            case 'CameraAccessDenied':
              print("access was denied");
              break;
            default:
              print(e.description);
              break;
          }
        }
      });
    }
  }

  void callCam() async {
    cameras = await availableCameras();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: CameraPreview(controller),
    );
  }
}
