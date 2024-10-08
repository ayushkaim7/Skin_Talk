import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:skin_talk/main.dart';
import 'package:skin_talk/screens/scan/scan_result.dart';

class Scannig extends StatefulWidget {
  final String? message;

  const Scannig({super.key, this.message});

  @override
  State<Scannig> createState() => _ScannigState();
}

class _ScannigState extends State<Scannig> {
  double progressValue = 0.0;
  List<String> subtitles = ["scanning...", "analyzing...", "finishing..."];

  void simulateProgress() {
    const duration = const Duration(milliseconds: 100);
    new Timer.periodic(duration, (Timer timer) {
      setState(() {
        progressValue += 0.01;
        setState(() {}); // Simulating a 1% increment
        if (progressValue >= 1.0) {
          timer.cancel();

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ScanResult(
                      message: widget.message,
                    )),
          );
          // Stop the timer when progress reaches 100%
        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    simulateProgress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: widget.message != null
                      ? Image.file(File(widget.message!))
                      : Center(child: CircularProgressIndicator()),
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
              height: 280,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        24.0), // Adjust the radius value to change the roundness
                    color: const Color.fromARGB(
                        224, 248, 248, 248), // Container color
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(28.0),
                    child: Text(
                      "Be Patient\nand Smile :)",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(0, 11, 25, 1)),
                    ),
                  ),

                  Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: Column(children: [
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: LinearProgressIndicator(value: progressValue),
                      ),
                      const SizedBox(height: 8),
                      Text(
                          progressValue < 0.30
                              ? subtitles[0]
                              : progressValue > 0.70
                                  ? subtitles[2]
                                  : subtitles[1],
                          style: const TextStyle(color: Colors.purpleAccent)),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const StartScan()),
                          );
                        },
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                              color: Color.fromARGB(255, 246, 114, 105),
                              fontSize: 16),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  50), // Set border radius
                              side: BorderSide(color: Colors.red, width: 1),
                            )),
                      )
                    ]),
                  ),
                  // SlideAction(
                  //   borderRadius: 48,
                  //   elevation: 1,
                  //   outerColor: Color.fromARGB(255, 255, 255, 255),
                  //   innerColor: Colors.purpleAccent,
                  //   textStyle:
                  //       TextStyle(color: Color.fromARGB(126, 223, 64, 251)),
                  //   onSubmit: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => StartScan()),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 120,
                ),
                Container(
                  height: 320,
                  width: 280,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromARGB(141, 216, 117, 241), width: 2),
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
