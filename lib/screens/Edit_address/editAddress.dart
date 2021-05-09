import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_petkon/Kconstants.dart';
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
                    TextFormField(
                      //decoration
                      controller: doorNoController,
                      decoration: InputDecoration(
                          labelText: "Door No.",
                          hintText: doorNo,
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 18)),
                      //validator
                      validator: (value) {
                        if (value.isEmpty)
                          return "Door Number cannot be Empty !";
                      },
                      //onsaved
                      onSaved: (newValue) => doorNo = newValue,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: buildingController,
                      decoration: InputDecoration(
                          labelText: "Building",
                          hintText: building,
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 18)),
                      //validator
                      validator: (value) {
                        if (value.isEmpty) return "this field caanot be empty ";
                      },
                      //Onsaved
                      onSaved: (newValue) => building = newValue,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: streetController,
                        decoration: InputDecoration(
                            labelText: "Street/Area.",
                            hintText: street,
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18)),
                        //validator
                        validator: (value) {
                          if (value.isEmpty)
                            return "this field caanot be empty ";
                        },
                        //Onsaved
                        onSaved: (newValue) => street = newValue),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: cityController,
                      decoration: InputDecoration(
                          labelText: "City",
                          hintText: city,
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 18)),
                      //validator
                      validator: (value) {
                        if (value.isEmpty) return "this field caanot be empty ";
                      },
                      //Onsaved
                      onSaved: (newValue) => city = newValue,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: stateController,
                        decoration: InputDecoration(
                            labelText: "State",
                            hintText: state,
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18)),
                        //validator
                        validator: (value) {
                          if (value.isEmpty)
                            return "this field can'not be empty ";
                        },
                        //Onsaved
                        onSaved: (newValue) => state = newValue),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: zipController,
                      decoration: InputDecoration(
                          labelText: "Zip Code",
                          hintText: zip,
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 18)),
                      //validator
                      validator: (value) {
                        if (value.isEmpty || value.length != 6) {
                          return "Please enter a valid ZipCode";
                        }
                      },
                      //Onsaved
                      //onSaved: (newValue) => zipCode = newValue,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    //Submit Button
                    GestureDetector(
                      onTap: () {
                        editAddress(); 
                      },
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
