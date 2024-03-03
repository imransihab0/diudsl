
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Color BaseColor = Color(0xFF1D458B);
TextStyle Style = TextStyle(fontSize: 21,fontWeight: FontWeight.bold,color: BaseColor);

class QuizCard extends StatefulWidget {
  final TextEditingController controller;
  final List info;

  const QuizCard({super.key, required this.info,  required this.controller});

  @override
  State<QuizCard> createState() => _QuizCardState(this.info);
}

class _QuizCardState extends State<QuizCard> {
  List info;
  bool click1 = false, click2 = false, click3 = false, click4 = false;



  _QuizCardState(this.info);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width,
    h = MediaQuery.of(context).size.height;

    final String question = info[0];

    String qstn = question;

    // For center white-box
    Center MidBox = Center(
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(2))
          ),

        ),
      ),
    );

    void clickfun1()
    {
      setState(() {
        click1 = true;
        click2 = false;
        click3 = false;
        click4 = false;
        widget.controller.text = '1';
      });
    }

    void clickfun2()
    {
      setState(() {
        click1 = false;
        click2 = true;
        click3 = false;
        click4 = false;
        widget.controller.text = '2';
      });
    }

    void clickfun3()
    {
      setState(() {
        click1 = false;
        click2 = false;
        click3 = true;
        click4 = false;
        widget.controller.text = '3';
      });
    }

    void clickfun4()
    {
      setState(() {
        click1 = false;
        click2 = false;
        click3 = false;
        click4 = true;
        widget.controller.text = '4';
      });
    }


    List<InkWell> Quizbuttons = [];
    List func = [clickfun1, clickfun2, clickfun3, clickfun4];
    List<bool> clicked = [click1,click2,click3,click4];
    List<String> OptionText = [info[1],info[2],info[3],info[4]];


    for(int i=0; i<4; i++)
    {
      Quizbuttons.add(InkWell(
        onTap: func[i],
        child: Row(
          children: [
            Container(
              height: 22,
              width: 22,
              decoration: BoxDecoration(
                  color: BaseColor,
                  borderRadius: BorderRadius.all(Radius.circular(2))
              ),
              child: clicked[i]?Center(child: Icon(Icons.check, color: Colors.white,size: 20,)) : MidBox,
            ),
            SizedBox(width: 15,),
            Container(
              width : w*.63,
              child: Text(OptionText[i], style: Style.copyWith(fontSize: 18),))
          ],
        ),
      ));
    }



    return Container(

      width: w,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [BoxShadow(blurRadius: 20,offset: Offset(1,3),color: Colors.black87.withOpacity(.7)),]
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 25,right: 25,top: 10,bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(qstn, style: Style,),
            SizedBox(height: 5,),
            SizedBox(
              height: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: Quizbuttons,
              ),
            ),
          ],),
      ),
    );
  }
}