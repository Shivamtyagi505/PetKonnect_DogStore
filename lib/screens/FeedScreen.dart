import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Kconstants.dart';
import 'Edit_address/editAddress.dart';
import 'UserProfileScreen/components/PostSelction.dart';
import 'UserProfileScreen/components/ProfileDetails.dart';
import 'UserProfileScreen/user_profile.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}
class _FeedScreenState extends State<FeedScreen> {

  @override
  Widget build(BuildContext context) {
    bool post = true;
    bool tagged = false;
    bool saved = false;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 25),
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey[200]),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(30))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //header section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Deepti',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Montserrat"),
                ),
                Row(
                  children: [
                    GestureDetector(
                      child: SvgPicture.asset(
                        "assets/icons/add_post.svg",
                        height: 30,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      child: SvgPicture.asset(
                        "assets/icons/message.svg",
                        height: 30,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      child: SvgPicture.asset(
                        "assets/icons/menu_hamburger.svg",
                        height: 30,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),

            SizedBox(
              height: size.height * 0.01,
            ),
            //profile details
           // ProfileDetails(name: name, email: email),
            SizedBox(
              height: size.height * 0.03,
            ),
            //pets and posts
            // Text(
            //   "My Pets",
            //   style: TextStyle(
            //       fontFamily: "Montserrat",
            //       fontSize: 18,
            //       fontWeight: FontWeight.bold),
            // ),
            // SizedBox(
            //   height: size.height * 0.02,
            // ),
            // Row(
            //   children: [
            //     PetAvatar(
            //         "https://www.thesprucepets.com/thmb/wpN_ZunUaRQAc_WRdAQRxeTbyoc=/4231x2820/filters:fill(auto,1)/adorable-white-pomeranian-puppy-spitz-921029690-5c8be25d46e0fb000172effe.jpg"),
            //     PetAvatar(
            //         'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/golden-retriever-royalty-free-image-506756303-1560962726.jpg?crop=0.672xw:1.00xh;0.166xw,0&resize=640:*'),
            //     PetAvatar(
            //         "http://cdn.akc.org/content/article-body-image/siberian_husky_cute_puppies.jpg"),
            //     GestureDetector(
            //         child: SvgPicture.asset(
            //       "assets/icons/add_post.svg",
            //       height: size.height * 0.09,
            //       width: size.width * 0.15,
            //     ))
            //   ],
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // //Posts
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     PostSelection(
            //       title: "Post",
            //       type: post,
            //       onTap: () {
            //         setState(() {
            //           post = !post;
            //         });
            //       },
            //     ),
            //     PostSelection(
            //         title: "Tagged",
            //         type: tagged,
            //         onTap: () {
            //           setState(() {
            //             tagged = !tagged;
            //           });
            //         }),
            //     PostSelection(
            //         title: "Saved",
            //         type: saved,
            //         onTap: () {
            //           setState(() {
            //             saved = !saved;
            //           });
            //         })
            //   ],
            // )
          ],
        ),
      ),
    );
  }


}