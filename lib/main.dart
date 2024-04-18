import 'package:flutter/material.dart';
import 'questions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quizBrain.dart';
void main() {
  runApp(const Quizzler());
}
QuizBrain quizBrain= QuizBrain();

class Quizzler extends StatefulWidget {
  const Quizzler({super.key});

  @override
  State<Quizzler> createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {


  List<Icon> scoreKeeper=[];

  int quesNum=0;

  void correctAnsChecker(bool userAns){
    bool correctAns= quizBrain.getCorrectAns();
    setState(() {
      if(quizBrain.isFinished()){
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();
        quizBrain.reset();
        scoreKeeper = [];
      }
      else{
        if (correctAns == userAns) {
          print('User got it right!');
          scoreKeeper.add(const Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          print('User got it wrong!');
          scoreKeeper.add(const Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextQues();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black45,
        appBar: AppBar(
          title: const Text(
            'Quiz App',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue.shade900,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(
                      child: Text(
                        quizBrain.getQuesText(),
                        style: const TextStyle(color: Colors.white70, fontSize: 25),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextButton(
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.green),
                      onPressed: () {
                        correctAnsChecker(true);
                      },
                      child: const Text(
                        'True',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextButton(
                      style: TextButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {
                        correctAnsChecker(false);
                      },
                      child: const Text(
                        'False',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: scoreKeeper,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
