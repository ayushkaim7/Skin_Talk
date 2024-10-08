import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:skin_talk/navbar.dart';
import 'package:skin_talk/screens/scan/scanning.dart';
import 'package:slide_to_act/slide_to_act.dart';

List<CameraDescription> cameras = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const StartScan(),
    );
  }
}

class StartScan extends StatefulWidget {
  const StartScan({super.key});

  @override
  State<StartScan> createState() => _StartScanState();
}

class _StartScanState extends State<StartScan> {
  late CameraController controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    if (cameras.isNotEmpty) {
      controller = CameraController(cameras[1], ResolutionPreset.max);
      _initializeControllerFuture = controller.initialize().then((_) {
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

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(20, 245, 60, 227),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: CameraPreview(controller),
                  ),
                ),
                Expanded(
                    child: Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xffbbc4fa), Color(0x00d9d9d9)],
                ))))
              ],
            ),
            SizedBox(
              height: 320,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        24.0), // Adjust the radius value to change the roundness
                    color:
                        Color.fromARGB(224, 248, 248, 248), // Container color
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Let’s see\nWhat your skin says?",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(0, 11, 25, 1)),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  // Container(
                  //     width: 80,
                  //     height: 82,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(48),
                  //         color: Colors.white)),
                  SlideAction(
                    borderRadius: 48,
                    elevation: 1,
                    outerColor: Color.fromARGB(255, 255, 255, 255),
                    innerColor: Colors.purpleAccent,
                    textStyle:
                        TextStyle(color: Color.fromARGB(126, 223, 64, 251)),
                    onSubmit: () async {
                      try {
                        await _initializeControllerFuture;
                        XFile file = await controller.takePicture();
                        //print(file);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Scannig(message: file.path),
                          ),
                        );
                      } catch (e) {
                        print(e);
                      }
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => Scannig()),
                      // );
                    },
                  ),
                  SizedBox(
                    height: 32,
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 120,
                  child: Center(
                      child: Text(
                    "aling you face with rectangle",
                    style: TextStyle(color: Color.fromARGB(255, 66, 66, 66)),
                  )),
                ),
                Container(
                  height: 320,
                  width: 280,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromARGB(141, 243, 243, 243)),
                    borderRadius: BorderRadius.circular(
                        24.0), // Adjust the radius value to change the roundness
                    color: Color.fromARGB(29, 255, 255, 255), // Container color
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
