import 'package:flutter/material.dart';
import 'package:flutter_petkon/utils/size_config.dart';

import '../../Kconstants.dart';

class EditPetProfile extends StatefulWidget {
  @override
  _EditPetProfileState createState() => _EditPetProfileState();
}

class _EditPetProfileState extends State<EditPetProfile> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String gender = "";
    String name;
    String age;
    String color;
    String height;
    String petType;
    String breed;

    bool editPet = ModalRoute.of(context).settings.arguments;
    Size size = MediaQuery.of(context).size;

    void submitForm() {
      var form = _formKey.currentState;

      form.validate();

      if (form.validate()) {
        form.save();
        //Api Logic goes here
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            //header
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
                        child: Text(
                          "Edit Profile",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: "Monserrat",
                              fontSize: 22),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.06,
            ),
            //Pet image
            Center(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      "https://www.thesprucepets.com/thmb/wpN_ZunUaRQAc_WRdAQRxeTbyoc=/4231x2820/filters:fill(auto,1)/adorable-white-pomeranian-puppy-spitz-921029690-5c8be25d46e0fb000172effe.jpg",
                      height: 180,
                      width: 200,
                      fit: BoxFit.fill,
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Change Photo",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            color: kPrimarycolor,
                            fontWeight: FontWeight.w600),
                      ))
                ],
              ),
            ),
            //User form
            Container(
              width: size.width * 0.9,
<<<<<<< Updated upstream
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "This field cannot be empty!";
                        }
                      },
                      onSaved: (newValue) {
                        setState(() {
                          name = newValue;
                        });
                      },
                      decoration: InputDecoration(
                          labelText: "Pet Name",
                          hintText: editPet ? "Jackie" : null,
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 18)),
                    ),
=======
              child: Padding(
                padding: EdgeInsets.only(bottom: 25.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 12.0),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Text(
                                  'Petname',
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
                          right: 10.0,
                        ),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Flexible(
                              child: TextField(
//                                controller: doorNoController,
                                decoration: InputDecoration(
                                    //  hintText: doorNo,
                                    ),
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 12.0),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Text(
                                  'Type',
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
                          right: 10.0,
                        ),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Flexible(
                              child: TextField(
//                                controller: doorNoController,
                                decoration: InputDecoration(
                                    //  hintText: doorNo,
                                    ),
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 12.0),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Text(
                                  'Breed',
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
                          right: 10.0,
                        ),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Flexible(
                              child: TextField(
//                                controller: doorNoController,
                                decoration: InputDecoration(
                                    //  hintText: doorNo,
                                    ),
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 12.0),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Text(
                                  'Age',
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
                          right: 10.0,
                        ),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Flexible(
                              child: TextField(
//                                controller: doorNoController,
                                decoration: InputDecoration(
                                    //  hintText: doorNo,
                                    ),
                              ),
                            ),
                          ],
                        )),
>>>>>>> Stashed changes
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Gender",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    //gender selector
                    DropdownButtonFormField(
                      items: ["Male", "Female"]
                          .map((label) => DropdownMenuItem(
                                child: Text(label.toString()),
                                value: label,
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          gender = value;
                        });
                      },
                      hint: Text("Select Gender"),
                    ),
<<<<<<< Updated upstream
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "This field cannot be empty!";
                        }
                      },
                      onSaved: (newValue) {
                        setState(() {
                          petType = newValue;
                        });
                      },
                      decoration: InputDecoration(
                          labelText: "Pet Type",
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 18)),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "This field cannot be empty!";
                        }
                      },
                      onSaved: (newValue) {
                        setState(() {
                          breed = newValue;
                        });
                      },
                      decoration: InputDecoration(
                          labelText: "Breed",
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 18)),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "This field cannot be empty!";
                        }
                      },
                      onSaved: (newValue) {
                        setState(() {
                          age = newValue;
                        });
                      },
                      decoration: InputDecoration(
                          labelText: "Age",
                          suffix: Text("months"),
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 18)),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "This field cannot be empty!";
                        }
                      },
                      onSaved: (newValue) {
                        setState(() {
                          height = newValue;
                        });
                      },
                      decoration: InputDecoration(
                          labelText: "Height",
                          suffix: Text("Centimeters"),
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 18)),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "This field cannot be empty!";
                        }
                      },
                      onSaved: (newValue) {
                        setState(() {
                          color = newValue;
                        });
                      },
                      decoration: InputDecoration(
                          labelText: "Pet Color",
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 18)),
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    //save button
                    GestureDetector(
                      onTap: submitForm,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Container(
                            height: space_50,
                            width: space_300,
                            decoration: BoxDecoration(
                                color: kPrimarycolor,
                                borderRadius: BorderRadius.circular(space_5)),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(space_15),
                                child: Text("Save",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Raleway",
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    )),
=======
                    Padding(
                        padding: EdgeInsets.only(top: 12.0),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Text(
                                  'Weight',
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
                          right: 10.0,
                        ),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Flexible(
                              child: TextField(
//                                controller: doorNoController,
                                decoration: InputDecoration(
                                    //  hintText: doorNo,
                                    ),
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 12.0),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Text(
                                  'Height',
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
                          right: 10.0,
                        ),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Flexible(
                              child: TextField(
//                                controller: doorNoController,
                                decoration: InputDecoration(
                                    //  hintText: doorNo,
                                    ),
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 12.0),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Text(
                                  'Colour',
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
                          right: 10.0,
                        ),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Flexible(
                              child: TextField(
//                                controller: doorNoController,
                                decoration: InputDecoration(
                                    //  hintText: doorNo,
                                    ),
>>>>>>> Stashed changes
                              ),
                            ),
                          ],
                        )),
                    GestureDetector(
                      onTap: () {
                        // editAddress();
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: space_40),
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
<<<<<<< Updated upstream
                    ),
=======
                    )
>>>>>>> Stashed changes
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
