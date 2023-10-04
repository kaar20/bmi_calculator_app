import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Icon_content.dart';
import 'reusable.dart';
import 'constant.dart';
import 'result_page.dart';
import 'bottom_Button.dart';
import 'custom_button.dart';
import 'bmi_Brain.dart';

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

enum Gender { Male, Female }

class _InputPageState extends State<InputPage> {
  Gender? Selected_Gender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("BMI Calculator "),
          ),
        ),
        body: Column(children: [
          Expanded(
              child: Row(
            children: [
              // container 1
              Expanded(
                child: GestureDetector(
                  onTap: (() {
                    // print("Male is selected");
                    setState(() {
                      Selected_Gender = Gender.Male;
                    });
                  }),
                  child: Reuseble(
                    Selected_Gender == Gender.Male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    IconContent("Male", FontAwesomeIcons.mars),
                  ),
                ),
              ),
              // second container in this row
              Expanded(
                child: GestureDetector(
                  onTap: (() {
                    setState(() {
                      Selected_Gender = Gender.Female;
                    });
                  }),
                  child: Reuseble(
                    Selected_Gender == Gender.Female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    IconContent("Female", FontAwesomeIcons.female),
                  ),
                ),
              )
            ],
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reuseble(
                      kActiveCardColor,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Height",
                            style: KlabelText,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                height.toString(),
                                style: kNumberTextstyle,
                              ),
                              Text(
                                "cm",
                                style: KlabelText,
                              )
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                                thumbColor: kBottomContainerColor,
                                overlayColor: Color(0x29EB1555),
                                activeTrackColor: Colors.white,
                                inactiveTrackColor: Color(0xff8D8E98),
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 15),
                                overlayShape:
                                    RoundSliderOverlayShape(overlayRadius: 30)),
                            child: Slider(
                                value: height.toDouble(),
                                min: 120,
                                max: 220,
                                onChanged: (double newval) {
                                  // print(newval);
                                  setState(() {
                                    height = newval.round();
                                  });
                                }),
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
          Expanded(
              child: Row(
            children: [
              // container 1
              Expanded(
                  child: Reuseble(
                      kActiveCardColor,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Weight",
                            style: KlabelText,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextstyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: (() {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (() {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                              )
                            ],
                          )
                        ],
                      )
                      // IconContent("Height", FontAwesomeIcons.markdown),
                      )),
              // second container in this row
              Expanded(
                child: Reuseble(
                    kActiveCardColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Age",
                          style: KlabelText,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (() {
                                setState(() {
                                  age--;
                                });
                              }),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (() {
                                setState(() {
                                  age++;
                                });
                              }),
                            )
                          ],
                        )
                      ],
                    )),
              ),
            ],
          )),
          Bottom_button(
            buttonTitle: "CALCULATE ",
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => results(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          )
        ]));
  }
}
