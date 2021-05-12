import 'package:flutter/material.dart';

import '../../../Kconstants.dart';

class PostSelection extends StatelessWidget {
  final String title;
  final Function onTap;
  final bool type;

  const PostSelection(
      {@required this.title, @required this.type, @required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
                color: type ? kPrimarycolor : kTextColor,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          type
              ? Container(
                  height: 5,
                  width: 60,
                  color: kPrimarycolor,
                )
              : Container()
        ],
      ),
    );
  }
}
