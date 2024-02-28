import 'package:flutter/material.dart';

class samplePage extends StatefulWidget {
  const samplePage({super.key});

  @override
  State<samplePage> createState() => _samplePageState();
}

class _samplePageState extends State<samplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // for header --->
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // dsl image section

              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Image(
                  image: AssetImage('assets/images/dsl.png'),
                  width: 100,
                  height: 35,
                ),
              ),

              // diu logo section

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
          // <--- header section end

          // elevated button section --->

          Column(
            children: [
              // Research
              ElevatedButton(
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
                  padding: const EdgeInsets.symmetric(horizontal: 150),
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

              // Our Team
              ElevatedButton(
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
                  padding: const EdgeInsets.symmetric(horizontal: 150),
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

              // Training
              ElevatedButton(
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
                  padding: const EdgeInsets.symmetric(horizontal: 155),
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

              // Resources
              ElevatedButton(
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
                  padding: const EdgeInsets.symmetric(horizontal: 146),
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

              // About Us
              ElevatedButton(
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
                  padding: const EdgeInsets.symmetric(horizontal: 152),
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

              // Contact
              ElevatedButton(
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
                  padding: const EdgeInsets.symmetric(horizontal: 156),
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
            ],
          ),

          // <--- elevated button section end

          // for footer --->
          Row(
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
          )
          // <---footer section end
        ],
      ),
    );
  }
}
