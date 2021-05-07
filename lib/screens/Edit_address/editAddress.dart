import 'package:flutter/material.dart';
import 'package:flutter_petkon/Kconstants.dart';

class EditAddress extends StatefulWidget {
  @override
  _EditAddressState createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
  var _formKey = GlobalKey<FormState>();
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
                      height: 15,
                    ),
                    //Submit Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: submitForm,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
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
