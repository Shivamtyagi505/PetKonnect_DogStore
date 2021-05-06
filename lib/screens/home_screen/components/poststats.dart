import 'package:flutter/material.dart';

class PostStats extends StatelessWidget {
  final String imgSrc;
  final String text;
  const PostStats({@required this.imgSrc, @required this.text});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          imgSrc,
        ),
        Text("  " + text)
      ],
    );
  }
}
