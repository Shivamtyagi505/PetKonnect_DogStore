import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_petkon/bloc/CommonBloc.dart';
import 'package:flutter_petkon/bloc/CommonEvent.dart';
import 'package:flutter_petkon/bloc/CommonState.dart';
import 'package:flutter_petkon/model/DeleteCartResponse.dart';
import 'package:flutter_petkon/model/view_cart.dart';
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
  List<Cart> cart= List();
  ViewCartResponse viewCartResponse;
  DeleteCartResponse deleteCartResponse;
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
            }else if (state is DeletecartResState) {
              print("dlete main ayyyyyyyyyyy");
              deleteCartResponse = state.res;
              if(deleteCartResponse.status){
                commonBloc..add(ViewCartEvent(token: widget.token));
              }
            }
            else if(state is ConfirmOrderResState){
              if(state.res.status){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          OrderScreen(widget.token)),
                );
              }
            }
          },
          child: BlocBuilder<CommonBloc, CommonState>(
            builder: (context, state) {
              debugPrint("ARRAYPOPULATBlocBuilder --> ${viewCartResponse?.cart?.length}");
              if(viewCartResponse?.cart?.length==0){

                   return noDataInCart();
              }else{
                if (state is ViewCartResState) {
                  if(state?.res?.status){
                    return getScreenUI(state.res);
                  }else{
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

  noDataInCart(){
    return new Scaffold(
        body: Center(
          child: Container(
            child: Center(child: Text("Cart is empty..", style: new TextStyle(
              fontSize:26.0,

            ),)),
          ),
        ),);
  }
  getScreenUI(ViewCartResponse viewCartResponse){

    debugPrint("ARRAYPOPULATE4 --> ${viewCartResponse?.cart?.length}");
    cart = viewCartResponse?.cart;
    debugPrint("ARRAYPOPULATE2 --> ${cart?.length}");
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: space_0,
        centerTitle: true,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, color: CommonStyles.grey,),),
        title: Text("Cart", style: CommonStyles.getMontserratStyle(space_18, FontWeight.w600,  CommonStyles.grey),),
      ),
      body: Container(
        margin: EdgeInsets.all(space_15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(top: space_25),
                child: Text("Your Orders", style: CommonStyles.getMontserratStyle(space_15, FontWeight.w500, CommonStyles.grey),)),
            SizedBox(height: space_20,),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: cart[0]?.products?.length,
               itemBuilder: (BuildContext context, int index) {

                  return CardItemWidget(cart[0]?.products[index],cart[0]?.quantities[index],commonBloc,widget.token);

            }),

            ),
            SizedBox(height: space_30,),
            DashedLine(
              color: CommonStyles.grey,
              height: space_1,
              dashWidth: space_3,
            ),
            SizedBox(height: space_15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("Shipping :"+cart[0].shippingCharges.toString(), style: CommonStyles.getMontserratStyle(space_16, FontWeight.w400, Colors.black),),
                SizedBox(height: space_15,),
                DashedLine(
                  color: CommonStyles.grey,
                  height: space_1,
                  dashWidth: space_3,
                ),
                SizedBox(height: space_15,),
                RichText(
                  text: new TextSpan(
                    text: 'Total ',
                    style: CommonStyles.getMontserratStyle(space_16, FontWeight.w400, Colors.black),
                    children: <TextSpan>[
                      new TextSpan(
                        text: '\u20B9 '+cart[0].subTotal.toString(),
                        style: CommonStyles.getMontserratStyle(space_20, FontWeight.w600, CommonStyles.darkAmber),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: space_30,),
            GestureDetector(
              onTap: () {
                commonBloc..add(ConfirmorderEvent(token: widget.token));
              },
              child: Container(
                margin: EdgeInsets.only(top: space_15),
                height: space_50,
                decoration: BoxDecoration(
                    color: CommonStyles.amber,
                    borderRadius: BorderRadius.circular(space_5)),
                child: Center(
                  child: Padding(
                      padding: EdgeInsets.all(space_15),
                      child: Text(
                        "Check Out",
                        style: CommonStyles.getRalewayStyle(
                            space_14,
                            FontWeight.w600,
                            Colors.white),
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
