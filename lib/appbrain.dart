

import 'package:my_quiz/questiongstructure.dart';

class Appbrain {

   
// ignore: prefer_final_fields
List < Questionstruction > _questiongroups= [
  Questionstruction(
t:  "السؤال الأول : عدد الكواكب في المجموعة الشمسية ثمانية كواكب  ",
i:  "images/image-1.jpg",
a: true
 ),

 Questionstruction(
  t:  "السؤال الثاني: القطط هي حيوانات لاحمة " ,
  i:   "images/image-2.jpg",
  a: true,
   ), 
   Questionstruction(
  t:  "السؤال الثالث : الكرة الأرضية مسطحة ",
  i:  "images/image-3.jpg" ,
  a: false
  ),
  Questionstruction(
    t:  "السؤال الرابع : الصين موجودة في القارة الإفريقية ",
    i: "images/image-4.jpg" ,
    a: false
    ),

];

   int _index = 0 ;
   String getquestiontext(){
    return _questiongroups[_index].questiontext;
 

   }
String getquestionimage(){
    return _questiongroups[_index].questionimage;}
  bool getquestionanswer(){
return _questiongroups[_index].questionanswer;

    }
    void nextquestion(){
      if (_index < _questiongroups.length-1){
        _index++;
      }
    
    }

   bool isFinished(){
    if(_index >= _questiongroups.length-1){
      return true;
    }else{return false ; }
   }

   void reset(){
    _index = 0;
   }
   
   
}