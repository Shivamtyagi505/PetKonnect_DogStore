import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_petkon/Kconstants.dart';
import 'package:flutter_petkon/model/order_history.dart';
import 'package:flutter_petkon/screens/OrdersScreen.dart';
import 'package:flutter_petkon/utils/CommonStyles.dart';
import 'package:flutter_petkon/utils/size_config.dart';

import 'TrackingScreen.dart';

class OrderDetailScreen extends StatefulWidget {
  Order order;
  OrderDetailScreen(this.order);
  @override
  _OrderDetailScreenState createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  List<ProductIDs> productList = List();
  List<dynamic> productPrice = List();
  List<dynamic> productQuantity = List();
  @override
  void initState() {
    // TODO: implement initState
    productList = widget.order.productIDs;
    productPrice = widget.order.netPrice;
    productQuantity = widget.order.quantities;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CommonStyles.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: CommonStyles.white,
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: GestureDetector(
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: CommonStyles.black,
                                size: 20,
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              })),
                      Expanded(
                        flex: 11,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Order Details",
                                style: CommonStyles.getMontserratStyle(space_24,
                                    FontWeight.bold, CommonStyles.black)),
                          ],
                        ),
                      ),
                      Expanded(flex: 1, child: Container()),
                    ],
                  ),
                  SizedBox(
                    height: space_30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("My Order",
                          style: CommonStyles.getMontserratStyle(
                              space_16, FontWeight.w600, CommonStyles.black)),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("Order ID : "+widget.order.id.substring(widget.order.id.toString().length - 6),
                            style: CommonStyles.getMontserratStyle(
                                space_16, FontWeight.w600, kPrimarycolor)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: space_30,
                  ),
                  Container(
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.only(bottom: 20),
                        itemCount: productList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: 0, right: 0, top: 10, bottom: 0),
                            child: Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      )),
                                      elevation: 12,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                          color: CommonStyles.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.network(
                                            productList[index]
                                                .productImage[0]
                                                .toString(),
                                            height: 50,
                                            width: 10,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              productList[index]
                                                  .productName
                                                  .toString(),
                                              style: CommonStyles
                                                  .getMontserratStyle(
                                                      space_12,
                                                      FontWeight.bold,
                                                      CommonStyles.black),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "Brand : ${productList[index].productBrand}",
                                          style:
                                              CommonStyles.getMontserratStyle(
                                                  space_10,
                                                  FontWeight.w600,
                                                  CommonStyles.greyColor),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "Size : 2 Kg",
                                          style:
                                              CommonStyles.getMontserratStyle(
                                                  space_10,
                                                  FontWeight.w600,
                                                  CommonStyles.greyColor),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Quantity : " +
                                                  productQuantity[index]
                                                      .toString(),
                                              style: CommonStyles
                                                  .getMontserratStyle(
                                                      space_10,
                                                      FontWeight.w600,
                                                      CommonStyles.greyColor),
                                            ),
                                            Text(
                                              "\u20B9 " +
                                                  productPrice[index]
                                                      .toString(),
                                              style: CommonStyles
                                                  .getMontserratStyle(
                                                      space_17,
                                                      FontWeight.w600,
                                                      kPrimarycolor),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(height: 20),
                  DottedLine(
                    dashColor: CommonStyles.grey,
                    dashLength: 2,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Sub Total : ",
                        style: CommonStyles.getMontserratStyle(
                            space_12, FontWeight.w600, CommonStyles.greyColor),
                      ),
                      Text(
                        "\u20B9 " + "860.00",
                        style: CommonStyles.getMontserratStyle(
                            space_12, FontWeight.w600, CommonStyles.black),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Shipping : ",
                        style: CommonStyles.getMontserratStyle(
                            space_12, FontWeight.w600, CommonStyles.greyColor),
                      ),
                      Text(
                        "\u20B9 " + widget.order.shippingCharges.toString(),
                        style: CommonStyles.getMontserratStyle(
                            space_12, FontWeight.w600, CommonStyles.black),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  DottedLine(
                    dashColor: CommonStyles.greyColor,
                    dashLength: 2,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Total  ",
                        style: CommonStyles.getMontserratStyle(
                            space_16, FontWeight.w600, CommonStyles.greyColor),
                      ),
                      Text(
                        " \u20B9 " + widget.order.finalTotal.toString(),
                        style: CommonStyles.getMontserratStyle(
                            space_22, FontWeight.w600, kPrimarycolor),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  DottedLine(
                    dashColor: CommonStyles.greyColor,
                    dashLength: 2,
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Shipping Address",
                        style: CommonStyles.getMontserratStyle(
                            space_16, FontWeight.w600, CommonStyles.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: space_10,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: space_15,
                          ),
                          Icon(
                            Icons.location_on,
                            color: kPrimarycolor,
                          )
                        ],
                      ),
                      SizedBox(
                        width: space_11,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
//                          Text(""+
//                            "${widget.order.shippingAddress.doorNo}, ${widget.order.shippingAddress.street}",
//                            style: CommonStyles.getMontserratStyle(space_12,
//                                FontWeight.w600, CommonStyles.greyColor),
//                          ),
//                          Text(
//                            "${widget.order.shippingAddress.building}, ${widget.order.shippingAddress.city}, \n${widget.order.shippingAddress.state}, ${widget.order.shippingAddress.zip}  ",
//                            style: CommonStyles.getMontserratStyle(space_10,
//                                FontWeight.w600, CommonStyles.greyColor),
//                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: space_20,
                  ),
                  Text(
                    "Payment Type",
                    style: CommonStyles.getMontserratStyle(
                        space_16, FontWeight.w600, CommonStyles.black),
                  ),
                  SizedBox(
                    height: space_10,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: space_15,
                          ),
                          Image.asset(
                            "assets/images/card.png",
                            scale: 1.7,
                          )
                        ],
                      ),
                      SizedBox(
                        width: space_15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Cash On delivery",
                            style: CommonStyles.getMontserratStyle(
                                space_12, FontWeight.w600, CommonStyles.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: space_50,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {

                      },
                      child: Container(

                          width: space_250,
                          height: space_40,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: kPrimarycolor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Cancel",
                                style: CommonStyles.getMontserratStyle(
                                    space_16, FontWeight.w600, Colors.white),
                              ),
                            ],
                          )),
                    ),
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TrackingOrder(
                                  widget.order.id,
                                  widget.order.createdAt,
                                  widget.order.confirmationDate,
                                  widget.order.dispatchedDate,
                                  widget.order.deliveredDate)),
                        );
                      },
                      child: Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          width: space_250,
                          height: space_40,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(5)),
                              color: kPrimarycolor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Track Order",
                                style: CommonStyles.getMontserratStyle(
                                    space_16, FontWeight.w600, Colors.white),
                              ),
                            ],
                          )),
                    ),
                  ),
                  SizedBox(
                    height: space_30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
