import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_petkon/Kconstants.dart';
import 'package:flutter_petkon/utils/CommonStyles.dart';
import 'package:flutter_petkon/utils/Constants.dart';
import 'package:flutter_petkon/utils/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class EditAddress extends StatefulWidget {
  @override
  _EditAddressState createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
  var _formKey = GlobalKey<FormState>();
 final mycontroller = TextEditingController();
  bool _status = true;
  // retrieving data for Edit Address//
  var doorNo = "", street = "", building = "", city = "", state = "", zip = "";
  getAddressData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = jsonDecode(prefs.getString('USER_LOGIN_RES'))['token'];
    final response = await http.get("https://petkonnect.in/api/user", headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    // print('token is $token');
    var user = jsonDecode(response.body);
    setState(() {
      doorNo = user['address']['doorNo'];
      street = user['address']['street'];
      building = user['address']['building'];
      city = user['address']['city'];
      state = user['address']['state'];
      zip = user['address']['zip'].toString();
    });
   print('token is  $token');
    //WidgetsBinding.instance.addPostFrameCallback(_showOpenDialog);
  }
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  //Update Address//
  TextEditingController doorNoController =TextEditingController();
  TextEditingController buildingController =TextEditingController();
  TextEditingController streetController =TextEditingController();
  TextEditingController cityController =TextEditingController();
  TextEditingController stateController =TextEditingController();
  TextEditingController zipController =TextEditingController();
  editAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = jsonDecode(prefs.getString('USER_LOGIN_RES'))['token'];
    final response = await http.post("https://petkonnect.in/api/user/edit_address", headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },

    body: jsonEncode(<String, String>{
      'doorNo': doorNoController.text,
      'street': buildingController.text,
      'building': streetController.text,
      'city': cityController.text,
      'state': stateController.text,
      'zip': zipController.text
      }),
    );
    //print("door no is ${doorNoController.text}");
    // print('token is $token');
     var user = jsonDecode(response.body);
    print(user);
    //WidgetsBinding.instance.addPostFrameCallback(_showOpenDialog);
  }

  @override
  void initState() {
    getAddressData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //methods
    void submitForm() {
      var form = _formKey.currentState;
      form.validate();
      if (form.validate()) {
        form.save();
        //api logic goes here
        print("it worked !");
      }
    }

    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            //heading
            Row(
              children: <Widget>[
                Expanded(
                    flex: 2,
                    child: GestureDetector(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
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
                      Center(
                        child: Column(
                          children: [
                            Text(
                              "Edit Address",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Monserrat",
                                  fontSize: 22),
                            ),
                            Text("Your product/service will be delivered here",
                                style:
                                    TextStyle(color: kTextColor, fontSize: 12))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.08,
            ),
            //Input Form starts
            Form(
              key: _formKey,
              child: Container(
                width: size.width * 0.88,
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            left: space_8, right: space_8),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Text(
                                  'Door No',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.only(
                            left: space_8, right: space_8),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Flexible(
                              child: new TextField(
                                controller: doorNoController,
                                decoration: const InputDecoration(

                                  hintText: "Enter Door No",
                                ),
                                enabled: _status,
                                autofocus: _status,
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            left: space_8, right: space_8,top: space_5),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Text(
                                  'Building',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.only(
                            left: space_8, right: space_8),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Flexible(
                              child: new TextField(
                                controller: buildingController,
                                decoration: const InputDecoration(
                                  hintText: "Enter Building",
                                ),
                                enabled: _status,
                                autofocus: _status,
                              ),
                            ),
                          ],
                        )),

                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            left: space_8, right: space_8,top: space_5),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Text(
                                  'Street/Area.',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.only(
                            left: space_8, right: space_8),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Flexible(
                              child: new TextField(
                                controller: streetController,
                                decoration: const InputDecoration(
                                  hintText: "Enter Street/Area.",
                                ),
                                enabled: _status,
                                autofocus: _status,
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            left: space_8, right: space_8,top: space_5),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Text(
                                  'City',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.only(
                            left: space_8, right: space_8),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Flexible(
                              child: new TextField(
                                controller: cityController,
                                decoration: const InputDecoration(
                                  hintText: "Enter City",
                                ),
                                enabled: _status,
                                autofocus: _status,
                              ),
                            ),
                          ],
                        )),

                    SizedBox(
                      height: 15,
                    ),

                    Padding(
                        padding: EdgeInsets.only(
                            left: space_8, right: space_8,top: space_5),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Text(
                                  'State',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.only(
                            left: space_8, right: space_8),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Flexible(
                              child: new TextField(
                                controller: stateController,
                                decoration: const InputDecoration(
                                  hintText: "Enter State",
                                ),
                                enabled: _status,
                                autofocus: _status,
                              ),
                            ),
                          ],
                        )),

                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            left: space_8, right: space_8,top: space_5),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Text(
                                  'Zip Code',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.only(
                            left: space_8, right: space_8),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Flexible(
                              child: new TextField(
                                controller: zipController,
                                decoration: const InputDecoration(
                                  hintText: "Enter Zip Code",
                                ),
                                enabled: _status,
                                autofocus: _status,
                              ),
                            ),
                          ],
                        )),

                    SizedBox(
                      height: 15,
                    ),
                    //Submit Button
                    GestureDetector(
                      onTap: () {
                        if (doorNoController .text.trim().isEmpty) {
                          showSnakbar(_scaffoldKey, "Door no can't be empty!!");
                        } else if (buildingController .text.trim().isEmpty) {
                          showSnakbar(_scaffoldKey, "Building can't be empty!!");
                        } else if (streetController .text.trim().isEmpty) {
                          showSnakbar(_scaffoldKey, "Street can't be empty!!");
                        } else if (cityController .text.trim().isEmpty) {
                          showSnakbar(_scaffoldKey, "City can't be empty!!");
                        } else if (stateController .text.trim().isEmpty) {
                          showSnakbar(_scaffoldKey, "State can't be empty!!");
                        }else if (zipController  .text.trim().isEmpty) {
                          showSnakbar(_scaffoldKey, "Zip code can't be empty!!");
                        }
                        else{
                          editAddress();
                        }

                      },
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(top:space_15),
                          child: Container(
                            height: space_50,
                            width: space_300,
                            decoration: BoxDecoration(
                                color: kPrimarycolor,
                                borderRadius: BorderRadius.circular(space_5)),
                            child: Center(
                                child: Padding(
                              padding: EdgeInsets.all(1),
                              child: Text("Save",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Raleway",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  )
                                  ),
                            ),),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
