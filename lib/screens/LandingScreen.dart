import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_petkon/inherited/StateContainer.dart';
import 'package:flutter_petkon/model/login_response.dart';
import 'package:flutter_petkon/model/order_history.dart';
import 'package:flutter_petkon/screens/FeedScreen.dart';
import 'package:flutter_petkon/screens/home_screen/HomeScreen.dart';
import 'package:flutter_petkon/screens/MyCart.dart';
import 'package:flutter_petkon/screens/ServicesScreen.dart';
import 'package:flutter_petkon/screens/SosScreen.dart';
import 'package:flutter_petkon/screens/StoreListingScreen.dart';
import 'package:flutter_petkon/utils/CommonStyles.dart';
import 'package:http/io_client.dart';

import 'OrdersScreen.dart';
import 'UserProfileScreen.dart';
import 'UserProfileScreen/user_profile.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int _selectedIndex = 1;
  var token = "";
  LoginResponse loginResponse;
  Future<OrderHistoryResponse> futureAlbum;
  PageController _pageController;
  @override
  void didChangeDependencies() {
    var selectedCurrentLoc = StateContainer.of(context).mLoginResponse;
    loginResponse = StateContainer.of(context).mLoginResponse;
    if (loginResponse != null) {
      token = loginResponse.token;
      debugPrint("ACCESSING_INHERITED ${token}");
    }
    super.didChangeDependencies();
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback(_showOpenDialog);
    _pageController = PageController(initialPage: _selectedIndex);
    super.initState();
  }

  _showOpenDialog(_) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Edit Address',
            ),
            actions: <Widget>[
              FlatButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              FlatButton(
                  child: Text('Save'),
                  onPressed: () {
                    // _inputTextController.clear();
                    Navigator.of(context).pop();
                  })
            ],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            content: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: MediaQuery.of(context).size.height / 0.9,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Door No.',
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: '007',
                              hintStyle: TextStyle(color: Colors.grey[300]),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Street', style: TextStyle(color: Colors.grey)),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: '2nd Cross',
                              hintStyle: TextStyle(color: Colors.grey[300]),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Building',
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Building A',
                              hintStyle: TextStyle(color: Colors.grey[300]),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'City',
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Bangalore',
                              hintStyle: TextStyle(color: Colors.grey[300]),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'State',
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Karnataka',
                              hintStyle: TextStyle(color: Colors.grey[300]),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ZipCode',
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: '560092',
                              hintStyle: TextStyle(color: Colors.grey[300]),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: ElevatedButton(
                    //     child: Text(
                    //       "Save",
                    //       style: TextStyle(
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //     style: ElevatedButton.styleFrom(
                    //         padding: EdgeInsets.only(left: 80, right: 80)),
                    //     onPressed: () {
                    //       // if (_formKey.currentState.validate()) {
                    //       //   _formKey.currentState.save();
                    //       // }
                    //     },
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                right: 30.0,
              ),
              child: Container(
                  height: 50,
                  width: 100,
                  child: new Image.asset('assets/icons/logo.png')),
            ),
            InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserProfile()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 20.0,
                  ),
                  child: Container(
                      height: 30,
                      width: 30,
                      child: new Image.asset('assets/icons/profile.png')),
                )),
            InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyCartScreen(token)),
                  );
                },
                child: Container(
                    height: 30,
                    width: 30,
                    child: new Image.asset('assets/icons/shopping_cart.png')))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Container(
                height: 30,
                width: 30,
                child: new Image.asset('assets/icons/feed_inactive.png'),
              ),
              activeIcon: Container(
                height: 30,
                width: 30,
                child: new Image.asset('assets/icons/feed_active.png'),
              ),
              title: new Text("Feed",
                  style: new TextStyle(
                      color: const Color(0xFF06244e), fontSize: 8.0))),
          new BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Container(
                height: 30,
                width: 30,
                child: new Image.asset('assets/icons/store_inactive.png'),
              ),
              activeIcon: Container(
                height: 30,
                width: 30,
                child: new Image.asset('assets/icons/store_active.png'),
              ),
              title: new Text("Store",
                  style: new TextStyle(
                      color: const Color(0xFF06244e), fontSize: 8.0))),
          new BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Container(
                height: 30,
                width: 30,
                child: new Image.asset('assets/icons/home_inactive.png'),
              ),
              activeIcon: Container(
                height: 30,
                width: 30,
                child: new Image.asset('assets/icons/home_active.png'),
              ),
              title: new Text("Home",
                  style: new TextStyle(
                      color: const Color(0xFF06244e), fontSize: 8.0))),
          new BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Container(
                height: 30,
                width: 30,
                child: new Image.asset('assets/icons/services_inactive.png'),
              ),
              activeIcon: Container(
                height: 30,
                width: 30,
                child: new Image.asset('assets/icons/services_active.png'),
              ),
              title: new Text("Services",
                  style: new TextStyle(
                      color: const Color(0xFF06244e), fontSize: 8.0))),
          new BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Container(
                height: 30,
                width: 30,
                child: new Image.asset('assets/icons/sos_inactive.png'),
              ),
              activeIcon: Container(
                height: 30,
                width: 30,
                child: new Image.asset('assets/icons/sos_active.png'),
              ),
              title: new Text("Order History",
                  style: new TextStyle(
                      color: const Color(0xFF06244e), fontSize: 8.0))),
        ],
        onTap: _onTappedBar,
        selectedItemColor: Colors.orange,
        currentIndex: _selectedIndex,
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          FeedScreen(),
          StoreListingScreen(),
          HomeScreen(),
          ServicesScreen(),
          OrderScreen(token)
        ],
      ),
    );
  }

  void _onTappedBar(int value) {
    setState(() {
      _selectedIndex = value;
    });
    _pageController.jumpToPage(value);
  }
}
