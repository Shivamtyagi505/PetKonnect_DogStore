import 'package:flutter/material.dart';
import 'package:flutter_petkon/screens/UserProfileScreen.dart';

import '../../../Kconstants.dart';
import 'StatWidget.dart';

class ProfileDetails extends StatelessWidget {
  final String name;
  final String email;
  ProfileDetails({@required this.name, @required this.email});
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
                  children: [
                    StatWidget(
                      title: "Posts",
                      value: 400,
                    ),
                    SizedBox(width: size.width * 0.03),
                    StatWidget(title: "Followers", value: 300),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    StatWidget(title: "Following", value: 132)
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserProfileScreen()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 220,
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
          this.name,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Text(
          "www.petkonnet.com  ",
          style: TextStyle(
              fontSize: 12,
              color: Colors.blue,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Text(
          this.email,
          style: TextStyle(
            fontSize: 12,
            fontFamily: "Montserrat",
          ),
        )
      ],
    );
  }
}
