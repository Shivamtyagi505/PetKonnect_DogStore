import 'package:flutter/material.dart';
import 'package:flutter_petkon/Kconstants.dart';
import 'package:flutter_petkon/model/FilterData.dart';
import 'package:flutter_petkon/utils/CommonStyles.dart';
import 'package:flutter_petkon/utils/size_config.dart';

class FilterScreen extends StatefulWidget {
  List<String> filterPet;
  FilterScreen(this.filterPet);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}
//Navigator.pop(context, new OtpObj(widget.contact, otpController.text.trim()));

class _FilterScreenState extends State<FilterScreen> {
  var mSortBy = "";
  var mFoods = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: space_0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: CommonStyles.grey,
            ),
          ),
          title: Text(
            "Filter",
            style: CommonStyles.getMontserratStyle(
                space_18, FontWeight.w600, CommonStyles.grey),
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: space_15),
          child: ListView(
            children: [
              SizedBox(
                height: space_15,
              ),
              Text(
                "Sort by",
                style: CommonStyles.getMontserratStyle(
                    space_15, FontWeight.w600, Colors.black),
              ),
              SizedBox(
                height: space_15,
              ),
              Wrap(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        mSortBy = "low";
                      });
                    },
                    child: Container(
                      width: space_150,
                      margin: EdgeInsets.only(right: space_8, top: space_5),
                      padding: EdgeInsets.symmetric(
                          horizontal: space_15, vertical: space_10),
                      decoration: BoxDecoration(
                          color:
                              mSortBy == "low" ? kPrimarycolor : Colors.white,
                          border: Border.all(
                              color: mSortBy == "low"
                                  ? CommonStyles.amber
                                  : CommonStyles.grey),
                          borderRadius: BorderRadius.circular(space_25)),
                      child: Center(
                        child: Text(
                          "Cost Low > high",
                          style: CommonStyles.getMontserratStyle(
                              space_12,
                              FontWeight.w600,
                              mSortBy == "low"
                                  ? Colors.white
                                  : CommonStyles.grey),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        mSortBy = "high";
                      });
                    },
                    child: Container(
                      width: space_150,
                      margin: EdgeInsets.only(right: space_8, top: space_5),
                      padding: EdgeInsets.symmetric(
                          horizontal: space_15, vertical: space_10),
                      decoration: BoxDecoration(
                          color:
                              mSortBy == "high" ? kPrimarycolor : Colors.white,
                          border: Border.all(
                            color: mSortBy == "high"
                                ? CommonStyles.amber
                                : CommonStyles.grey,
                          ),
                          borderRadius: BorderRadius.circular(space_25)),
                      child: Center(
                        child: Text(
                          "Cost High > Low",
                          style: CommonStyles.getMontserratStyle(
                              space_12,
                              FontWeight.w600,
                              mSortBy == "high"
                                  ? Colors.white
                                  : CommonStyles.grey),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: space_25,
              ),
              Text(
                "Foods",
                style: CommonStyles.getMontserratStyle(
                    space_15, FontWeight.w600, Colors.black),
              ),
              SizedBox(
                height: space_15,
              ),
              Wrap(
                children: widget?.filterPet
                    .map((item) => GestureDetector(
                          onTap: () {
                            setState(() {
                              mFoods = item;
                            });
                          },
                          child: Container(
                            width: space_100,
                            margin:
                                EdgeInsets.only(right: space_8, top: space_5),
                            padding: EdgeInsets.symmetric(
                                horizontal: space_15, vertical: space_10),
                            decoration: BoxDecoration(
                                color: mFoods == item
                                    ? kPrimarycolor
                                    : Colors.white,
                                border: Border.all(
                                  color: mFoods == item
                                      ? kPrimarycolor
                                      : CommonStyles.grey,
                                ),
                                borderRadius: BorderRadius.circular(space_25)),
                            child: Center(
                              child: Text(
                                "${item}",
                                style: CommonStyles.getMontserratStyle(
                                    space_12,
                                    FontWeight.w600,
                                    mFoods == item
                                        ? Colors.white
                                        : CommonStyles.grey),
                              ),
                            ),
                          ),
                        ))
                    .toList()
                    .cast<Widget>(),
              ),

//              SizedBox(height: space_25,),
//              Text("Ratings", style: CommonStyles.getMontserratStyle(space_15, FontWeight.w600, Colors.black),),
//              SizedBox(height: space_15,),
//              Wrap(
//                children: [
//                  Container(width: space_100,
//                    margin: EdgeInsets.only(right: space_8, top: space_5),
//                    padding: EdgeInsets.symmetric(horizontal: space_15, vertical: space_10),
//                    decoration: BoxDecoration(
//                        border: Border.all(color: CommonStyles.grey),
//                        borderRadius: BorderRadius.circular(space_25)
//                    ),
//                    child: Center(
//                      child: Text("Top Rating", style: CommonStyles.getMontserratStyle(space_12, FontWeight.w600, CommonStyles.grey),),
//                    ),
//                  ),
//                  Container(width: space_100,
//                    margin: EdgeInsets.only(right: space_8, top: space_5),
//                    padding: EdgeInsets.symmetric(horizontal: space_15, vertical: space_10),
//                    decoration: BoxDecoration(
//                      color: CommonStyles.amber,
//                        border: Border.all(color: CommonStyles.amber),
//                        borderRadius: BorderRadius.circular(space_25)
//                    ),
//                    child: Center(
//                      child: Text("Via Stars", style: CommonStyles.getMontserratStyle(space_12, FontWeight.w600, Colors.white),),
//                    ),
//                  ),
//
//                ],
//              ),

//              SizedBox(height: space_25,),
//              Text("Offers", style: CommonStyles.getMontserratStyle(space_15, FontWeight.w600, Colors.black),),
//              SizedBox(height: space_15,),
//              Wrap(
//                children: [
//                  Container(width: space_100,
//                    margin: EdgeInsets.only(right: space_8, top: space_5),
//                    padding: EdgeInsets.symmetric(horizontal: space_15, vertical: space_10),
//                    decoration: BoxDecoration(
//                        border: Border.all(color: CommonStyles.grey),
//                        borderRadius: BorderRadius.circular(space_25)
//                    ),
//                    child: Center(
//                      child: Text("50% OFF", style: CommonStyles.getMontserratStyle(space_12, FontWeight.w600, CommonStyles.grey),),
//                    ),
//                  ),
//                  Container(width: space_120,
//                    margin: EdgeInsets.only(right: space_8, top: space_5),
//                    padding: EdgeInsets.symmetric(horizontal: space_15, vertical: space_10),
//                    decoration: BoxDecoration(
//                      color: CommonStyles.amber,
//                        border: Border.all(color: CommonStyles.amber),
//                        borderRadius: BorderRadius.circular(space_25)
//                    ),
//                    child: Center(
//                      child: Text("Todays Offer", style: CommonStyles.getMontserratStyle(space_12, FontWeight.w600, Colors.white),),
//                    ),
//                  ),
//                  Container(width: space_140,
//                    margin: EdgeInsets.only(right: space_8, top: space_5),
//                    padding: EdgeInsets.symmetric(horizontal: space_15, vertical: space_10),
//                    decoration: BoxDecoration(
//                        border: Border.all(color: CommonStyles.grey),
//                        borderRadius: BorderRadius.circular(space_25)
//                    ),
//                    child: Center(
//                      child: Text("Festival Offers", style: CommonStyles.getMontserratStyle(space_12, FontWeight.w600, CommonStyles.grey),),
//                    ),
//                  ),
//
//                ],
//              ),

              SizedBox(
                height: space_70,
              ),
              Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        mSortBy = "";
                        mFoods = "";
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(space_15),
                      margin: EdgeInsets.all(space_15),
                      decoration: BoxDecoration(
                          border: Border.all(color: CommonStyles.grey),
                          borderRadius: BorderRadius.circular(space_10)),
                      child: Center(
                        child: Text(
                          "Reset",
                          style: CommonStyles.getMontserratStyle(
                              space_15, FontWeight.w600, CommonStyles.grey),
                        ),
                      ),
                    ),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context, FilterData(mSortBy, mFoods));
                    },
                    child: Container(
                      padding: EdgeInsets.all(space_15),
                      margin: EdgeInsets.all(space_15),
                      decoration: BoxDecoration(
                          color: kPrimarycolor,
                          border: Border.all(color: Colors.amber),
                          borderRadius: BorderRadius.circular(space_10)),
                      child: Center(
                        child: Text(
                          "Search",
                          style: CommonStyles.getMontserratStyle(
                              space_15, FontWeight.w600, Colors.white),
                        ),
                      ),
                    ),
                  )),
                ],
              ),
              SizedBox(
                height: space_15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
