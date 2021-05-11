import 'package:flutter/material.dart';

class CommonStyles {
  //Fonts
  static const String FONT_RALEWAY = "Raleway";
  static const String FONT_MONTSERRAT = "Montserrat";

  //Colors
  static const Color primaryColor = Color(0xFF003863);
  static const Color orangeColor = Color(0xFFFF801E);
  static const Color lightorangeColor = Color(0xFFFFBC4E);

  static const Color transparentColor = Colors.transparent;
  static const Color greyColor = Color(0xFF777777);
  static const Color blue = Color(0xFF0089fa);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color green = Color(0xFF72CC45);
  static const Color red = Color(0xFFff2336);
  static const Color lightGrey = Color(0xFFe5eaef);
  static const Color grey = Color(0xFF707070);
  static const Color darkNavyBlue = Color(0xFF003863);
  static const Color lightBlue = Color(0xFF008CFF);
  static const Color darkAmber = Color(0xFFFF8800);
  static const Color lightAmber = Color(0xFFFFC400);
  static const Color softGray = Color(0xFFE6E6E6);
  static const Color softYellow = Color(0xFFFFDF31);
  static const Color secondarygrey = Colors.grey;
  static const Color yellow = Colors.yellow;
  static const Color amber = Colors.amber;

  //styles
  static TextStyle getRalewayStyle(
      double fontSize, FontWeight fontWeight, Color color) {
    return TextStyle(
      decoration: TextDecoration.none,
      fontSize: fontSize,
      fontFamily: FONT_RALEWAY,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle getMontserratStyle(
      double fontSize, FontWeight fontWeight, Color color) {
    return TextStyle(
        decoration: TextDecoration.none,
        fontSize: fontSize,
        fontFamily: FONT_MONTSERRAT,
        fontWeight: fontWeight,
        color: color);
  }

  static TextStyle getMontserratDecorationStyle(double fontSize,
      FontWeight fontWeight, Color color, TextDecoration textDecoration) {
    return TextStyle(
        fontSize: fontSize,
        fontFamily: FONT_MONTSERRAT,
        fontWeight: fontWeight,
        color: color,
        decoration: textDecoration);
  }

// final headingStyle = TextStyle(
//    fontSize: getProportionateScreenWidth(28),
//    fontWeight: FontWeight.bold,
//    color: Colors.black,
//    height: 1.5,
//  );

//  OutlineInputBorder outlineInputBorder() {
//    return OutlineInputBorder(
//      borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
//      borderSide: BorderSide(color: primaryColor),
//    );
//  }

  InputDecorationTheme inputDecorationTheme() {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: BorderSide(color: Colors.white),
      gapPadding: 10,
    );
    return InputDecorationTheme(
      // If  you are using latest version of flutter then lable text and hint text shown like this
      // if you r using flutter less then 1.20.* then maybe this is not working properly
      // if we are define our floatingLabelBehavior in our theme then it's not applayed
      // floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      border: outlineInputBorder,
    );
  }

//Strings
//  final RegExp emailValidatorRegExp =
//  RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
//  const String kInvalidEmailError = "Please Enter Valid Email";
//  const String kPassNullError = "Please Enter your password";
//  const String kShortPassError = "Password is too short";
//  const String kMatchPassError = "Passwords don't match";
//  const String kNamelNullError = "Please Enter your name";
//  const String kPhoneNumberNullError = "Please Enter your phone number";
//  const String kAddressNullError = "Please Enter your address";
}

Gradient cardGradient() => LinearGradient(
      colors: [CommonStyles.lightGrey, Colors.white],
      begin: Alignment.bottomRight,
      end: new Alignment(-1.0, -1.0),
    );

Gradient chatHeaderSelectedGradient() => LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [CommonStyles.darkNavyBlue, CommonStyles.lightBlue]);

Gradient chatHeaderUnSelectedGradient() => LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [CommonStyles.secondarygrey, CommonStyles.secondarygrey]);

Gradient chatMsgGradient() => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          CommonStyles.grey.withOpacity(0.3),
          CommonStyles.lightGrey.withOpacity(0.6)
        ]);

Gradient chatMsgGradient2() => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          CommonStyles.blue.withOpacity(0.3),
          CommonStyles.lightBlue.withOpacity(0.6)
        ]);

Gradient profileRatingBoxGradient() => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Colors.white, CommonStyles.softGray]);

Gradient filterTabSelectedGradient() => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.topRight,
    colors: [CommonStyles.darkAmber, CommonStyles.lightAmber]);

Gradient filterTabUnSelectedGradient() => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.topRight,
    colors: [CommonStyles.lightGrey, CommonStyles.lightGrey]);

