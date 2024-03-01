import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDesign extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

     // Path path_0 = Path();
     //  path_0.moveTo(size.width*-0.0019000,size.height*0.4945625);
     //  path_0.lineTo(size.width*0.1702667,size.height*0.7906875);
     //  path_0.lineTo(size.width*1.0019000,size.height*0.5199375);
     //  path_0.lineTo(size.width*1.0022333,size.height*-0.0213125);
     //  path_0.lineTo(size.width*-0.0036667,size.height*-0.0066875);
     //  path_0.lineTo(size.width*-0.0019000,size.height*0.4945625);
     //  path_0.close();

    Path path_0 = Path();
    path_0.moveTo(size.width * -0.0030000, size.height * 0.5728571);
    path_0.lineTo(size.width * 0.1615125, size.height * 0.8609286);
    path_0.lineTo(size.width * 1.0094250, size.height * 0.5002143);
    path_0.lineTo(size.width * 1.0072500, size.height * -0.0100000);
    path_0.lineTo(size.width * -0.0025000, size.height * -0.0100000);
    path_0.lineTo(size.width * -0.0030000, size.height * 0.5728571);
    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}



class TrainingPage extends StatefulWidget {
  const TrainingPage({super.key});

  @override
  State<TrainingPage> createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height, w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFF1D458B),
      appBar: AppBar(
        title: Center(child: Text("Training",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: CustomDesign(),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    color: Colors.white,
                      ),
                  Positioned(
                    left: w*.07,
                    top: h*.02,
                    child: Text("Training Events",
                      style: TextStyle(fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade600),),
                  )
                ],
              ),
                ),
            Container(
              height: 400,
              width: w*.95,
              color: Colors.black54,
              child: Column(
                children: [
                  Center(child: Text("Quiz",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white, ),
                  ))
                ],
              ),
            ),
            Container(
              height: 400,
              width: w*.95,
              color: Colors.black54,
              child: Column(
                children: [
                  Center(child: Text("Resources",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white, ),
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


