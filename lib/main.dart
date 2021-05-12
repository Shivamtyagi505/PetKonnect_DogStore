import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_petkon/Kconstants.dart';
import 'package:flutter_petkon/bloc/CommonBloc.dart';
import 'package:flutter_petkon/bloc/CommonEvent.dart';
import 'package:flutter_petkon/bloc/CommonState.dart';
import 'package:flutter_petkon/screens/AddInventory.dart';
import 'package:flutter_petkon/screens/FilterScreen.dart';
import 'package:flutter_petkon/screens/LandingScreen.dart';
import 'package:flutter_petkon/screens/LoginSignupScreen.dart';
import 'package:flutter_petkon/screens/MyCart.dart';
import 'package:flutter_petkon/screens/ProductDetailScreen.dart';
import 'package:flutter_petkon/screens/SosScreen.dart';
import 'package:flutter_petkon/screens/StoreDetailScreen.dart';
import 'package:flutter_petkon/screens/StoreListingScreen.dart';
<<<<<<< Updated upstream
<<<<<<< Updated upstream
import 'package:flutter_petkon/screens/UserProfileScreen/EditUserProfile.dart';
import 'package:flutter_petkon/screens/UserProfileScreen/user_profile.dart';
=======
=======
>>>>>>> Stashed changes
import 'package:flutter_petkon/screens/UserProfileScreen.dart';
import 'package:flutter_petkon/screens/forgot_password/ForgotPassword.dart';
import 'package:flutter_petkon/screens/pet_profile/edit_pet.dart';
<<<<<<< Updated upstream
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
import 'package:flutter_petkon/screens/pet_profile/pet_profile.dart';
import 'package:flutter_petkon/utils/CommonStyles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'inherited/StateContainer.dart';
import 'model/login_response.dart';

void main() {
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

  @override
  void initState() {
    // TODO: implement initState
    checkUserLoggedInOrNot();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Container(
            height: 100,
            width: 200,
            child: new Image.asset('assets/icons/logo.png')),
      ),
    );
  }

  checkUserLoggedInOrNot() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    debugPrint("VALlllllllll ${token}");

    if (token != null && token.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LandingScreen(token)),
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
          //primarySwatch: CommonStyles.amber,
          primaryColor: kPrimarycolor),
      home: LoginSignupScreen(),
<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
      routes: {'/petProfile': (context) => PetProfile()},
=======
=======
>>>>>>> Stashed changes
      routes: {
        '/petProfile': (context) => PetProfile(),
        '/editPet': (context) => EditPetProfile()
      },
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
=======
      routes: {
        '/petProfile': (context) => PetProfile(),
        '/editPet': (context) => EditPetProfile(),
      },
>>>>>>> Stashed changes
    );
  }
}
