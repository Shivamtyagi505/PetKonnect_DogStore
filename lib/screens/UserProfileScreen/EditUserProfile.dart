import 'dart:convert';
import 'dart:io';

import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_petkon/Kconstants.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter_petkon/utils/CommonStyles.dart';
import 'package:flutter_petkon/utils/size_config.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditUserProfile extends StatefulWidget {
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<EditUserProfile>
    with SingleTickerProviderStateMixin {
  bool _status = true;

  final FocusNode myFocusNode = FocusNode();

  File _image;

  var name = "", email = "",phoneNumber="";
  getUserProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = jsonDecode(prefs.getString('USER_LOGIN_RES'))['token'];
    final response = await http.get("https://petkonnect.in/api/user", headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print('token is $token');
    var user = jsonDecode(response.body);
    setState(() {
      name = user['name'];
      email = user['email'];
      phoneNumber= user['phoneNumber'].toString();
    });
    print(user['address']['zip']);
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  editProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = jsonDecode(prefs.getString('USER_LOGIN_RES'))['token'];
    final response = await http.post(
      "https://petkonnect.in/api/user",
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'name': nameController.text,
        'email': emailController.text,
        'phoneNumber': phoneNumberController.text,
      }),
    );
    var user = jsonDecode(response.body);
    print(user);
    print(nameController.text);
  }

  @override
  void initState() {
    // TODO: implement initState
    getUserProfileData();
    super.initState();
  }

  Future getImage() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
      print('Select image path' + _image.path.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
      color: Colors.white,
      child: new ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              new Container(
                height: space_280,
                color: Colors.white,
                child: new Column(
                  children: <Widget>[
                    SizedBox(
                      height: space_30,
                    ),
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
                              Text("Edit profile",
                                  style: CommonStyles.getMontserratStyle(
                                      space_24,
                                      FontWeight.bold,
                                      CommonStyles.black)),
                            ],
                          ),
                        ),
                        Expanded(flex: 1, child: Container()),
                      ],
                    ),
                    SizedBox(
                      height: space_30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: new Stack(fit: StackFit.loose, children: <Widget>[
                        new Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Center(
                              child: _image == null
                                  ? new Container(
                                      height: 140,
                                      width: 140,
                                      child: new Image.asset(
                                          'assets/icons/profile.png'))
                                  : new CircleAvatar(
                                      backgroundImage: new FileImage(_image),
                                      radius: 65.0,
                                    ),
                            ),
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 90.0, right: 100.0),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    getImage();
                                  },
                                  child: new CircleAvatar(
                                    backgroundColor: kPrimarycolor,
                                    radius: 25.0,
                                    child: new Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ]),
                    )
                  ],
                ),
              ),
              new Container(
                color: Color(0xffFFFFFF),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 25.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Name',
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
                              left: 25.0, right: 25.0, top: 2.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Flexible(
                                child: TextFormField(
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    hintText: name,
                                  ),
                                  enabled: _status,
                                  autofocus: !_status,
                                ),
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Phone Number',
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
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextField(
                                  controller: phoneNumberController,
                                  keyboardType: TextInputType.phone,
                                  decoration:  InputDecoration(
                                      hintText: phoneNumber),
                                  enabled: _status,
                                ),
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Date of birth',
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
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                  child: DateTimeFormField(
                                decoration: InputDecoration(
                                  fillColor: kPrimarycolor,
                                ),
                                mode: DateTimeFieldPickerMode.date,
                              )),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Email',
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
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: TextField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    hintText: email,
                                  ),
                                  enabled: _status,
                                ),
                              ),
                            ],
                          )),
                      GestureDetector(
                        onTap: () {
                          editProfile();
                        },
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: space_30),
                            child: Container(
                              height: space_50,
                              width: space_300,
                              decoration: BoxDecoration(
                                  color: kPrimarycolor,
                                  borderRadius: BorderRadius.circular(space_5)),
                              child: Center(
                                child: Padding(
                                    padding: EdgeInsets.all(space_15),
                                    child: Text(
                                      "Save",
                                      style: CommonStyles.getRalewayStyle(
                                          space_14,
                                          FontWeight.w600,
                                          Colors.white),
                                    )),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed

    myFocusNode.dispose();

    super.dispose();
  }
}
