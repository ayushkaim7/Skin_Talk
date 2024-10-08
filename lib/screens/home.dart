import 'package:flutter/material.dart';
import 'package:skin_talk/screens/pi_widegt.dart';
import 'package:skin_talk/screens/scan/scan_result.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isNew = false;

  @override
  Widget build(BuildContext context) {
    //setState(() {});
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            HelloWidget(isNew: isNew),
            if (!isNew) const UpcomingWidget(),
            const SizedBox(
              height: 24,
            ),
            AnalysisTile(isNew: isNew),
            const SizedBox(
              height: 24,
            ),
            const HomeTiles(),
            Container(
              height: 100, // Adjust height as needed
            ),
          ],
        ),
      ),
    );
  }
}

//-------------------------------hello-widget is here-----------------------------------

class HelloWidget extends StatelessWidget {
  final bool isNew;
  const HelloWidget({super.key, required this.isNew});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!isNew) ...{
          const Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: CircleAvatar(
                  radius: 48,
                  backgroundColor: Color.fromARGB(96, 199, 199, 199),
                  child: Icon(
                    Icons.person_2,
                    size: 32,
                  ),
                ),
              ),
              Text("age:")
            ],
          )
        },
        const SizedBox(
          width: 32,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment:
                !isNew ? MainAxisAlignment.start : MainAxisAlignment.center,
            crossAxisAlignment:
                !isNew ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            //mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Hello ',
                      style: TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 122, 122, 122)),
                    ),
                    TextSpan(
                      text: 'Suhani,',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 33, 33, 33)),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                  !isNew
                      ? "Your Skin Looks Good today 👍🏻"
                      : "Lets Get Your First Scan Done 😁!!",
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                    color: Color.fromARGB(255, 30, 30, 30),
                  )),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ScanResult()));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 112, 188, 5))),
                // height: 40,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                child: const Text(
                  "Re Scan",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 112, 188, 5),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              if (!isNew) ...{
                const Text("  last sacnned: 2m ago",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 50, 50, 50),
                    ))
              }
            ],
          ),
        ),
      ],
    );
  }
}

//-------------------------------upcoming-widget is here-----------------------------------
class UpcomingWidget extends StatefulWidget {
  const UpcomingWidget({super.key});

  @override
  State<UpcomingWidget> createState() => _UpcomingWidgetState();
}

class _UpcomingWidgetState extends State<UpcomingWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 32,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "    Upcoming event",
              style: TextStyle(
                  fontSize: 14, color: Color.fromARGB(255, 35, 35, 35)),
            ),
            Expanded(child: Container()),
            const Text(
              "View All    ",
              style: TextStyle(
                  color: Color.fromARGB(255, 166, 182, 210),
                  decoration: TextDecoration.underline,
                  fontSize: 13,
                  decorationColor: Colors.black38),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        //const DocTile(),
        RoutinProductTile()
      ],
    );
  }
}

//------>//-------------------------Doc-Tile is here-----------------------------------
class DocTile extends StatelessWidget {
  const DocTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 236, 244, 255),
          border: Border.all(color: Colors.blue),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 24,
                backgroundColor: Color.fromARGB(96, 199, 199, 199),
                child: Icon(
                  Icons.person_2,
                  size: 16,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              RichText(
                //textScaleFactor: 1,
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Dr. Name Last Name\n',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color.fromARGB(255, 0, 81, 176)),
                    ),
                    //TextSpan(text: "\n"),
                    TextSpan(
                      text: 'Dermatologist,',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 0, 81, 176)),
                    ),
                  ],
                ),
              ),
              Expanded(child: Container()),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: Colors.black54,
                  ))
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              const Icon(
                Icons.watch_later,
                size: 22,
                color: Color.fromARGB(255, 94, 148, 212),
              ),
              const Text(
                '  11:00 pm - 11:30 pm',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 101, 118, 138)),
              ),
              Expanded(child: Container()),
              MaterialButton(
                onPressed: () {},
                color: const Color.fromARGB(255, 47, 129, 226),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  // side: const BorderSide(
                  //     //color: Color.fromARGB(255, 112, 188, 5)
                  //     )
                ),
                // height: 40,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                child: const Text(
                  " Join ",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 244, 244, 244),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