const String app_name = "Petkon";
const String skip_for_now = "Skip for now>>";
const String empty_username = "Please enter username";
const String empty_userid = "Please enter userid";
const String empty_email = "Please enter email ID";
const String empty_password = "Please enter password";
const String empty_package = "Please select package";
const String accept_tnc = "Please accept terms and conditions";
const String accept_covid_tnc = "Please accept covid guidelines";
const String empty_address = "Please enter address";
const String empty_new_password = "Please enter new password";
const String rent_pe_tagline = "Rent pe le, Rent pe de...";
const String empty_otp = "Please enter OTP";
const String empty_full_name = "Please enter full name";
const String empty_mobile = "Please enter mobile no";
const String empty_conf_password = "Please enter confirm password";
const String pwd_no_match = "Password didn't match";
const String verify_mobile = "Please verify your mobile no";
const String fcm_token_missing = "Token missing";
const String empty_type = "Please enter type";
const String empty_price = "Please enter price";
const String empty_img = "Please upload atleast one image";
const String empty_rental_type = "Please enter rental type";
const String empty_location = "Please select location";
const String empty_brand = "Please enter brand";
const String empty_loren = "Please enter loren";
const String empty_ipsum = "Please enter ipsum";
const String empty_title = "Please enter title";
const String empty_desc = "Please enter description";
const String short_desc = "Please enter description atleast 20 characters";

//Constant
const String SIMILAR_PRODUCT = "SIMILAR_PRODUCT";
const String MORE_PRODUCTS = "MORE_PRODUCTS";
const String USER_LOGIN_RES = "USER_LOGIN_RES";
const String USER_LOCATION_ADDRESS = "USER_LOCATION_ADDRESS";
const String USER_LOCATION_CITY = "USER_LOCATION_CITY";
const String USER_LOCATION_STATE = "USER_LOCATION_STATE";
const String USER_LOCATION_PINCODE = "USER_LOCATION_PINCODE";
const String USER_LOCATION_LAT = "USER_LOCATION_LAT";
const String USER_LOCATION_LONG = "USER_LOCATION_LONG";
const String USER_NAME = "USER_NAME";
const String USER_EMAIL = "USER_EMAIL";
const String USER_MOBILE = "USER_MOBILE";
const String IS_LOGGEDIN = "IS_LOGGEDIN";
const String LOCATION_RADIUS = "500";
const String LOGINTYPE_NOTMAL = "manually";
const String LOGINTYPE_GOOGLE = "facebook";
const String LOGINTYPE_FB = "google";


//API
const String BASE_URL = "https://petkonnect.in/api";
const String LOGIN_API = "/user/login";
const String FORGOTPASSWORD_API = "/user/forgot_password";
const String REGISTER_API = "/user/register";
const String GET_VENDORS = "/vendor/get_stores";
const String GET_ALL_PRODUCTS = "/vendor/get_vendor_store?";
const String ADD_PRODUCT_INCART = "/user/add_to_cart";
const String VIEW_CART = "/user/view_cart";
const String CONFIRM_ORDER = "/order/confirm_order";
const String ORDER_HISTORY = "/order/orderHistory";
const String ORDER_DETAIL = "/vendorOrder/get_order";
const String DELETE_CART = "/user/update_cart";
const String SEARCH_FUNCTION = "/inventory/search";

//const String GET_ALL_PRODUCTS = "/inventory/get_all_products";
const String GET_ALL_PRODUCTS2 = "https://petkonnect.in​/vendor/getvendorstore";
const String GET_PRODUCTDETAIL = "/inventory/product";


const String GOOGLE_AUTOCOMPLETE1 =
    "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=";
const String GOOGLE_AUTOCOMPLETE2 =
    "&types=geocode&language=fr&sensor=true&key=";

const String HEADER_PREFIX = "Bearer ";
const String LOGGEDIN_SUCCESS = "LOGGEDIN_SUCCESS";

const String LOGGEDIN_ERROR = "LOGGEDIN_ERROR";
const String LOGGEDIN_CANCELLED = "LOGGEDIN_CANCELLED";
const String API_ERROR_MSG = "Something went wrong, Please try again later!";
const String GOOGLE_API_KEY = "AIzaSyD3tR0ziIBVRteQ_t7Rd1rIrQoqr08Iv4Q";

//https://maps.googleapis.com/maps/api/place/autocomplete/json?input=mahatashtr&types=geocode&language=fr&sensor=true&key=AIzaSyA-7MnlahCeTpKE5mOD5XQf-8ixgbdtDSs
