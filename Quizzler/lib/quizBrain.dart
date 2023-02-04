import 'questions.dart';

class QuizBrain{
      int _questionNO=0;
      List<Question> _questionhub =[Question("shiv is the prime minister of india ",false),
      Question("shiv is the richest person in the world ",true),
      Question("shiv is the college topper",true),
      Question("shiv is the most handsome person in the college", true),
      Question("shiv is the smartest person ", true)];
      void nextQuestion(){
            if(_questionNO<_questionhub.length-1){
                  _questionNO++;
            }
      }
      String getQuestion(){
            return _questionhub[_questionNO].questionText;
      }
      bool getAns(){
            return _questionhub[_questionNO].ans;
      }
      bool checkEnd(){
            if(_questionNO>=_questionhub.length-1){
                  print("end");
               return true;
            }else{
                  return false;
            }

      }
      void reset(){
            _questionNO =0;
      }
}
