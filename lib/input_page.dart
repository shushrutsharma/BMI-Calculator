import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'container.dart';
import 'constants.dart';
import 'results_page.dart';
import 'calculator_brain.dart';

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;

  int height = 180;
  int weight = 40;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                  child: ReuseableCard(
                onPressed: () {
                  setState(() {
                    selectedGender = Gender.Male;
                  });
                },
                colour:
                    selectedGender == Gender.Male ? cardColor : inactiveColor,
                cardChild: IconGender(FontAwesomeIcons.mars, "MALE"),
              )),
              Expanded(
                  child: ReuseableCard(
                onPressed: () {
                  setState(() {
                    selectedGender = Gender.Female;
                  });
                },
                colour:
                    selectedGender == Gender.Female ? cardColor : inactiveColor,
                cardChild: IconGender(FontAwesomeIcons.venus, "FEMALE"),
              )),
            ],
          )),
          Expanded(
              child: ReuseableCard(
            colour: cardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HEIGHT',
                  style: labelText,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: numberText,
                    ),
                    Text(
                      ' CM',
                      style: labelText,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Color(0xFF8D8E98),
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    activeTrackColor: Colors.white,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: minHeight,
                    max: maxHeight,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ),
              ],
            ),
          )),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                  child: ReuseableCard(
                      colour: cardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: labelText,
                          ),
                          Text(
                            weight.toString(),
                            style: numberText,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 12.0,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ]),
                        ],
                      ))),
              Expanded(
                  child: ReuseableCard(
                      colour: cardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: labelText,
                          ),
                          Text(
                            age.toString(),
                            style: numberText,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 12.0,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                              ]),
                        ],
                      ))),
            ],
          )),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return ResultsPage(
                      myBMI: calc.calculateBMI(),
                      comment: calc.getComment(),
                      result: calc.getResult());
                }),
              );
            },
            child: Container(
              color: bottomColor,
              margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              width: double.infinity,
              height: bottomContainerHeight,
              child: Center(
                  child: Text(
                'CALCULATE MY BMI',
                style: bottomText.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 10.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
