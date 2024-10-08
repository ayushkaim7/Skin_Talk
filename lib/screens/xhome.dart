import 'package:flutter/material.dart';
import 'package:skin_talk/widgets.dart';

import '../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            "Hello User",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              const CircleAvatar(
                radius: 56,
                backgroundColor: Color.fromARGB(96, 199, 199, 199),
                child: Icon(
                  Icons.person_2,
                  size: 32,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Container(
                width: 200,
                padding: const EdgeInsets.all(24),
                child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Good Looks",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: 8,
                      ),
                      Text("Last Scanned 2h ago",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.normal))
                    ]),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 140, 245, 143)),
                  borderRadius: BorderRadius.circular(
                      24.0), // Adjust the radius value to change the roundness
                  color: const Color(0x265fd835), // Container color
                ),
              )
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 32,
              ),
              const Text(
                "age: 22",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 64,
              ),
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
                      borderRadius:
                          BorderRadius.circular(50), // Set border radius
                      side: const BorderSide(color: Colors.green, width: 1),
                    )),
                child: const Text(
                  "Re scan",
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          const Text(
            "Upcoming appointment",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
          ),
          const SizedBox(
            height: 16,
          ),
          const DoctorTile(),
          const SizedBox(
            height: 24,
          ),
          const Text(
            "Your morning routine",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
          ),
          const SizedBox(
            height: 16,
          ),
          const Column(
            children: [
              Row(
                children: [
                  Text("Balck heads",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "2",
                    style: TextStyle(color: Colors.green, fontSize: 16),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "-4%",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text("dark spots",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "1",
                    style: TextStyle(color: Colors.green, fontSize: 16),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "-0%",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text("nodules",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "3",
                    style: TextStyle(color: Colors.green, fontSize: 16),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "-14%",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text("Papules",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "0",
                    style: TextStyle(color: Colors.green, fontSize: 16),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "0%",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text("Wrinkle",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "23%",
                    style: TextStyle(color: Colors.green, fontSize: 16),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "-4%",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text("Moisture",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "34%",
                    style: TextStyle(color: Colors.green, fontSize: 16),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "+6%",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
            ],
          )
        ]),
      ),
    );
  }
}
