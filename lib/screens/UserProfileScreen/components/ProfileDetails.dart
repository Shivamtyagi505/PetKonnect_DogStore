import 'package:flutter/material.dart';

import '../../../Kconstants.dart';
import 'StatWidget.dart';

class ProfileDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/icons/profile.png",
              height: size.height * 0.1,
              width: size.height * 0.1,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    StatWidget(
                      title: "Posts",
                      value: 400,
                    ),
                    SizedBox(width: size.width * 0.018),
                    StatWidget(title: "Followers", value: 300),
                    SizedBox(
                      width: size.width * 0.018,
                    ),
                    StatWidget(title: "Following", value: 132)
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/EditProfile');
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 180,
                    child: Center(
                      child: Text(
                        "Edit Profile",
                        style: TextStyle(
                            color: kPrimarycolor, fontWeight: FontWeight.w600),
                      ),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(color: kPrimarycolor, width: 2),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ],
            )
          ],
        ),
        Text(
          "Deepti Priya",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Text(
          "www.petkonnet.com  ",
          style: TextStyle(
              color: Colors.blue,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Text(
          "deepti@gmail.com",
          style: TextStyle(
            fontFamily: "Montserrat",
          ),
        )
      ],
    );
  }
}
