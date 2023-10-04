import 'package:flutter/material.dart';
import 'constant.dart';
import 'reusable.dart';
import 'bottom_Button.dart';

class results extends StatelessWidget {
  results(
      {required this.interpretation,
      required this.bmiResult,
      required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Bmi Calculator"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Your Result",
                style: kTitleStyle,
              ),
            )),
            Expanded(
              flex: 5,
              child: Reuseble(
                  kActiveCardColor,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        resultText.toUpperCase(),
                        style: kResultTextstyle,
                      ),
                      Text(
                        bmiResult,
                        style: kBMItextStyle,
                      ),
                      Text(
                        interpretation,
                        style: kBodyTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )),
            ),
            Expanded(
              child: Bottom_button(
                buttonTitle: "Re-CALUCULATE",
                onTap: (() {
                  Navigator.pop(context);
                }),
              ),
            )
          ],
        ));
  }
}
