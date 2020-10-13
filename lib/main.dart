import 'package:flutter/material.dart';
import 'package:flutter_sahaba_new/quizBrain.dart';
import 'themeColors.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() {
  runApp(QuizApp());
}

ThemeColors themeColors = ThemeColors();
QuizBrain quizBrain = QuizBrain();

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'How well do you know the Sahaba?',
      home: Scaffold(
        backgroundColor: themeColors.spaceCadetNavy[700],
        appBar: AppBar(
          backgroundColor: themeColors.spaceCadetNavy[900],
          title: Text(
            'How well do you know the Sahaba?',
            style: TextStyle(color: themeColors.burlyWood[900]),
          ),
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
            child: SahabaQuiz(),
          ),
        ),
      ),
    );
  }
}

class SahabaQuiz extends StatefulWidget {
  @override
  _SahabaQuizState createState() => _SahabaQuizState();
}



class _SahabaQuizState extends State<SahabaQuiz> {

  String setScore() {
    int score = quizBrain.getScore();
    return 'Score: $score/20';
  }

  void ansChecker(int choicNo) {
    String corrAns = 'The correct answer is: ' +  quizBrain.getAnswer(); //This is put on top of the line below because the line below changes the qnum index, and we need it to get the correct ans
    bool isCorrect = quizBrain.checkAnswer(choicNo);
    setState(() {
      if (isCorrect == false && quizBrain.getTotalQuestionsAsked() > 1) {
        Alert(
          context: context,
          type: AlertType.error,
          title: "Wrong Answer",
          desc: corrAns,
          buttons: [
            DialogButton(
              child: Text(
                "Next",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
      }
      if (quizBrain.getTotalQuestionsAsked() <= 20) {
        quizBrain.nextQuestion(); //as button has been pressed the nextQuestion needs to be invoked, this will change the qnum and as the app refreshes the getQuestion will show the new question
      } else {
        Alert(
          context: context,
          type: AlertType.success,
          title: "Congratulations",
          desc: "You have completed 20 Questions of the Quiz! Play again to get more questions!",
          buttons: [
            DialogButton(
              child: Text(
                "Restart",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        quizBrain.reset();

      }
    });
  }

  String getQuestionNo() {
    return 'Question: ' + quizBrain.getTotalQuestionsAsked().toString();
  }

  Neumorphic createChoiceButton(int btnNo) {
    return Neumorphic(
      style: NeumorphicStyle(
          shape: NeumorphicShape.concave,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
          depth: 3,
          lightSource: LightSource.bottomRight,
          surfaceIntensity: 0.6,
      ),
      child: FlatButton(
        onPressed: () {
          setState(() {
            ansChecker(btnNo);
          });
        },
        color: themeColors.burlyWood[900],
        child: Text(
          quizBrain.getChoice(btnNo),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              setScore(),
              style: TextStyle(
                color: themeColors.vividBurgundy[900],
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              getQuestionNo(),
              style: TextStyle(
                color: themeColors.vividBurgundy[900],
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ), //Score Data here
        Expanded(
          flex: 10,
          child: Center(
            child: Text(
              quizBrain.getQuestion(), //gets the question with the current qnum
              style: TextStyle(
                color: themeColors.burlyWood[900],
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: createChoiceButton(1),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          flex: 2,
          child: createChoiceButton(2),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          flex: 2,
          child: createChoiceButton(3),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          flex: 2,
          child: createChoiceButton(4),
        ),
      ],
    );
  }
}


