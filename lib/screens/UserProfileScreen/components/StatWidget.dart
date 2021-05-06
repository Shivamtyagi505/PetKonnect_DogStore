import 'package:flutter/material.dart';

import '../../../Kconstants.dart';

class StatWidget extends StatelessWidget {
  final int value;
  final String title;
  const StatWidget({@required this.title, @required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: TextStyle(
              fontFamily: "Montserrat",
              color: kPrimarycolor,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
