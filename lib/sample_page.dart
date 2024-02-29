import 'package:flutter/material.dart';

class samplePage extends StatefulWidget {
  const samplePage({super.key});

  @override
  State<samplePage> createState() => _samplePageState();
}

class _samplePageState extends State<samplePage> {
  // properties of the front image
  double image_height = 400,
      image_width = 400,
      image_posX = -10,
      image_posY = 400;

  // Properties of the shape
  double FrontShape_height = 550,
      FrontShape_width = 400,
      Front_border_x = 50,
      Front_border_y = 180,
      Back_border_x = 50,
      Back_border_y = 180,
      BackShape_height = 800,
      BackShape_width = 480,
      Shape_posX = 80,
      Shape_posY = 380,
      BackShapePosition = 30;

  // Keeps track of current page
  bool pageChanged = false;

  // Animation transition time. Change value to speed up or slow down the transition
  Duration AnimationTime = Duration(milliseconds: 900);

  // Function to change page content
  void page_change() {
    setState(() {
      BackShape_height += 300;
      FrontShape_height += 400;
      Shape_posY -= 200;
      image_height += 20;
      image_width += 20;
      Front_border_x += 300;
      Front_border_y += 400;
      Back_border_x += 100;
      Back_border_y -= 400;
      BackShapePosition -= 30;
      BackShape_width += 50;
      image_posX += 8;
      image_posY -= 200;
      pageChanged = !pageChanged;
    });
  }

  @override
  Widget build(BuildContext context) {
    double mq = MediaQuery.of(context).size.width;

    Column first_page = Column(
      children: [
        // Research
        SizedBox(
          width: mq * 0.9,
          child: ElevatedButton(
            onPressed: page_change,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 0,
              side: const BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: const Text(
              'Research',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                letterSpacing: 0.8,
              ),
            ),
          ),
        ),

        // Our Team
        SizedBox(
          width: mq * 0.9,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 0,
              side: const BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: const Text(
              'Our Team',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                letterSpacing: 0.8,
              ),
            ),
          ),
        ),

        // Training
        SizedBox(
          width: mq * 0.9,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 0,
              side: const BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: const Text(
              'Training',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                letterSpacing: 0.8,
              ),
            ),
          ),
        ),

        // Resources
        SizedBox(
          width: mq * 0.9,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 0,
              side: const BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: const Text(
              'Resources',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                letterSpacing: 0.8,
              ),
            ),
          ),
        ),

        // About Us
        SizedBox(
          width: mq * 0.9,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 0,
              side: const BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: const Text(
              'About Us',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                letterSpacing: 0.8,
              ),
            ),
          ),
        ),

        // Contact
        SizedBox(
          width: mq * 0.9,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 0,
              side: const BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: const Text(
              'Contact',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                letterSpacing: 0.8,
              ),
            ),
          ),
        ),
      ],
    );
    Column second_page = Column(
      children: [
        // Research
        SizedBox(
          width: mq * 0.9,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 0,
              side: const BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: const Text(
              'Research Area',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                letterSpacing: 0.8,
              ),
            ),
          ),
        ),

        // Our Team
        SizedBox(
          width: mq * 0.9,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 0,
              side: const BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: const Text(
              'Research Publication',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                letterSpacing: 0.8,
              ),
            ),
          ),
        ),
      ],
    );

    // <--- second page end

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            // for header --->

            Positioned(
              top: 0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // dsl image section --->

                    const Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Image(
                        image: AssetImage('assets/images/dsl.png'),
                        width: 100,
                        height: 35,
                      ),
                    ),

                    // diu logo section --->

                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        children: [
                          const Image(
                            image: AssetImage('assets/images/diu.png'),
                            width: 100,
                            height: 35,
                          ),

                          // bell icon button --->

                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              'assets/images/bell.png',
                              width: 35,
                              height: 35,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // <--- header section end

            // elevated button section --->

            Positioned(
                top: 80,
                left: 20,
                child: pageChanged ? second_page : first_page),

            // <--- elevated button section end

            // background part --->

            AnimatedPositioned(
              duration: AnimationTime,
              top: Shape_posY,
              left: Shape_posX,
              child: Stack(clipBehavior: Clip.none, children: [
                Positioned(
                  right: BackShapePosition,
                  child: AnimatedContainer(
                    duration: AnimationTime,
                    height: BackShape_height,
                    width: BackShape_width,
                    decoration: BoxDecoration(
                        color: Color(0xffe6eaeb),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.elliptical(650, 1000),
                            bottomLeft: Radius.elliptical(Back_border_x, Back_border_y))),
                  ),
                ),
                AnimatedContainer(
                  duration: AnimationTime,
                  height: FrontShape_height,
                  width: FrontShape_width,
                  decoration: BoxDecoration(
                      color: Color(0xFF1D458B),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.elliptical(600, 800),
                          bottomLeft: Radius.elliptical(Front_border_x, Front_border_y))),
                ),
              ]),
            ),

            // <--- background part end

            // --> foreground image

            AnimatedPositioned(
              duration: AnimationTime,
              top: image_posY,
              left: image_posX,
              child: Stack(children: [
                Positioned(
                    top: MediaQuery.of(context).size.height * .1 - 85,
                    left: MediaQuery.of(context).size.width * .1 - 45,
                    child: Opacity(
                        opacity: 0.7,
                        child: Image.asset("assets/images/inbg.png",
                            height: image_height,
                            width: image_width,
                            color: Colors.black))),
                ClipRect(
                    child: Image.asset(
                      "assets/images/inbg.png",
                      height: image_height,
                      width: image_width,
                    ))
              ]),
            ),

            // <-- foreground image end

            // for footer --->
            Positioned(
              bottom: 0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Add 1st IconButton with Image
                    Column(
                      children: [
                        IconButton(
                          icon: Image.asset(
                            'assets/images/1.png',
                            width: 50,
                            height: 50,
                          ),
                          onPressed: () {},
                        ),
                        const Text(
                          'Home',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),

                    // Add 2nd IconButton with Image
                    Column(
                      children: [
                        IconButton(
                          icon: Image.asset(
                            'assets/images/2.png',
                            width: 50,
                            height: 50,
                          ),
                          onPressed: () {},
                        ),
                        const Text(
                          'Events',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),

                    // Add 3rd IconButton with Image
                    Column(
                      children: [
                        IconButton(
                          icon: Image.asset(
                            'assets/images/3.png',
                            width: 50,
                            height: 50,
                          ),
                          onPressed: () {},
                        ),
                        const Text(
                          'Menu',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),

                    // Add 4th IconButton with Image
                    Column(
                      children: [
                        IconButton(
                          icon: Image.asset(
                            'assets/images/4.png',
                            width: 50,
                            height: 50,
                          ),
                          onPressed: () {},
                        ),
                        const Text(
                          'DS Club',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),

                    // Add 5th IconButton with Image
                    Column(
                      children: [
                        IconButton(
                          icon: Image.asset(
                            'assets/images/5.png',
                            width: 50,
                            height: 50,
                          ),
                          onPressed: () {},
                        ),
                        const Text(
                          'Profile',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
            // <---footer section end
          ],
        ),
      ),
    );
  }
}