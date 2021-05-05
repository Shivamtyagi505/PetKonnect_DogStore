import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_petkon/utils/CommonStyles.dart';
import 'package:flutter_petkon/utils/size_config.dart';
import 'package:flutter_petkon/widgets/CommonWidget.dart';

class AddInventoryScreen extends StatefulWidget {
  @override
  _AddInventoryScreenState createState() => _AddInventoryScreenState();
}

class _AddInventoryScreenState extends State<AddInventoryScreen> {
  File _productImgFile;
  TextEditingController prodNameController = new TextEditingController();
  TextEditingController prodDescController = new TextEditingController();
  TextEditingController noOfDaysController = new TextEditingController();
  TextEditingController availableQuntController = new TextEditingController();
  TextEditingController sellingPriceController = new TextEditingController();
  TextEditingController mrpController = new TextEditingController();
  TextEditingController purchasePriceController = new TextEditingController();
  TextEditingController hsnNoController = new TextEditingController();
  TextEditingController minOrderQuantController = new TextEditingController();
  TextEditingController discountPercentController = new TextEditingController();
  TextEditingController custTaxNameController = new TextEditingController();
  TextEditingController custTaxRateController = new TextEditingController();
  TextEditingController subunitPerUnitController = new TextEditingController();

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
          "Add Inventory",
          style: CommonStyles.getMontserratStyle(
              space_18, FontWeight.w600, CommonStyles.grey),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(space_15),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              width: double.infinity,
              height: space_150,
              child: _productImgFile != null
                  ? Image.file(
                      _productImgFile,
                      fit: BoxFit.contain,
                      width: space_200,
                      height: space_150,
                    )
                  : Container(
                child: Center(
                  child: Icon(Icons.photo, size: space_100, color: CommonStyles.grey.withOpacity(0.1),),
                ),
              ),
            ),
            SizedBox(height: space_20,),
            Container(
              width: space_150,
              child: Card(
                color: Colors.white,
                elevation: space_3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(space_10)
                ),
                child: Container(
                  width: space_150,
                  child: Center(child: FlatButton.icon(onPressed: (){}, icon: Icon(Icons.photo, color: CommonStyles.blue,), label: Text("Upload Image", style: CommonStyles.getMontserratStyle(space_14, FontWeight.w400, CommonStyles.blue),))),
                ),
              ),
            ),
            SizedBox(height: space_30,),
            Text("Product Name", style: CommonStyles.getMontserratStyle(space_14, FontWeight.w400, Colors.black),),
            SizedBox(height: space_10,),
            TextInputWidget(prodNameController, false, TextInputType.name),
            SizedBox(height: space_15,),
           Text("Product Description", style: CommonStyles.getMontserratStyle(space_14, FontWeight.w400, Colors.black),),
            SizedBox(height: space_10,),
            TextInputWidget(prodDescController, false, TextInputType.name),
            SizedBox(height: space_15,),
           Text("Shelf life in number of days", style: CommonStyles.getMontserratStyle(space_14, FontWeight.w400, Colors.black),),
            SizedBox(height: space_10,),
            TextInputWidget(noOfDaysController, false, TextInputType.number),
            SizedBox(height: space_15,),
           Text("Available Quantity", style: CommonStyles.getMontserratStyle(space_14, FontWeight.w400, Colors.black),),
            SizedBox(height: space_10,),
            TextInputWidget(availableQuntController, false, TextInputType.number),
            SizedBox(height: space_15,),
           Text("Selling Price", style: CommonStyles.getMontserratStyle(space_14, FontWeight.w400, Colors.black),),
            SizedBox(height: space_10,),
            TextInputWidget(sellingPriceController, false, TextInputType.number),
            SizedBox(height: space_15,),
           Text("MRP", style: CommonStyles.getMontserratStyle(space_14, FontWeight.w400, Colors.black),),
            SizedBox(height: space_10,),
            TextInputWidget(mrpController, false, TextInputType.number),
            SizedBox(height: space_15,),
            Text("Purchase Price", style: CommonStyles.getMontserratStyle(space_14, FontWeight.w400, Colors.black),),
            SizedBox(height: space_10,),
            TextInputWidget(purchasePriceController, false, TextInputType.number),
            SizedBox(height: space_15,),
            Text("HSN Number", style: CommonStyles.getMontserratStyle(space_14, FontWeight.w400, Colors.black),),
            SizedBox(height: space_10,),
            TextInputWidget(hsnNoController, false, TextInputType.number),
            SizedBox(height: space_15,),
            Text("Minimum Order Quantity", style: CommonStyles.getMontserratStyle(space_14, FontWeight.w400, Colors.black),),
            SizedBox(height: space_10,),
            TextInputWidget(minOrderQuantController, false, TextInputType.number),
            SizedBox(height: space_15,),
              Text("Discount in percentage", style: CommonStyles.getMontserratStyle(space_14, FontWeight.w400, Colors.black),),
            SizedBox(height: space_10,),
            TextInputWidget(discountPercentController, false, TextInputType.number),
            SizedBox(height: space_15,),
              Text("Custom Tax Name", style: CommonStyles.getMontserratStyle(space_14, FontWeight.w400, Colors.black),),
            SizedBox(height: space_10,),
            TextInputWidget(custTaxNameController, false, TextInputType.number),
            SizedBox(height: space_15,),
              Text("Custom Tax Rate", style: CommonStyles.getMontserratStyle(space_14, FontWeight.w400, Colors.black),),
            SizedBox(height: space_10,),
            TextInputWidget(custTaxRateController, false, TextInputType.number),
            SizedBox(height: space_15,),
               Text("Subunits Per Unit", style: CommonStyles.getMontserratStyle(space_14, FontWeight.w400, Colors.black),),
            SizedBox(height: space_10,),
            TextInputWidget(subunitPerUnitController, false, TextInputType.number),
            SizedBox(height: space_15,),

            GestureDetector(
              onTap: () {

              },
              child: Container(
                margin: EdgeInsets.only(top: space_15),
                height: space_50,
                decoration: BoxDecoration(
                    color: CommonStyles.blue,
                    borderRadius: BorderRadius.circular(space_5)),
                child: Center(
                  child: Padding(
                      padding: EdgeInsets.all(space_15),
                      child: Text(
                        "Add",
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
