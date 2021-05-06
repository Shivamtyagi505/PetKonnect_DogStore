import 'package:flutter/material.dart';
import 'package:flutter_petkon/Kconstants.dart';
import 'package:flutter_petkon/model/get_all_product_res.dart';
import 'package:flutter_petkon/screens/home_screen/components/product_and_vendor.dart';
import './components/post.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Trending on Social Media",
                style: TextStyle(
                    fontSize: 16,
                    color: kPrimarycolor,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w600)),
            Post(),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text("Product"), Text("Vendor")],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 2,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return ProductAndVendor(
                      title: "Name",
                      img:
                          "https://static.toiimg.com/photo/msid-74508525/74508525.jpg",
                      category: "Foods",
                      price: "400",
                      picedesc: "50% discount");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
