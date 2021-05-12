import 'package:flutter/material.dart';
import 'package:flutter_petkon/Kconstants.dart';
import 'package:flutter_petkon/utils/CommonStyles.dart';
import 'package:flutter_petkon/utils/size_config.dart';
import 'package:intl/intl.dart';

class TrackingOrder extends StatefulWidget {
  var orderid, createdAt, confirmationDate, dispatchedDate, deliveredDate;
  TrackingOrder(this.orderid, this.createdAt, this.confirmationDate,
      this.dispatchedDate, this.deliveredDate);

  @override
  _TrackingOrderState createState() => _TrackingOrderState();
}

class _TrackingOrderState extends State<TrackingOrder> {

  @override
  void initState() {
    // TODO: implement initState
    print(DateTime.parse(widget.createdAt));
    print(DateFormat.yMd().format(DateTime.parse(widget.createdAt)));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: orderTimeLine(),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget orderTimeLine() {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      margin: EdgeInsets.only(bottom: 50, left: 7, right: 7),
      padding: EdgeInsets.only(
        top: 50,
        bottom: 50,
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  flex: 2,
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
                flex: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Track order",
                        style: CommonStyles.getMontserratStyle(
                            space_24, FontWeight.bold, CommonStyles.black)),
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
            children: [
              Text("Order ID : " + widget.orderid.toString().substring( widget.orderid.toString().length - 6),
                  style: CommonStyles.getMontserratStyle(
                      space_16, FontWeight.w600, kPrimarycolor)),
            ],
          ),
          SizedBox(
            height: space_30,
          ),
          timelineRow(
              "assets/icons/order_placed.png",
              "Order Placed",
              "We had received your order",
              widget.createdAt == null ? "" : DateFormat.yMd().format(DateTime.parse(widget.createdAt)),
              widget.createdAt == null ? "" :DateFormat.jm().format(DateTime.parse(widget.createdAt))),
          timelineRow(
              "assets/icons/order_proccess.png",
              "Order processed",
              "Order has been processed",
              widget.confirmationDate == null ? "" : DateFormat.yMd().format(DateTime.parse(widget.confirmationDate)),
              widget.confirmationDate == null ? "" :DateFormat.jm().format(DateTime.parse(widget.confirmationDate))),
          timelineRow(
              "assets/icons/ready_to_ship.png",
              "Ready to ship",
              "Your Order is ready for shipping",
              widget.dispatchedDate == null ? "" : DateFormat.yMd().format(DateTime.parse(widget.dispatchedDate)),
              widget.dispatchedDate == null ? "" :DateFormat.jm().format(DateTime.parse(widget.dispatchedDate))),
          timelineRow(
              "assets/icons/out_for_delivery.png",
              "Out for Delivery",
              "Your order is dispatched",
               widget.dispatchedDate == null ? "" : DateFormat.yMd().format(DateTime.parse(widget.dispatchedDate)),
               widget.dispatchedDate == null ? "" :DateFormat.jm().format(DateTime.parse(widget.dispatchedDate))),
          timelineLastRow(
              "assets/icons/delivered.png",
              "Delivered Successfully",
              "Your order is delivered to the given address",
              widget.deliveredDate == null ? "" : DateFormat.yMd().format(DateTime.parse(widget.deliveredDate)),
              widget.deliveredDate == null ? "" :DateFormat.jm().format(DateTime.parse(widget.deliveredDate))),
          SizedBox(height: 20),
          SizedBox(
            height: space_10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: space_80),
            child: Row(
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: space_15,
                    ),
                    Image.asset(
                      "assets/images/location.png",
                      scale: 2,
                    )
                  ],
                ),
                SizedBox(
                  width: space_11,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Delivered Address",
                      style: CommonStyles.getMontserratStyle(
                          space_16, FontWeight.w600, CommonStyles.black),
                    ),
                    Text(
                      "Home",
                      style: CommonStyles.getMontserratStyle(
                          space_12, FontWeight.w600, CommonStyles.greyColor),
                    ),
                    Text(
                      "No.2, KK Road, T Nagar,\nChennai 600026 ",
                      style: CommonStyles.getMontserratStyle(
                          space_10, FontWeight.w600, CommonStyles.greyColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: space_20,
          ),
        ],
      ),
    );
  }

  Widget timelineRow(String Icons, String title, String description,
      String date, String time) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child:
              Container(height: 30, width: 30, child: new Image.asset(Icons)),
        ),
        Expanded(
          flex: 1,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 18,
                height: 18,
                decoration: new BoxDecoration(
                  border: Border.all(color: kPrimarycolor),
                  color: date.isEmpty ? CommonStyles.white : kPrimarycolor,
                  shape: BoxShape.circle,
                ),
                child: Text(""),
              ),
              Container(
                width: 1,
                height: 50,
                decoration: new BoxDecoration(
                  color: kPrimarycolor,
                  shape: BoxShape.rectangle,
                ),
                child: Text(""),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 8,
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                Radius.circular(10),
              )),
              elevation: 12,
              child: Container(
                  margin: EdgeInsets.all(space_5),
                  height: 50,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('${title}',
                              style: CommonStyles.getMontserratStyle(space_12,
                                  FontWeight.bold, CommonStyles.black)),
                          SizedBox(
                            height: space_2,
                          ),
                          Text('${description}',
                              style: CommonStyles.getMontserratStyle(space_10,
                                  FontWeight.normal, CommonStyles.black)),
                        ],
                      ),
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(date,
                              style: CommonStyles.getMontserratStyle(space_8,
                                  FontWeight.normal, CommonStyles.black)),
                          SizedBox(
                            height: space_2,
                          ),
                          Text(time,
                              style: CommonStyles.getMontserratStyle(space_8,
                                  FontWeight.normal, CommonStyles.black)),
                        ],
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ],
    );
  }

  Widget timelineLastRow(String Icons, String title, String description,
      String date, String time) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Center(
              child: Container(
                  height: 30, width: 30, child: new Image.asset(Icons))),
        ),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 18,
                height: 18,
                decoration: new BoxDecoration(
                  border: Border.all(color: CommonStyles.darkAmber),
                  color: date.isEmpty
                      ? CommonStyles.white
                      : CommonStyles.darkAmber,
                  shape: BoxShape.circle,
                ),
                child: Text(""),
              ),
              Container(
                width: 3,
                height: 60,
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                child: Text(""),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 8,
          child: Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 5),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                Radius.circular(10),
              )),
              elevation: 12,
              child: Container(
                  margin: EdgeInsets.all(space_5),
                  height: 50,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('${title}',
                              style: CommonStyles.getMontserratStyle(space_12,
                                  FontWeight.bold, CommonStyles.black)),
                          SizedBox(
                            height: space_2,
                          ),
                          Text('${description}',
                              style: CommonStyles.getMontserratStyle(space_10,
                                  FontWeight.normal, CommonStyles.black)),
                        ],
                      ),
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(date,
                              style: CommonStyles.getMontserratStyle(space_8,
                                  FontWeight.normal, CommonStyles.black)),
                          SizedBox(
                            height: space_2,
                          ),
                          Text(time,
                              style: CommonStyles.getMontserratStyle(space_8,
                                  FontWeight.normal, CommonStyles.black)),
                        ],
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
