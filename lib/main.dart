import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_petkon/bloc/CommonBloc.dart';
import 'package:flutter_petkon/bloc/CommonEvent.dart';
import 'package:flutter_petkon/bloc/CommonState.dart';
import 'package:flutter_petkon/Kconstants.dart';
import 'package:flutter_petkon/screens/AddInventory.dart';
import 'package:flutter_petkon/screens/FilterScreen.dart';
import 'package:flutter_petkon/screens/LoginSignupScreen.dart';
import 'package:flutter_petkon/screens/MyCart.dart';
import 'package:flutter_petkon/screens/ProductDetailScreen.dart';
import 'package:flutter_petkon/screens/StoreDetailScreen.dart';
import 'package:flutter_petkon/screens/StoreListingScreen.dart';
import 'package:flutter_petkon/screens/UserProfileScreen.dart';
import 'package:flutter_petkon/screens/UserProfileScreen/user_profile.dart';
import 'package:flutter_petkon/screens/pet_profile/pet_profile.dart';
import 'package:flutter_petkon/utils/CommonStyles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'inherited/StateContainer.dart';
import 'model/login_response.dart';

void main() {
  SharedPreferences.setMockInitialValues({});
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(StateContainer(child: MyApp()));
  });
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  CommonBloc commonBloc = new CommonBloc();

  getsharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CommonBloc>(
      create: (_) => commonBloc..add(CheckLoggedInEvent()),
      child: BlocListener(
        cubit: commonBloc,
        listener: (context, state) {
          if (state.obj != null && state.obj is LoginResponse) {
            StateContainer.of(context).updateUserInfo(state.obj);
          }
        },
        child: BlocBuilder<CommonBloc, CommonState>(builder: (context, state) {
          if (state is CheckLoggedInState) {
            if (state.obj != null && state.obj is LoginResponse) {
              return StoreListingScreen();
            } else {
              return LoginSignupScreen();
            }
          } else {
            return Splash();
//                return SafeArea(
//                  child: Scaffold(
//                      body: Container(
//                        color: Colors.white,
//                        child: Center(
//                          child: Icon(Icons.email),
//                        ),
//                      ) //isLogin ? HomeScreen() : SplashScreen(),
//                  ),
//                );
          }
        }),
      ),
    );
  }

  checkUserLoggedInOrNot(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var mobile = prefs.getString(USER_NAME);
    debugPrint("VALlllllllll ${mobile}");
    if (mobile != null && mobile.isNotEmpty) {
      var response =
          LoginResponse.fromJson(jsonDecode(prefs.getString(USER_LOGIN_RES)));
      StateContainer.of(context).updateUserInfo(response);
//      setState(() {
//        isLogin = true;
//      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StoreListingScreen()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginSignupScreen()),
      );
    }
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PetKon',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: CommonStyles.amber,
      ),
      home: LoginSignupScreen(),
      routes: {'/petProfile': (context) => PetProfile()},
    );
  }
}
