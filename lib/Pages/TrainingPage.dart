import 'package:diudsl/Contents/Quiz%20Contents.dart';
import 'package:diudsl/Contents/TextResources.dart';
import 'package:diudsl/Widgets/CustomInfoContainer.dart';
import 'package:diudsl/Widgets/QuizCard.dart';
import 'package:flutter/material.dart';

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
  bool isPressed = false, // Checks if the current page quiz page
      resultPage = false; // Checks if the page is result page or front page
  double quizH = 400, rnd = 5;
  int time = 600, result = 0;
  List ans = [];

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height,
        w = MediaQuery.of(context).size.width,
        quizW = w * .9;
    List<QuizCard> quizes = [];
    List<CustomContainer> resources = [];




    void QuizButton() {
      setState(() {
        isPressed = true;
        quizH = h * .75;
        rnd = 50;
      });
    }

    // Process result
    void resultFunction() {
      bool hasAnswered = true;
      quizes.forEach((qstn) {
        if (qstn.controller.text == "") {
          hasAnswered = false;
        }
      });
      if (hasAnswered) {
        quizes.forEach((qstn) {
          if (ans.length <= quizes.length) {
            ans.add(qstn.controller.text);
          }
          if (qstn.controller.text == qstn.info[5]) {
            result++;
          }
        });
        quizH = 400;
        rnd = 5;
        isPressed = false;
        resultPage = true;
      } else {
        const message = SnackBar(
          content: Center(
              child: Text(
            "Answer all questions to proceed",
            style: TextStyle(
              fontSize: 15,
            ),
          )),
          duration: Duration(seconds: 2),
        );
        ScaffoldMessenger.of(context).showSnackBar(message);
      }
      setState(() {});
    }



    // This function is for exit button in quiz page
    void ExitButton() {
      quizH = 400;
      rnd = 5;
      result = 0;
      isPressed = false;
      setState(() {});
    }



    for (var element in QuizText.Quizes) {
      quizes.add(QuizCard(info: element, controller: TextEditingController()));
    }

    ResourceText.ResourcesSource.forEach((element) {
      resources.add(
        CustomContainer(pathName: element[0], partialText: element[1], fullText: element[2])
      );
    });



    // shows this as frontpage in quiz part
    Container quizFrontpage = Container(
      child: Column(
        children: [
          Image.asset("assets/images/quiz.png"),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff0a8144),
              elevation: 4,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
          ),
        ],
      ),
    );




    // Quiz page
    Column quizPage = Column(
      children: [
        Column(
          children: quizes,
        ),
        ElevatedButton(
            onPressed: resultFunction,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff0a8144),
              elevation: 4,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: const Text(
              "See Result",
              style: TextStyle(fontSize: 16, color: Colors.white),
            )),
        const SizedBox(
          height: 20,
        )
      ],
    );




    // This will show for showing result
    Container ResultPage = Container(
      height: h * 0.4,
      width: w * 0.2,
      // color: Color(0xFFf2f2f2),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/resultbg.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Spacer(),
          const Text(
            'Congratulations!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
              color: Colors.green,
            ),
          ),
          Text(
            'You\'ve got: $result',
            style: const TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
        ],
      ),
    );



    Column resoursce = Column(children: [Center(
        child: Text(
          "Resources",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        )),Column(children: resources,)],);



    Container ShowWidget = resultPage ? ResultPage : quizFrontpage;

    AnimatedContainer QuizWidget = AnimatedContainer(
        duration: Duration(milliseconds: time),
        height: quizH - 50,
        width: quizW,
        child: SingleChildScrollView(child: isPressed ? quizPage : ShowWidget));




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

              // decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(rnd),
                    topRight: Radius.circular(rnd)),
                color: const Color(0xFF4d76bf).withOpacity(.5),
              ),
              child: Column(
                children: [
                  Center(
                    child: isPressed
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(),
                              SizedBox(),
                              const Text(
                                "Quiz",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(),
                              InkWell(
                                onTap: ExitButton,
                                child: Icon(Icons.close, color: Colors.white,)
                              )
                            ],
                          )
                        : const Text(
                            "Quiz",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  QuizWidget,
                ],
              ),
            ),
            // Resources contents
            isPressed
                ? const SizedBox()
                : Container(
                    width: w * .95,
                    color: const Color(0xFF1D458B),
                    child: resoursce
                  ),
          ],
        ),
      ),
    );
  }
}
