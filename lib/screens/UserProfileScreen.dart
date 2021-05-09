import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_petkon/utils/CommonStyles.dart';
import 'package:flutter_petkon/utils/size_config.dart';
import 'package:image_picker/image_picker.dart';



class UserProfileScreen extends StatefulWidget {

  @override

  MapScreenState createState() => MapScreenState();

}



class MapScreenState extends State<UserProfileScreen>

    with SingleTickerProviderStateMixin {

  bool _status = true;

  final FocusNode myFocusNode = FocusNode();

  File _image;

  @override

  void initState() {

    // TODO: implement initState

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

                    height:space_280,

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

                        Padding(

                          padding: EdgeInsets.only(top: 20.0),

                          child: new Stack(fit: StackFit.loose, children: <Widget>[

                            new Row(

                              crossAxisAlignment: CrossAxisAlignment.center,

                              mainAxisAlignment: MainAxisAlignment.center,

                              children: <Widget>[

                                new Center(
                                  child: _image == null
                                      ? new Container(height:140,width:140,child: new Image.asset('assets/icons/profile.png'))
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

                                        backgroundColor: CommonStyles.amber,

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

                                        'Username',

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

                                      decoration: const InputDecoration(

                                        hintText: "Enter Your Name",

                                      ),

                                      enabled: _status,

                                      autofocus: _status,



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

                              child: new Row(

                                mainAxisSize: MainAxisSize.max,

                                children: <Widget>[

                                  new Flexible(

                                    child: new TextField(

                                      decoration: const InputDecoration(

                                        hintText: "Enter Your Name",

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

                                        'Website',

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

                                      decoration: const InputDecoration(

                                          hintText: "Enter Your website"),

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

                                    child: new TextField(

                                      decoration: const InputDecoration(

                                          hintText: "Enter Your Email"),

                                      enabled: _status,

                                    ),

                                  ),

                                ],

                              )),

                          GestureDetector(
                            onTap: () {

                            },
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top:space_100),
                                child: Container(
                                  height: space_50,
                                  width: space_300,
                                  decoration: BoxDecoration(
                                      color: CommonStyles.amber,
                                      borderRadius:
                                      BorderRadius.circular(space_5)),
                                  child: Center(
                                    child: Padding(
                                        padding: EdgeInsets.all(space_15),
                                        child: Text("Save",
                                          style: CommonStyles
                                              .getRalewayStyle(
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