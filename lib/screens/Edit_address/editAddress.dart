import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_petkon/Kconstants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class EditAddress extends StatefulWidget {
  @override
  _EditAddressState createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
  var _formKey = GlobalKey<FormState>();

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
    print(user['address']['zip']);
    //WidgetsBinding.instance.addPostFrameCallback(_showOpenDialog);
  }
  @override
  Widget build(BuildContext context) {
    //Properties

    String doorNo;
    String building;
    String street;
    String city;
    String state;
    String zipCode;
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
                      decoration: InputDecoration(
                          labelText: "Door No.",
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
                      //decoration
                      decoration: InputDecoration(
                          labelText: "Building",
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
                        //decoration
                        decoration: InputDecoration(
                            labelText: "Street/Area.",
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
                      //decoration
                      decoration: InputDecoration(
                          labelText: "City",
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
                        //decoration
                        decoration: InputDecoration(
                            labelText: "State",
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
                        onSaved: (newValue) => state = newValue),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      //decoration
                      decoration: InputDecoration(
                          labelText: "Zip Code",
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
                      onSaved: (newValue) => zipCode = newValue,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    //Submit Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: submitForm,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: kPrimarycolor),
                            child: Text(
                              "Save",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          ),
                        )
                      ],
                    )
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
