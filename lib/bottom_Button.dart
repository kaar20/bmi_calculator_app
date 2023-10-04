import 'package:flutter/material.dart';
import 'constant.dart';

class Bottom_button extends StatelessWidget {
  Bottom_button({required this.buttonTitle, required this.onTap});
  final String buttonTitle;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.only(bottom: 10),
          child: Center(
            child: Text(
              buttonTitle,
              style: KBottomTextStyle,
            ),
          ),
          color: kBottomContainerColor,
          margin: EdgeInsets.only(top: 10),
          width: double.infinity,
          height: kBottomContainerHeight),
    );
  }
}
