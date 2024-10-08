import 'dart:io';

import 'package:flutter/material.dart';
import 'package:skin_talk/navbar.dart';
import 'package:skin_talk/widgets.dart';

import '../../main.dart';

class ScanResult extends StatelessWidget {
  final String? message;
  final response;
  const ScanResult({super.key, this.message, this.response});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Result"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => NavBar()),
            );
          },
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const StartScan()),
              );
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50), // Set border radius
                  side: const BorderSide(color: Colors.green, width: 1),
                )),
            child: const Text(
              "Re scan",
              style: TextStyle(color: Colors.green),
            ),
          ),
          const SizedBox(
            width: 24,
          )
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                ClipOval(
                  child: Image.file(
                    File(message!),
                    width: 120, // Adjust width and height as needed
                    height: 120,
                    fit: BoxFit
                        .cover, // Adjust how the image is fitted inside the circle
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Oily Skin",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.48,
                      padding: EdgeInsets.all(24),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Little Acne",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500)),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                                "you have mild acnes found on face which..read more",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal))
                          ]),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(255, 245, 140, 140)),
                        borderRadius: BorderRadius.circular(
                            24.0), // Adjust the radius value to change the roundness
                        color: Color(0x38ffb8af), // Container color
                      ),
                    )
                  ],
                )
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Text(
                  "age: 22",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 64,
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("black heads",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "2",
                      style: TextStyle(color: Colors.green, fontSize: 16),
                    ),
                    SizedBox(
                      width: 32,
                    ),
                    Text("dark spots",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "0",
                      style: TextStyle(color: Colors.green, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text("nodules",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "2",
                      style: TextStyle(color: Colors.green, fontSize: 16),
                    ),
                    SizedBox(
                      width: 64,
                    ),
                    Text("Wrinke",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "23%",
                      style: TextStyle(color: Colors.green, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text("papules",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "00",
                      style: TextStyle(color: Colors.green, fontSize: 16),
                    ),
                    SizedBox(
                      width: 64,
                    ),
                    Text("Texture",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "1",
                      style: TextStyle(color: Colors.green, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text("pustules",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "0",
                      style: TextStyle(color: Colors.green, fontSize: 16),
                    ),
                    SizedBox(
                      width: 64,
                    ),
                    Text("Moisture",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "43%",
                      style: TextStyle(color: Colors.green, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 48, vertical: 24),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("See AI recomandations       ->",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                      ]),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromARGB(255, 140, 245, 143)),
                    borderRadius: BorderRadius.circular(
                        50.0), // Adjust the radius value to change the roundness
                    color: Color(0x265fd835), // Container color
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 48, vertical: 24),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("How To Change Your\nDite?",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                        Icon(Icons.info)
                      ]),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromARGB(255, 161, 161, 161)),
                    borderRadius: BorderRadius.circular(
                        24.0), // Adjust the radius value to change the roundness
                    color: Color.fromARGB(8, 94, 216, 53), // Container color
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  "Doctor near You",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                ),
                SizedBox(
                  height: 16,
                ),
                DoctorTile()
              ],
            )
          ]),
        ),
      )),
    );
  }
}
