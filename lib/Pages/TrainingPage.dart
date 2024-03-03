import 'package:diudsl/Contents/Quiz%20Contents.dart';
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
            'Your Score: $result',
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

    Container ShowWidget = resultPage ? ResultPage : ResultPage;

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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Quiz",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                              InkWell(
                                onTap: ExitButton,
                                child: Image.asset('assets/images/cancel.png'),
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
                          pathName: 'assets/images/numpy.jpg',
                          partialText:
                              'NumPy, a cornerstone of Python data science, empowers you to work with numerical data like a pro. It excels...',
                          fullText:
                              'NumPy, a cornerstone of Python data science, empowers you to work with numerical data like a pro. It excels at creating and manipulating large, multidimensional arrays, making data handling a breeze. Need to crunch numbers? NumPy offers a built-in arsenal of mathematical functions and leverages optimized code for lightning-fast calculations. Plus, it seamlessly integrates with other data science libraries, forming a powerful workflow. The benefits are undeniable: speed through optimized computations, versatility for diverse data needs, and user-friendliness for smooth learning. By mastering NumPy, you unlock a gateway to the exciting world of data science in Python.  There are many resources available online to get you started, including official documentation, tutorials, and interactive courses. So, dive into NumPy and unleash the power of data analysis!',
                        ),
                        CustomContainer(
                          pathName: 'assets/images/pytorch.jpg',
                          partialText:
                              'PyTorch is your key to building and training cutting-edge deep learning models in Python. Whether you\'re a...',
                          fullText:
                              'PyTorch is your key to building and training cutting-edge deep learning models in Python. Whether you\'re a beginner or a pro, PyTorch offers a user-friendly and flexible approach. Design neural networks with clear Python code, experiment with dynamic computational graphs for on-the-fly adjustments, and harness the power of GPUs for faster training. Backed by a thriving community, PyTorch provides extensive resources, tutorials, and pre-trained models to fuel your deep learning projects. What sets PyTorch apart? It\'s approachable for Python programmers, allows for flexible model architecture exploration, and prioritizes ease of use for research purposes. Dive into PyTorch and unlock the potential of artificial intelligence in your Python projects with the help of numerous online resources. Get started with the official website, tutorials, or even a deep learning course – the world of deep learning awaits!',
                        ),
                        CustomContainer(
                          pathName: 'assets/images/numarray.jpeg',
                          partialText:
                              'Numarray, a predecessor to NumPy, was once a go-to library for numerical...',
                          fullText:
                              'Numarray, a predecessor to NumPy, was once a go-to library for numerical computations in Python. It offers similar functionalities for creating and handling multidimensional arrays. However, Numarray might be slower and have fewer mathematical functions. Stick to Numarray for existing code, but for new projects, NumPy is the way to go. It boasts superior performance, a wider range of features, and a more active developer community.',
                        ),
                        CustomContainer(
                          pathName: 'assets/images/simg.jpg',
                          partialText:
                              'Python is the undisputed champion for machine learning. Its clear and readable...',
                          fullText:
                              'Python is the undisputed champion for machine learning. Its clear and readable code makes building complex models a breeze. But Python\'s true power lies in its vast ecosystem of libraries. From data manipulation with NumPy and Pandas to algorithm implementation with Scikit-learn and deep learning frameworks like TensorFlow and PyTorch, Python offers tools for every stage of the ML pipeline. This versatility, coupled with a massive and supportive community, makes Python perfect for both beginners grasping core concepts and experts tackling advanced research. Dive into Python for ML with online courses, books like "Hands-On Machine Learning with Scikit-Learn, Keras & TensorFlow", or tutorials from libraries themselves. With Python by your side, you\'re ready to unlock the world of machine learning and its potential to solve real-world challenges.',
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
