import 'package:flutter/material.dart';
import './poststats.dart';

class Post extends StatelessWidget {
  const Post({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imageUrl =
        "https://www.rd.com/wp-content/uploads/2021/03/GettyImages-1133605325-scaled-e1617227898456.jpg";
    Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/icons/profile.png",
                      height: size.height * 0.07,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Salanki Divya",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "22/10/2021",
                          style: TextStyle(color: Colors.black45),
                        )
                      ],
                    ),
                  ],
                ),
                IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
              ],
            ),
            SizedBox(
              height: size.height * .01,
            ),
            Stack(
              children: [
                Image.network(
                  imageUrl,
                  height: size.height * 0.3,
                ),
                Positioned(
                  bottom: 0,
                  right: 30,
                  child: Row(
                    children: [
                      Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: Image.asset("assets/icons/like_red@2x.png")),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child:
                              Image.asset("assets/icons/comment_grey@2x.png")),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: Image.asset("assets/icons/share@3x.png"))
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                PostStats(
                  imgSrc: "assets/icons/like_grey.png",
                  text: "454 likes",
                ),
                SizedBox(
                  width: 10,
                ),
                PostStats(
                    imgSrc: "assets/icons/comment_grey@2x.png",
                    text: "4 comments"),
                SizedBox(
                  width: 10,
                ),
                PostStats(
                    imgSrc: "assets/icons/share@2x.png", text: "10 shares")
              ],
            )
          ],
        ),
      ),
    );
  }
}