//------>//-------------------------Routin-Tile is here-----------------------------------
class RoutinProductTile extends StatelessWidget {
  const RoutinProductTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      //height: 150,
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color.fromARGB(255, 248, 183, 92)),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/serum.png",
            scale: 1,
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  //textScaleFactor: 1,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: '\nSerum Name 100% xyz\n',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                      TextSpan(
                        text: '\nStep 1 (current)\n',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.purple),
                      ),
                      TextSpan(
                          text: "\n",
                          style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w400,
                              color: Colors.purple)),
                      TextSpan(
                        text: '7:00am - 8:00am',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                // Expanded(child: Container()),

                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    MaterialButton(
                      onPressed: () {},
                      //color: const Color.fromARGB(255, 47, 129, 226),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        // side: const BorderSide(
                        //     //color: Color.fromARGB(255, 112, 188, 5)
                        //     )
                      ),
                      // height: 40,

                      child: const Text(
                        " missed ",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      //color: const Color.fromARGB(255, 47, 129, 226),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        // side: const BorderSide(
                        //     //color: Color.fromARGB(255, 112, 188, 5)
                        //     )
                      ),
                      // height: 40,

                      child: const Text(
                        " Done ",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Colors.black54,
              ))
        ],
      ),
    );
  }
}

//-------------------------------anaylsis-Tile is here-----------------------------------
class AnalysisTile extends StatefulWidget {
  final bool isNew; // New parameter

  const AnalysisTile({Key? key, required this.isNew})
      : super(key: key); // Constructor modified to accept isNew

  @override
  State<AnalysisTile> createState() => _AnalysisTileState();
}

class _AnalysisTileState extends State<AnalysisTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 200,
      alignment: Alignment.center,
      padding: widget.isNew
          ? const EdgeInsets.symmetric(vertical: 24, horizontal: 40)
          : EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color.fromARGB(48, 158, 158, 158)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.07), // Shadow color
              spreadRadius: 1, // Spread radius
              blurRadius: 8, // Blur radius
              offset: const Offset(0, 3), // Offset in x and y directions
            ),
          ]),
      child: widget.isNew
          ? Column(
              children: [
                const Text(
                  "Get Your Skin Score Now",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87),
                ),
                const SizedBox(
                  height: 12,
                ),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'more than ',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          color: Color.fromARGB(106, 0, 0, 0),
                        ),
                      ),
                      TextSpan(
                        text: '10,000+',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(189, 0, 0, 0),
                        ),
                      ),
                      TextSpan(
                        text: ' has used it to get better.',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          color: Color.fromARGB(106, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                MaterialButton(
                  onPressed: () {
                    //setState(() {});
                  },
                  color: const Color.fromARGB(255, 170, 78, 243),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    // side: const BorderSide(
                    //     //color: Color.fromARGB(255, 112, 188, 5)
                    //     )
                  ),
                  // height: 40,
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                  child: const Text(
                    "Get Now",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 244, 244, 244),
                    ),
                  ),
                )
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.circular(8)),
                      child: Icon(
                        Icons.energy_savings_leaf_outlined,
                        color: Colors.purple,
                        size: 28,
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    RichText(
                      //textScaleFactor: 1,
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Your Skin Score ',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.black),
                          ),
                          TextSpan(
                            text: '120\n',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.purple),
                          ),
                          TextSpan(
                            text: '\n',
                            style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 0, 81, 176)),
                          ),
                          TextSpan(
                            text: 'last scanned 2m ago,',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black45),
                          ),
                        ],
                      ),
                    ),
                    Expanded(child: Container()),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                          color: Colors.black54,
                        ))
                  ],
                ),
                Container(
                  //width: double.maxFinite,
                  padding: EdgeInsets.only(left: 16),
                  alignment: Alignment.centerRight,
                  height: 140,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            HollowPieChart(slices: [
                              PieSlice(color: Colors.purple, value: index * 10),
                              PieSlice(
                                  color: Colors.black12,
                                  value: 100 - index * 10),
                            ]),
                            Text("bimari"),
                            Text("5%")
                          ],
                        ),
                      );
                    },
                  ),
                ),
                // Add more widgets as needed...
              ],
            ),
    );
  }
}

//-------------------------------Home-Tiles is here-----------------------------------

class HomeTiles extends StatefulWidget {
  const HomeTiles({super.key});

  @override
  State<HomeTiles> createState() => _HomeTilesState();
}

