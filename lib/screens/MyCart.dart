import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_petkon/Kconstants.dart';
import 'package:flutter_petkon/bloc/CommonBloc.dart';
import 'package:flutter_petkon/bloc/CommonEvent.dart';
import 'package:flutter_petkon/bloc/CommonState.dart';
import 'package:flutter_petkon/model/DeleteCartResponse.dart';
import 'package:flutter_petkon/model/view_cart.dart';
import 'package:flutter_petkon/screens/LandingScreen.dart';
import 'package:flutter_petkon/screens/StoreListingScreen.dart';
import 'package:flutter_petkon/utils/CommonStyles.dart';
import 'package:flutter_petkon/utils/size_config.dart';
import 'package:flutter_petkon/widgets/CommonWidget.dart';

import 'OrdersScreen.dart';

class MyCartScreen extends StatefulWidget {
  var token;

  MyCartScreen(this.token);

  @override
  _MyCartScreenState createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  CommonBloc commonBloc = new CommonBloc();
  ViewCartResponse viewCartResponse;
  DeleteCartResponse deleteCartResponse;
  var shippings = 0;
  var subtotals = 0;
  var all_total = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => commonBloc..add(ViewCartEvent(token: widget.token)),
      child: BlocListener(
          cubit: commonBloc,
          listener: (context, state) {
            print("delete State");
            if (state is ViewCartResState) {
              viewCartResponse = state.res;
            } else if (state is DeletecartResState) {
              print("dlete main ayyyyyyyyyyy");
              deleteCartResponse = state.res;
              if (deleteCartResponse.status) {
                commonBloc..add(ViewCartEvent(token: widget.token));
              }
            } else if (state is ConfirmOrderResState) {
              if (state.res.status) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OrderScreen(widget.token)),
                );
              }
            }
          },
          child: BlocBuilder<CommonBloc, CommonState>(
            builder: (context, state) {
              debugPrint(
                  "ARRAYPOPULATBlocBuilder --> ${viewCartResponse?.cart?.length}");
              if (viewCartResponse?.cart?.length == 0) {
                return noDataInCart();
              } else {
                if (state is ViewCartResState) {
                  print("enjnhjnhjfrhxc    " + "yhhhhhhhhhhhhhhhhhhhhhhhha");
                  if (state?.res?.status) {
                    print("enjnhjnhjfrhxc    " + "step one check");
                    List<CartProduct> products = List();
                    List<int> quantities = List();
                    products.clear();
                    quantities.clear();
                    print("enjnhjnhjfrhxc    " +
                        viewCartResponse?.cart?.length.toString());
                    for (var i = 0; i < viewCartResponse?.cart?.length; i++) {
                      print("enjnhjnhjfrhxc    " + i.toString());
                      print("enjnhjnhjfrhxc    " + "step one two check");
                      shippings =
                          shippings + viewCartResponse?.cart[i].shippingCharges;
                      subtotals = subtotals +
                          (viewCartResponse?.cart[i].subTotal.toInt() -
                              viewCartResponse?.cart[i].shippingCharges);
                      for (var j = 0;
                          j < viewCartResponse?.cart[i]?.products?.length;
                          j++) {
                        products.add(viewCartResponse?.cart[i]?.products[j]);
                        quantities
                            .add(viewCartResponse?.cart[i]?.quantities[j]);
                        print("enjnhjnhjfrhxc    " + "step one three check");
                      }
                    }
                    all_total = shippings + subtotals;
                    print("enjnhjnhjfrhxc    " + products.length.toString());
                    return getScreenUI(products, quantities);
                  } else {
                    return ProgressWidget();
                  }
                } else {
                  return ProgressWidget();
                }
              }
            },
          )),
    );
  }

  noDataInCart() {
    return new Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You cart is empty !",
            style: TextStyle(
                color: Colors.black87,
                fontFamily: "Montserrat",
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "You can explore our products on our",
                style: TextStyle(color: Colors.black54),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LandingScreen(widget.token)));
                  },
                  child: Text(
                    "Store page",
                    style: TextStyle(color: kPrimarycolor),
                  ))
            ],
          )
        ],
      ),
    ));
  }

  getScreenUI(List<CartProduct> products, List<int> quantities) {
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
          "Cart",
          style: CommonStyles.getMontserratStyle(
              space_18, FontWeight.w600, CommonStyles.grey),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(space_15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(top: space_25),
                child: Text(
                  "Your Order",
                  style: CommonStyles.getMontserratStyle(
                      space_15, FontWeight.w500, CommonStyles.black),
                )),
            SizedBox(
              height: space_20,
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: products?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CardItemWidget(products[index], quantities[index],
                        commonBloc, widget.token);
                  }),
            ),
            SizedBox(
              height: space_30,
            ),
            DashedLine(
              color: CommonStyles.grey,
              height: space_1,
              dashWidth: space_3,
            ),
            SizedBox(
              height: space_15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Shipping :" + shippings.toString(),
                  style: CommonStyles.getMontserratStyle(
                      space_16, FontWeight.w400, Colors.black),
                ),
                SizedBox(
                  height: space_15,
                ),
                DashedLine(
                  color: CommonStyles.grey,
                  height: space_1,
                  dashWidth: space_3,
                ),
                SizedBox(
                  height: space_15,
                ),
                RichText(
                  text: new TextSpan(
                    text: 'Total ',
                    style: CommonStyles.getMontserratStyle(
                        space_16, FontWeight.w400, Colors.black),
                    children: <TextSpan>[
                      new TextSpan(
                        text: '\u20B9 ' + all_total.toString(),
                        style: CommonStyles.getMontserratStyle(
                            space_20, FontWeight.w600, kPrimarycolor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: space_30,
            ),
            GestureDetector(
              onTap: () {
                commonBloc..add(ConfirmorderEvent(token: widget.token));
              },
              child: Container(
                margin: EdgeInsets.only(top: space_15),
                height: space_50,
                decoration: BoxDecoration(
                    color: kPrimarycolor,
                    borderRadius: BorderRadius.circular(space_5)),
                child: Center(
                  child: Padding(
                      padding: EdgeInsets.all(space_15),
                      child: Text(
                        "Check Out",
                        style: CommonStyles.getRalewayStyle(
                            space_14, FontWeight.w600, Colors.white),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
