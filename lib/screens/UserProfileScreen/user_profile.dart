import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_petkon/Kconstants.dart';
import 'package:flutter_petkon/screens/MyCart.dart';
import 'package:flutter_petkon/screens/pet_profile/pet_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'components/PostSelction.dart';
import 'components/ProfileDetails.dart';
import 'package:flutter_svg/svg.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  var name = "", email = "";
  getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = jsonDecode(prefs.getString('USER_LOGIN_RES'))['token'];
    final response = await http.get("https://petkonnect.in/api/user", headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var user = jsonDecode(response.body);
    setState(() {
      name = user['name'];
      email = user['email'];
    });
  }

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool post = true;
    bool tagged = false;
    bool saved = false;
    Size size = MediaQuery.of(context).size;
    String url = "www.petkonnect.com";
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                right: 30.0,
              ),
              child: Container(
                  height: 50,
                  width: 100,
                  child: new Image.asset('assets/icons/logo.png')),
            ),
            InkWell(
                onTap: () {
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 20.0,
                  ),
                  child: Container(
                      height: 30,
                      width: 30,
                      child: new Image.asset('assets/icons/profile.png')),
                )),
            InkWell(
                onTap: () {
                  //  Navigator.push(
                  //    context,
                  //    MaterialPageRoute(
                  //        builder: (context) =>
                  //            MyCartScreen(token)),
                  //  );
                },
                child: Container(
                    height: 30,
                    width: 30,
                    child: new Image.asset('assets/icons/shopping_cart.png')))
          ],
        ),
      ),
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
                  name,
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
            ProfileDetails(name: name, email: email),
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
      onTap: () {
        Navigator.of(context).pushNamed('/petProfile', arguments: imageUrl);
      },
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
