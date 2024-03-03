import 'dart:ui';
import 'package:diudsl/Contents/Quiz%20Contents.dart';
import 'package:diudsl/Widgets/CustomInfoContainer.dart';
import 'package:diudsl/Widgets/QuizCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomDesign extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

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
  List<QuizCard> quizes = [];
  bool isPressed = false;
  double quizH = 400;

  int time = 600;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height,
        w = MediaQuery.of(context).size.width,
        quizW = w * .9;

    void QuizButton() {
      setState(() {
        isPressed = true;
        quizH = h * .75;
      });
    }

    for (var element in QuizText.Quizes) {
      // element[0] = "${i.toString()}. ${element[0]}";
      quizes.add(QuizCard(
          info: element,
          ButtonClick: () {},
          controller: TextEditingController()));
    }

    AnimatedContainer quizPage = AnimatedContainer(
        duration: Duration(milliseconds: time),
        height: quizH - 50,
        child: SingleChildScrollView(
            child: isPressed
                ? Column(
                    children: quizes,
                  )
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff0a8144),
                      elevation: 4,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: QuizButton,
                    child: const Text("Start Quiz",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        )),
                  )));

    return Scaffold(
      backgroundColor: const Color(0xFF1D458B),
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Training",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Upper style
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
                    left: w * .07,
                    top: h * .02,
                    child: Text(
                      "Training Events",
                      style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade600),
                    ),
                  )
                ],
              ),
            ),

            // quiz widget
            AnimatedContainer(
              duration: Duration(milliseconds: time),
              height: quizH,
              width: quizW,
              color: const Color(0xFF4d76bf).withOpacity(.5),
              // decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: Column(
                children: [
                  const Center(
                      child: Text(
                    "Quiz",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  )),
                  // Image(image: AssetImage('assets/images/quiz.jpg')),
                  quizPage,
                ],
              ),
            ),

            // Resources contents
            isPressed
                ? SizedBox()
                : Container(
                    width: w * .95,
                    color: const Color(0xFF1D458B),
                    child: const Column(
                      children: [
                        Center(
                            child: Text(
                          "Resources",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        )),
                        CustomContainer(
                          pathName: 'assets/images/simg.jpg',
                          partialText:
                              'In Python, a module is a fundamental unit of code organization and reusability.',
                          fullText:
                              'In Python, a module is a fundamental unit of code organization and reusability. It\'s essentially a Python file (.py extension) containing a collection of definitions and statements.',
                        ),
                        CustomContainer(
                          pathName: 'assets/images/simg.jpg',
                          partialText:
                              'In Python, a module is a fundamental unit of code organization and reusability.',
                          fullText:
                              'In Python, a module is a fundamental unit of code organization and reusability. It\'s essentially a Python file (.py extension) containing a collection of definitions and statements.',
                        ),
                        CustomContainer(
                          pathName: 'assets/images/simg.jpg',
                          partialText:
                              'In Python, a module is a fundamental unit of code organization and reusability.',
                          fullText:
                              'In Python, a module is a fundamental unit of code organization and reusability. It\'s essentially a Python file (.py extension) containing a collection of definitions and statements.',
                        ),
                        CustomContainer(
                          pathName: 'assets/images/simg.jpg',
                          partialText:
                              'In Python, a module is a fundamental unit of code organization and reusability.',
                          fullText:
                              'In Python, a module is a fundamental unit of code organization and reusability. It\'s essentially a Python file (.py extension) containing a collection of definitions and statements.',
                        ),
                        CustomContainer(
                          pathName: 'assets/images/simg.jpg',
                          partialText:
                              'In Python, a module is a fundamental unit of code organization and reusability.',
                          fullText:
                              'In Python, a module is a fundamental unit of code organization and reusability. It\'s essentially a Python file (.py extension) containing a collection of definitions and statements.',
                        ),
                        CustomContainer(
                          pathName: 'assets/images/simg.jpg',
                          partialText:
                              'In Python, a module is a fundamental unit of code organization and reusability.',
                          fullText:
                              'In Python, a module is a fundamental unit of code organization and reusability. It\'s essentially a Python file (.py extension) containing a collection of definitions and statements.',
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
