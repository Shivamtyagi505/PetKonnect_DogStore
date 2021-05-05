import 'package:flutter/material.dart';
import 'package:flutter_petkon/Kconstants.dart';

import 'components/PostSelction.dart';
import 'components/ProfileDetails.dart';
import 'package:flutter_svg/svg.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    bool post = true;
    bool tagged = false;
    bool saved = false;
    Size size = MediaQuery.of(context).size;
    String url = "www.petkonnect.com";
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 100),
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //header section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "deepti_priya",
                  style: TextStyle(color: Colors.black, fontSize: 16),
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
            ProfileDetails(),
            SizedBox(
              height: size.height * 0.03,
            ),
            //pets and posts
            Text(
              "My Pets",
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              children: [
                PetAvatar(
                    "https://www.thesprucepets.com/thmb/wpN_ZunUaRQAc_WRdAQRxeTbyoc=/4231x2820/filters:fill(auto,1)/adorable-white-pomeranian-puppy-spitz-921029690-5c8be25d46e0fb000172effe.jpg"),
                PetAvatar(
                    'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/golden-retriever-royalty-free-image-506756303-1560962726.jpg?crop=0.672xw:1.00xh;0.166xw,0&resize=640:*'),
                PetAvatar(
                    "http://cdn.akc.org/content/article-body-image/siberian_husky_cute_puppies.jpg"),
                GestureDetector(
                    child: SvgPicture.asset(
                  "assets/icons/add_post.svg",
                  height: size.height * 0.09,
                  width: size.width * 0.15,
                ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            //Posts
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PostSelection(
                  title: "Post",
                  type: post,
                  onTap: () {
                    setState(() {
                      post = !post;
                    });
                  },
                ),
                PostSelection(
                    title: "Tagged",
                    type: tagged,
                    onTap: () {
                      setState(() {
                        tagged = !tagged;
                      });
                    }),
                PostSelection(
                    title: "Saved",
                    type: saved,
                    onTap: () {
                      setState(() {
                        saved = !saved;
                      });
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PetAvatar extends StatelessWidget {
  final String imageUrl;
  const PetAvatar(this.imageUrl);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(left: 5, right: 5),
        height: size.height * 0.1,
        width: size.width * 0.15,
        child: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}
