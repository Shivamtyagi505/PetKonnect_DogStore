import 'package:flutter/material.dart';

import '../../../Kconstants.dart';

class BannerPetProfile extends StatelessWidget {
  final String imageUrl;
  const BannerPetProfile(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        // The containers in the background
        new Column(
          children: <Widget>[
            new Container(
              height: MediaQuery.of(context).size.height * .37,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(101))),
              child: Image.network(
                imageUrl,
                fit: BoxFit.fill,
              ),
            ),
            new Container(
              height: MediaQuery.of(context).size.height * .08,
              color: kCanvasColor,
            )
          ],
        ),
        Positioned(
            top: 50,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_sharp,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  "Pet Profile",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Montserrat",
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            )),
        // The card widget with top padding,
        // incase if you wanted bottom padding to work,
        // set the `alignment` of container to Alignment.bottomCenter
        new Container(
          alignment: Alignment.topCenter,
          padding: new EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .32,
              right: 20.0,
              left: 20.0),
          child: new Container(
            height: size.height * 0.12,
            width: size.width * 0.6,
            child: new Card(
              color: Colors.white,
              elevation: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Jackson',
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        color: kPrimarycolor,
                        fontWeight: FontWeight.w700,
                        fontSize: 19),
                  ),
                  Text(
                    "Cavalier king Charles",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        color: kTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
