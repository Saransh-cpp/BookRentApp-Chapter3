import 'dart:async';
import 'package:flutter/material.dart';
import 'package:test_app/QuizScreens/Question1.dart';
import 'package:test_app/QuizScreens/Question2.dart';
import 'package:test_app/QuizScreens/QuizResult.dart';
import 'package:test_app/Widgets.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  PageController pageController = PageController();
  int currentIndex = 0;
  var currentTab = [
    Question1(),
    Question2(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              icon: Icon(
                  Icons.navigate_next_rounded
              ),
              onPressed: () {
                setState(() {
                  currentIndex += 1;
                  pageController.animateToPage(currentIndex,
                      duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                });
              })
        ],
      ),
      body: PageView(
        reverse: false,
        physics: NeverScrollableScrollPhysics(),
        children: currentTab,
        controller: pageController,
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },

      ),
    );
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:test_app/Widgets.dart';
// import 'package:test_app/model/QuizDataModel.dart';
// import 'package:test_app/services/quiz.dart';
//
// class Quiz extends StatefulWidget {
//   @override
//   _QuizState createState() => _QuizState();
// }
//
// class _QuizState extends State<Quiz> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//             body: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 30,
//                   ),
//                   QuizCard(
//                     question: 'Test 1',
//                     option1: '1',
//                     option2: '1',
//                     option3: '1',
//                     option4: '1',
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//
//                   QuizCard(
//                     question: 'Test 1',
//                     option1: '1',
//                     option2: '1',
//                     option3: '1',
//                     option4: '1',
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   QuizCard(
//                     question: 'Test 1',
//                     option1: '1',
//                     option2: '1',
//                     option3: '1',
//                     option4: '1',
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   QuizCard(
//                     question: 'Test 1',
//                     option1: '1',
//                     option2: '1',
//                     option3: '1',
//                     option4: '1',
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   QuizCard(
//                     question: 'Test 1',
//                     option1: '1',
//                     option2: '1',
//                     option3: '1',
//                     option4: '1',
//                   ),
//                   MaterialButton(
//                       onPressed: () {},
//                     color: Colors.pink[50],
//                     child: Text(
//                       'Find Books for me'
//                     ),
//                   )
//                 ],
//               ),
//             )
//         )
//     );
//   }
// }


// class Quiz extends StatefulWidget {
//
//   final String quizId;
//
//   const Quiz({Key key, this.quizId}) : super(key: key);
//
//   @override
//   _QuizState createState() => _QuizState();
// }
//
// class _QuizState extends State<Quiz> {
//
//   QuizServices quizServices = QuizServices();
//   QuerySnapshot questionSnapshot;
//
//   QuestionModel getQuestionModelFromDatasnapshot(DocumentSnapshot questionSnapshot){
//
//     QuestionModel questionModel = QuestionModel();
//     questionModel.question = questionSnapshot.data()['question'];
//
//     List<String> options = [
//       questionSnapshot.data()['option1'],
//       questionSnapshot.data()['option2'],
//       questionSnapshot.data()['option3'],
//       questionSnapshot.data()['option4'],
//     ];
//
//     options.shuffle();
//
//     questionModel.option1 = options[0];
//     questionModel.option2 = options[1];
//     questionModel.option3 = options[2];
//     questionModel.option4 = options[3];
//     questionModel.answered = false;
//
//     return questionModel;
//
//
//   }
//
//   @override
//   void initState() {
//     getData();
//     super.initState();
//   }
//
//   getData() async{
//     questionSnapshot = await quizServices.getQuizData(widget.quizId);
//     print(questionSnapshot);
//
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Column(
//           children: [
//             questionSnapshot.docs != null
//             ? Container() :
//                 ListView.builder(
//                   shrinkWrap: true,
//                     physics: ScrollPhysics(),
//                     itemCount: questionSnapshot.docs.length,
//                     itemBuilder: (context, index){
//                       return QuizPlayTile(
//                         questionModel: getQuestionModelFromDatasnapshot(
//                             questionSnapshot.docs[index]) ,
//                         index: index,
//                       );
//                     }
//                 )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
// //=====================Single option=========================
//
// class Options extends StatefulWidget {
//
//   final String option;
//   final String description;
//
//   const Options({Key key, this.option, this.description}) : super(key: key);
//
//
//   @override
//   _OptionsState createState() => _OptionsState();
// }
//
// class _OptionsState extends State<Options> {
//
//   bool isSelected = false;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         GestureDetector(
//           onTap: () {
//             setState(() {
//               isSelected = !isSelected;
//             });
//           },
//           child: Row(children: [
//             Container(
//               decoration: BoxDecoration(
//                   border: Border.all(
//                       color: isSelected ? Colors.blueAccent : Colors.grey)),
//               child: Text(
//                 '${widget.option}',
//                 style: TextStyle(
//                   color: Colors.black54,
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 8,
//             ),
//             Text(
//                 widget.description,
//               style: TextStyle(
//                 color: Colors.black54,
//                 fontSize: 17
//               ),
//             )
//           ]),
//         )
//       ],
//     );
//   }
// }
//
// //=======================All Options Tile====================
//
// class QuizPlayTile extends StatefulWidget {
//
//   final QuestionModel questionModel;
//   final int index;
//
//   QuizPlayTile({this.questionModel, this.index});
//
//   @override
//   _QuizPlayTileState createState() => _QuizPlayTileState();
// }
//
// class _QuizPlayTileState extends State<QuizPlayTile> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           Text(
//             widget.questionModel.question
//           ),
//           SizedBox(
//             height: 4,
//           ),
//           Options(
//             option: 'A',
//             description: widget.questionModel.option1,
//           ),
//           SizedBox(
//             height: 4,
//           ),
//           Options(
//             option: 'B',
//             description: widget.questionModel.option2,
//           ),
//           SizedBox(
//             height: 4,
//           ),
//           Options(
//             option: 'C',
//             description: widget.questionModel.option3,
//           ),
//           SizedBox(
//             height: 4,
//           ),
//           Options(
//             option: 'D',
//             description: widget.questionModel.option4,
//           ),
//           SizedBox(
//             height: 4,
//           ),
//           Options(
//             option: 'A',
//             description: widget.questionModel.option1,
//           ),
//         ],
//       ),
//     );
//   }
// }


