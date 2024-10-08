import 'package:flutter/material.dart';
import 'package:skin_talk/screens/home.dart';
import 'package:skin_talk/screens/scan/test.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 1;
  List<Widget> screens = [
    const Test(),
    const Home(),
    const Test(),
    const Test()
  ];
  List<Widget> titles = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // endDrawerEnableOpenDragGesture:true, BoxDecoration(
      //     gradient: LinearGradient(
      //       begin: Alignment.topCenter,
      //       end: Alignment.bottomCenter,
      //       colors: [
      //         Colors.blue,
      //         Colors.purple,
      //         Colors.amber,
      //       ],
      //     ),
      //   ),
      appBar: AppBar(
        scrolledUnderElevation: 2,
        surfaceTintColor: Colors.white,
        toolbarHeight: 64,
        backgroundColor: Colors.white,
        //toolbarOpacity: 0.5,
        //elevation: 2,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 16,
            ),
            Image.asset(
              'assets/images/logonbg.png',
              scale: 2.7,
            ),
            Expanded(child: Container()),
            IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 2;
                  });
                },
                icon: const Icon(
                  Icons.menu_rounded,
                  size: 29,
                  color: Color.fromARGB(173, 0, 0, 0),
                )),
            SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        width: double.infinity,
        // height: 116,
        padding:
            const EdgeInsets.only(left: 24.0, top: 4, right: 24, bottom: 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(10), // Add border radius if needed
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 215, 215, 215)
                  .withOpacity(0.30), // Shadow color
              spreadRadius: 1, // Spread radius
              blurRadius: 8, // Blur radius
              offset: Offset(0, 0), // Changes position of shadow
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          elevation: 0,
          selectedFontSize: 12,
          selectedIconTheme: IconThemeData(size: 28),
          selectedItemColor: Color.fromARGB(255, 161, 104, 240),
          unselectedFontSize: 12,
          showUnselectedLabels: true,
          enableFeedback: true,
          unselectedItemColor: Color.fromARGB(137, 93, 96, 101),
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: currentIndex == 0
                  ? Image.asset(
                      'assets/images/ai.png',
                      scale: 7,
                    )
                  : Image.asset(
                      'assets/images/nai2.png',
                      scale: 8,
                    ),
              label: "",
              //tooltip: "hiiiii",
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_rounded,
                  size: 32,
                ),
                label: "Home",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.explore_outlined,
                  size: 32,
                ),
                label: "Explore",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Stack(alignment: Alignment.topRight, children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 32,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    radius: 6,
                    child: Text(
                      "5+",
                      style: TextStyle(color: Colors.white, fontSize: 8),
                    ),
                  )
                ]),
                label: "Store",
                backgroundColor: Colors.white),
          ],
        ),
      ),
    );
  }
}

class AnimatedGradientText extends StatefulWidget {
  final String text;
  final LinearGradient gradient;

  AnimatedGradientText({required this.text, required this.gradient});

  @override
  _AnimatedGradientTextState createState() => _AnimatedGradientTextState();
}

class _AnimatedGradientTextState extends State<AnimatedGradientText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          colors: [
            widget.gradient.colors.first,
            widget.gradient.colors.last,
          ],
          stops: [_animation.value - 0.8, _animation.value],
        ).createShader(bounds);
      },
      blendMode: BlendMode.srcIn,
      child: Text(
        widget.text,
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: Colors.black, // Set the text color to black to make it visible
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
