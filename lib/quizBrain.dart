import 'questions.dart';

class QuizBrain{
  int quesNum=0;

  List<Question> qna=[
    Question('The blue whale is the largest animal that has ever existed.', true),
    Question('The hummingbird egg is the world\'s largest bird egg.', false),
    Question('When the two numbers on opposite sides of a dice are added together, the result is always 7', true),
    Question('When going out of a cave, bats always turn in the right direction.', false),
    Question('The Los Angeles Lakers won the 2020 NBA Championship.', true)
  ];

  void nextQues(){
    if(quesNum<qna.length-1){
      quesNum++;
    }
  }

  String getQuesText(){
    return qna[quesNum].questionText;
  }

  bool getCorrectAns(){
    return qna[quesNum].answer;
  }

  bool isFinished(){
    if(quesNum>=qna.length-1){
      print('Now returning true');
      return true;
    }
    else{
      return false;
    }
  }

  void reset(){
    quesNum=0;
  }
}