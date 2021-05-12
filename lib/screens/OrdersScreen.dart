import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_petkon/Kconstants.dart';
import 'package:flutter_petkon/bloc/CommonBloc.dart';
import 'package:flutter_petkon/bloc/CommonEvent.dart';
import 'package:flutter_petkon/bloc/CommonState.dart';
import 'package:flutter_petkon/model/order_history.dart';
import 'package:flutter_petkon/screens/OrderDetails.dart';
import 'package:flutter_petkon/utils/CommonStyles.dart';
import 'package:flutter_petkon/utils/size_config.dart';
import 'package:flutter_petkon/widgets/CommonWidget.dart';
import 'package:http/io_client.dart';

class OrderScreen extends StatefulWidget {
  var token;
  OrderScreen(this.token);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<Order> orderList = List();
  Future<OrderHistoryResponse> futureAlbum;

  makeHttpSecure() {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    var http = new IOClient(ioc);
    return http;
  }

  Future<OrderHistoryResponse> fetchOrders() async {
    var http = makeHttpSecure();
    print("-----------${BASE_URL + ORDER_HISTORY}");
    final res = await http.post(BASE_URL + ORDER_HISTORY, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${widget.token}',
    });
    print("-----------${res.statusCode}");

    if (res.statusCode == 200) {
      var order = OrderHistoryResponse.fromJson(jsonDecode(res.body));
      orderList = order.order;

      setState(() {
        getScreenUi();
      });
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return OrderHistoryResponse.fromJson(jsonDecode(res.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.

      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    futureAlbum = fetchOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return getScreenUi();
  }

  getScreenUi() {
    print(orderList.length);
    final _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CommonStyles.white,
      body: FutureBuilder(
          future: futureAlbum,
          builder: (context, snapshot) {
            print(snapshot.connectionState.toString() +
                "   yha aaya eske inside   " +
                orderList.length.toString());
            if (snapshot.connectionState == ConnectionState.done) {
              if (orderList.length == 0) {
                return Center(
                  child: Container(
                    child: Center(
                        child: Text(
                      "Order history is empty..",
                      style: new TextStyle(
                        fontSize: 26.0,
                      ),
                    )),
                  ),
                );
              } else {
                return Container(
                  margin: EdgeInsets.only(top: space_40),
                  padding: EdgeInsets.fromLTRB(8, 0, 5, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My orders",
                        style: CommonStyles.getMontserratStyle(
                            space_16, FontWeight.w600, CommonStyles.black),
                      ),
                      SizedBox(
                        height: space_10,
                      ),
                      Expanded(
                        child: Container(
                          height: _screenSize.height,
                          child: ListView.builder(
                              physics: AlwaysScrollableScrollPhysics(),
                              shrinkWrap: true,
                              padding: EdgeInsets.only(bottom: 20),
                              itemCount: orderList.length,
                              itemBuilder: (BuildContext context, int index) {
                                if (orderList.length == null)
                                  return CircularProgressIndicator();
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: 0, right: 0, top: 10, bottom: 0),
                                  child: InkWell(
                                    onTap: () {
                                      print(orderList[index]);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                OrderDetailScreen(
                                                    orderList[index])),
                                      );
                                    },
                                    child: Container(
                                      decoration: new BoxDecoration(
                                        boxShadow: [
                                          new BoxShadow(
                                            color: Colors.grey[50],
                                            blurRadius: 0.0,
                                            offset: Offset(
                                              1.0, // Move to right 10  horizontally
                                              1.0, // Move to bottom 10 Vertically
                                            ),
                                          ),
                                        ],
                                      ),
                                      child: Card(
                                        elevation: 2,
                                        child: Container(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(10),
                                                    ),
                                                    color: CommonStyles.white,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Image.network(
                                                      orderList[index]
                                                          .vendorID
                                                          .storeImage,
                                                      height: 70,
                                                      width: 0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Expanded(
                                                flex: 3,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      flex: 2,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            height: 8,
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Flexible(
                                                                child: Text(
                                                                  "Order Id : " +
                                                                      orderList[index].id.toString().substring(orderList[index].id.toString().length - 6) ,
                                                                  style: CommonStyles.getMontserratStyle(
                                                                      space_11,
                                                                      FontWeight
                                                                          .bold,
                                                                      CommonStyles
                                                                          .black),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 4,
                                                          ),
                                                          SizedBox(
                                                            height: 4,
                                                          ),
                                                          Text(
                                                            "Vendor : " +
                                                                orderList[index]
                                                                    .vendorID
                                                                    .vendorName,
                                                            style: CommonStyles
                                                                .getMontserratStyle(
                                                                    space_10,
                                                                    FontWeight
                                                                        .w600,
                                                                    CommonStyles
                                                                        .black),
                                                          ),
                                                          SizedBox(
                                                            height: 4,
                                                          ),
                                                          SizedBox(
                                                            height: 4,
                                                          ),
                                                          Text(
                                                            "Price :" +
                                                                " \u20B9 " +
                                                                orderList[index]
                                                                    .finalTotal
                                                                    .toString(),
                                                            style: CommonStyles
                                                                .getMontserratStyle(
                                                                    space_10,
                                                                    FontWeight
                                                                        .w600,
                                                                    CommonStyles
                                                                        .black),
                                                          ),
                                                          SizedBox(
                                                            height: 8,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 8.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    new Icon(
                                                                        Icons
                                                                            .brightness_1,
                                                                        size:
                                                                            10.0,
                                                                        color:
                                                                            kPrimarycolor),
                                                                    SizedBox(
                                                                      width: 2,
                                                                    ),
                                                                    Text(
                                                                      orderList[
                                                                              index]
                                                                          .orderStatus,
                                                                      style: CommonStyles.getMontserratStyle(
                                                                          space_12,
                                                                          FontWeight
                                                                              .w700,
                                                                          CommonStyles
                                                                              .black),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 6,
                                                            ),
                                                            SizedBox(
                                                              height: 6,
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {},
                                                              child: Container(
                                                                width:
                                                                    space_140,
                                                                height:
                                                                    space_25,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              2),
                                                                  border: Border
                                                                      .all(
                                                                    color:
                                                                        kPrimarycolor,
                                                                  ),
                                                                  color: CommonStyles
                                                                      .transparentColor,
                                                                ),
                                                                child: Center(
                                                                  child: Text(
                                                                    "Rate & Review Product",
                                                                    style: TextStyle(
                                                                        color:
                                                                            kPrimarycolor,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontSize:
                                                                            10),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      )
                    ],
                  ),
                );
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
