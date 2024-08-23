



import 'package:flutter/material.dart';
import 'package:my_quiz/appbrain.dart';

class Exame_App extends StatefulWidget {
  const Exame_App({super.key});

  @override
  State<Exame_App> createState() => _Exame_AppState();
}

// ignore: camel_case_types
class _Exame_AppState extends State<Exame_App> {
  List<Widget> answersicons = [];
  Appbrain appBrain = Appbrain();
  int rightanswers = 0 ; 

  void checkanswer(bool whatuserpicked) {

    bool correctanswer = appBrain.getquestionanswer();
  setState(() {
    
     if (whatuserpicked==correctanswer){
      rightanswers++;
      answersicons.add(const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(Icons.thumb_up , color: Colors.blue,),
      ));
     }else{
       answersicons.add(const Padding(
         padding: EdgeInsets.all(8.0),
         child: Icon(Icons.thumb_down , color: Colors.red,),
       ));
     }
 if(appBrain.isFinished()==true){
  showDialog(
    barrierColor: Color.fromARGB(95, 42, 184, 163),
   
  
    context: context, builder:(context){
    return AlertDialog(
      iconPadding: EdgeInsets.all(10),
      icon: Icon(Icons.quiz_rounded),
      iconColor: Colors.blue,
      shadowColor: Color.fromARGB(255, 5, 8, 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        
      ),
   
      title: const Text("لقد انتهى الإختبار" ,
      textAlign: TextAlign.end,
       style: TextStyle(
        fontSize: 20 , 
        color: Colors.black, 

      ),),
      content: Text(" أجبت على $rightanswers اسئلة بشكل صحيح" , 
      style: TextStyle(
        fontSize: 20 , 
        color: Colors.black, 

      ),
      ),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: const Text("ok" , 
        style: TextStyle(
        fontSize: 20 , 
        color: Colors.black, 

      ),),),
      ],
    );
    
  });
   appBrain.reset();
 answersicons=[];


 }else{appBrain.nextquestion();}

   
  });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exam Application"),
        centerTitle: true,
        elevation: 10,
        shadowColor: const Color.fromARGB(255, 190, 91, 10),
        backgroundColor: const Color.fromARGB(255, 235, 162, 66),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: answersicons,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: Column(
              children: [
                Image.asset(
                  appBrain.getquestionimage(),
                  width: 400,
                  height: 300,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                 appBrain.getquestiontext(),
                  style: const TextStyle(
                    fontSize: 19,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MaterialButton(
                      color: const Color.fromARGB(255, 51, 174, 115),
                      onPressed: () {
                        checkanswer(true);
                        
                      },
                      child: const Text(
                        "صح",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      color: const Color.fromARGB(255, 243, 201, 74),
                      onPressed: () {
                        checkanswer(false);
                      },
                      child: const Text(
                        "خطأ",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ) , 

                  ],
                )), 
                
              ],
            ))
          ],
        ),
      ),
    );
  }
}