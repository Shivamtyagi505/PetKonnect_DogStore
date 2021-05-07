import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_petkon/inherited/StateContainer.dart';
import 'package:flutter_petkon/model/login_response.dart';
import 'package:flutter_petkon/model/order_history.dart';
import 'package:flutter_petkon/screens/Edit_address/editAddress.dart';
import 'package:flutter_petkon/screens/FeedScreen.dart';
import 'package:flutter_petkon/screens/home_screen/HomeScreen.dart';
import 'package:flutter_petkon/screens/MyCart.dart';
import 'package:flutter_petkon/screens/ServicesScreen.dart';
import 'package:flutter_petkon/screens/SosScreen.dart';
import 'package:flutter_petkon/screens/StoreListingScreen.dart';
import 'package:flutter_petkon/utils/CommonStyles.dart';
import 'package:http/io_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../Kconstants.dart';
import 'OrdersScreen.dart';
import 'UserProfileScreen/EditUserProfile.dart';
import 'UserProfileScreen/user_profile.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  bool isRefreshing;
  int _selectedIndex = 1;
  var token = "";
  LoginResponse loginResponse;
  Future<OrderHistoryResponse> futureAlbum;
  PageController _pageController;

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
    print(user['address']['zip']);
    //WidgetsBinding.instance.addPostFrameCallback(_showOpenDialog);
  }

  //Update Address//
  editAddress() async {
    var response = await http.post("https://petkonnect.in/api/user",
        body: {'name': 'doodle', 'color': 'blue'});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

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
    getAddressData();
    // TODO: implement initState
    // WidgetsBinding.instance.addPostFrameCallback(_showOpenDialog);

    _pageController = PageController(initialPage: _selectedIndex);
    super.initState();
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
            IconButton(
                icon: Icon(
                  Icons.location_on,
                  color: kPrimarycolor,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditAddress(),
                      ));
                }),
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
              title: new Text("SOS",
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
          SosScreen()
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
