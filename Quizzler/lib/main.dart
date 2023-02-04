import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quizBrain.dart';

QuizBrain quiz = QuizBrain();
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black12,
        body: QuizzlerBody()));
  }
}
class QuizzlerBody extends StatefulWidget {
  @override
  State<QuizzlerBody> createState() => _QuizzlerBodyState();
}

class _QuizzlerBodyState extends State<QuizzlerBody> {
  List<Icon> iconlist = [];
  void checkAns(bool userPickedaAns){
    setState(() {
      bool correctAns = quiz.getAns();
      if(quiz.checkEnd()==true){
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();
        quiz.reset();
        iconlist =[];
      }else if(correctAns==userPickedaAns){
        iconlist.add(Icon(Icons.check,color: Colors.green,));
      }else{
        iconlist.add(Icon(Icons.close,color: Colors.red,));
      }
      quiz.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Container(
              child: Center(
                child: Text(
                  quiz.getQuestion(),
                  style:TextStyle(fontSize: 25,color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    checkAns(true);
                    },
                  child: Text(
                    "True",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    checkAns(false);
                    },
                       child: Text(
                    "False",
                    style: TextStyle(color: Colors.white),
                  )),
            ),

          ),
          Row(children: iconlist)
        ],
      ),
    );
  }
}


