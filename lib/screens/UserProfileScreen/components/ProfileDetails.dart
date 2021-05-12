import 'package:flutter/material.dart';
import 'package:flutter_petkon/screens/UserProfileScreen/EditUserProfile.dart';
import 'package:flutter_petkon/utils/CommonStyles.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Kconstants.dart';
import '../../LoginSignupScreen.dart';
import 'StatWidget.dart';

class ProfileDetails extends StatelessWidget {
  final String name;
  final String email;
  final String phoneNumber;
  ProfileDetails({@required this.name, @required this.email,@required this.phoneNumber});
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
                // Row(
                //   children: [
                //     // StatWidget(
                //     //   title: "Posts",
                //     //   value: 400,
                //     // ),
                //     SizedBox(width: size.width * 0.03),
                //     StatWidget(title: "Followers", value: 300),
                //     SizedBox(
                //       width: size.width * 0.03,
                //     ),
                //     StatWidget(title: "Following", value: 132)
                //   ],
                // ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditUserProfile()));
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
                GestureDetector(
                  onTap: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.clear();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginSignupScreen()),
                        ModalRoute.withName("/LoginSignupScreen"));
                  },
                  child: Padding(
                    padding: new EdgeInsets.only(top: 5),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      width: 220,
                      child: Center(
                        child: Text(
                          "Log Out",
                          style: TextStyle(
                              color: kPrimarycolor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: kPrimarycolor, width: 2),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Text(
          this.name,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Text(
         this.phoneNumber,
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
          "Display Date of birth",
          style: TextStyle(
            fontSize: 12,
            fontFamily: "Montserrat",
          ),
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
