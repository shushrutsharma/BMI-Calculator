import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'container.dart';
import 'calculator_brain.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.myBMI, @required this.comment, @required this.result});

  String myBMI;
  String result;
  String comment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 12.0),
              child: Center(
                child: Text(
                  'Your Result',
                  style: bottomText.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 50.0,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                child: ReuseableCard(
                  colour: cardColor,
                  cardChild: Column(
                    
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Text(
                          result,
                          style: TextStyle(
                            color: Color(0xFF24D876),
                            fontSize: 25.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 60.0,
                      // ),
                      Center(
                        child: Text(
                          myBMI,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 80.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 100.0,
                      // ),
                      Text(
                        comment,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: bottomColor,
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                width: double.infinity,
                height: bottomContainerHeight,
                child: Center(
                  child: Text(
                    'RE-CALCULATE BMI',
                    style: bottomText.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
