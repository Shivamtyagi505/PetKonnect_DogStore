import 'package:flutter/material.dart';
import 'package:flutter_petkon/Kconstants.dart';
import 'package:flutter_petkon/screens/UserProfileScreen/user_profile.dart';
import 'package:flutter_petkon/screens/pet_profile/edit_pet.dart';
import 'package:flutter_svg/svg.dart';
import 'components/Banner.dart';

class PetProfile extends StatefulWidget {
  @override
  _PetProfileState createState() => _PetProfileState();
}

class _PetProfileState extends State<PetProfile> {
  getUserData() async {
    var petId = (ModalRoute.of(context).settings.arguments
        as Map<String, String>)['petId'];
    print("petRequest : https://petkonnect.in/pet/$petId");
  }

  @override
  Widget build(BuildContext context) {
    getUserData();
    final routes =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    // print(routes);
    var imageUrl = routes['imageUrl'];
    Size size = MediaQuery.of(context).size;
    bool editPet;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            BannerPetProfile(imageUrl),
            //Edit Details Button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          editPet = true;
                        });
                        Navigator.of(context)
                            .pushNamed('/EditPet', arguments: editPet);
                      },
                      child: Text(
                        "Edit Details",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Montserrat",
                            color: kPrimarycolor),
                      )),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PetDetails(
                  title: "Type",
                  value: "Dog",
                ),
                PetDetails(
                  title: "Age",
                  value: "6 Months",
                ),
                PetDetails(
                  title: "Gender",
                  value: "Male",
                )
              ],
            ),
            SizedBox(
              height: size.height * .02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PetDetails(
                  title: "Type",
                  value: "Dog",
                ),
                PetDetails(
                  title: "Age",
                  value: "6 Months",
                ),
                PetDetails(
                  title: "Gender",
                  value: "Male",
                )
              ],
            ),
            SizedBox(
              height: size.height * .02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "  My Pets",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              children: [
                // PetAvatar(
                //     "https://www.thesprucepets.com/thmb/wpN_ZunUaRQAc_WRdAQRxeTbyoc=/4231x2820/filters:fill(auto,1)/adorable-white-pomeranian-puppy-spitz-921029690-5c8be25d46e0fb000172effe.jpg"),
                // PetAvatar(
                //     'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/golden-retriever-royalty-free-image-506756303-1560962726.jpg?crop=0.672xw:1.00xh;0.166xw,0&resize=640:*'),
                // PetAvatar(
                //     "http://cdn.akc.org/content/article-body-image/siberian_husky_cute_puppies.jpg"),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        editPet = true;
                      });
                      Navigator.of(context)
                          .pushNamed('/EditPet', arguments: editPet);
                    },
                    child: SvgPicture.asset(
                      "assets/icons/add_post.svg",
                      height: size.height * 0.09,
                      width: size.width * 0.15,
                    ))
              ],
            ),
          ],
        )),
      ),
    );
  }
}

class PetDetails extends StatelessWidget {
  final String title;
  final String value;

  const PetDetails({this.title, this.value});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey[300]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: kPrimarycolor,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Text(
            value,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