class _HomeTilesState extends State<HomeTiles> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InstantConnectTile(),
        SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Expanded(flex: 1, child: Routin()),
            SizedBox(
              width: 8,
            ),
            Expanded(child: SkinAi()),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Expanded(flex: 2, child: Explore()),
            SizedBox(
              width: 8,
            ),
            Expanded(child: FeedBack()),
          ],
        )
      ],
    );
  }
}

//-------------------------------InstantConnect-Tiles is here-----------------------------------

class InstantConnectTile extends StatefulWidget {
  const InstantConnectTile({super.key});

  @override
  State<InstantConnectTile> createState() => _InstantConnectTileState();
}

class _InstantConnectTileState extends State<InstantConnectTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black38),
          borderRadius: BorderRadius.circular(8)),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Expanded(
          flex: 5,
          //width: MediaQuery.of(context).size.width * 0.55,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Instant Connect",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Seek instant help form a dermat via call or message.",
                softWrap: true,
                style: TextStyle(fontSize: 11, color: Colors.black87),
              )
            ],
          ),
        ),
        Expanded(child: Container()),
        //Expanded(child: Container()),
        Expanded(
          child: GestureDetector(
            onTap: () {},
            child: const Column(
              children: [
                Icon(
                  Icons.video_call_rounded,
                  color: Color.fromARGB(255, 15, 148, 19),
                  size: 29,
                ),
                Text(
                  "call",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.black54),
                )
              ],
            ),
          ),
        ),
        Expanded(child: Container()),
        Expanded(
          child: GestureDetector(
            onTap: () {},
            child: const Column(
              children: [
                Icon(
                  Icons.chat_bubble_outline_rounded,
                  color: Color.fromARGB(82, 0, 0, 0),
                  size: 24,
                ),
                Text(
                  "chat",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.black54),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

//-------------------------------Routin-Tile is here-----------------------------------

class Routin extends StatefulWidget {
  const Routin({super.key});

  @override
  State<Routin> createState() => _RoutineState();
}

class _RoutineState extends State<Routin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black38),
          borderRadius: BorderRadius.circular(8)),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
          //width: MediaQuery.of(context).size.width * 0.55,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Get a Routine",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  Expanded(child: Container()),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.purple,
                    size: 14,
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "See How Your Routine is Going. Need help?",
                softWrap: true,
                style: TextStyle(fontSize: 11, color: Colors.black87),
              )
            ],
          ),
        ),
      ]),
    );
  }
}

//-------------------------------SkinAi-Tile is here-----------------------------------

class SkinAi extends StatefulWidget {
  const SkinAi({super.key});

  @override
  State<SkinAi> createState() => _SkinAiState();
}

class _SkinAiState extends State<SkinAi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue, Colors.purple, Colors.amber],
        ),
      ),
      child: Container(
        //width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        decoration: BoxDecoration(
            // border: Border.all(color: Colors.transparent),
            color: Colors.white,
            borderRadius: BorderRadius.circular(8)),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            //width: MediaQuery.of(context).size.width * 0.55,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShaderMask(
                  blendMode: BlendMode.srcATop,
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.amber,
                        Colors.purple,
                        Colors.purple,
                        Colors.blue
                      ],
                    ).createShader(bounds);
                  },
                  child: Text(
                    'Skin AI',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors
                          .white, // Text color will be overridden by ShaderMask
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Chat all your skin related issues & concerns",
                  softWrap: true,
                  style: TextStyle(fontSize: 11, color: Colors.black87),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

//-------------------------------Explore-Tile is here-----------------------------------

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black38,
          ),
          borderRadius: BorderRadius.circular(8)),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
          //width: MediaQuery.of(context).size.width * 0.55,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Explore\nCommunity",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Expanded(child: Container()),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.purple,
                    size: 14,
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "See How Your Routine is Going. Need help?",
                softWrap: true,
                style: TextStyle(fontSize: 11, color: Colors.black87),
              )
            ],
          ),
        ),
      ]),
    );
  }
}

//-------------------------------FeedBack-Tile is here-----------------------------------

class FeedBack extends StatefulWidget {
  const FeedBack({super.key});

  @override
  State<FeedBack> createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(8)),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
          //width: MediaQuery.of(context).size.width * 0.55,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "+",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: Colors.purple),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Tell Us Your Exprince With Us.",
                softWrap: true,
                style: TextStyle(fontSize: 11, color: Colors.black45),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
