import 'package:flutter/material.dart';

class DoctorTile extends StatelessWidget {
  const DoctorTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            12.0), // Adjust the radius value to change the roundness
        color: Color.fromARGB(255, 209, 151, 255), // Container color
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: Color.fromARGB(96, 199, 199, 199),
              child: Icon(
                Icons.person_2,
                size: 32,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Doctor Micheal Gua",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
                Text("Doctor Micheal Gua",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white))
              ],
            )
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          width: 230,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                4.0), // Adjust the radius value to change the roundness
            color: Color.fromARGB(255, 186, 99, 255), // Container color
          ),
          child: Column(children: [
            Row(
              children: [
                Icon(
                  Icons.watch_later_rounded,
                  size: 24,
                  color: Colors.white,
                ),
                Text(
                  "   Sep 5 at 11:00 am - 1:00 pm",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                )
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.gps_fixed,
                  size: 24,
                  color: Colors.white,
                ),
                Text(
                  "  online",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                )
              ],
            )
          ]),
        )
      ]),
    );
  }
}
