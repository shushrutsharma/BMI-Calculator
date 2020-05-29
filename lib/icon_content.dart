import 'package:flutter/material.dart';
import 'constants.dart';

class IconGender extends StatelessWidget {
  IconGender(@required this.logo, this.gender);

  final IconData logo;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          logo,
          size: 80.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          gender,
          style: labelText,
        ),
      ],
    );
  }
}
