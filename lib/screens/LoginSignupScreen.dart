import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_petkon/bloc/CommonBloc.dart';
import 'package:flutter_petkon/bloc/CommonEvent.dart';
import 'package:flutter_petkon/bloc/CommonState.dart';
import 'package:flutter_petkon/inherited/StateContainer.dart';
import 'package:flutter_petkon/model/login_response.dart';
import 'package:flutter_petkon/model/register_res.dart';
import 'package:flutter_petkon/screens/LandingScreen.dart';
import 'package:flutter_petkon/screens/StoreDetailScreen.dart';
import 'package:flutter_petkon/screens/StoreListingScreen.dart';
import 'package:flutter_petkon/utils/CommonStyles.dart';
import 'package:flutter_petkon/utils/Constants.dart';
import 'package:flutter_petkon/utils/size_config.dart';
import 'package:flutter_petkon/widgets/CommonWidget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginSignupScreen extends StatefulWidget {
  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}


class _LoginSignupScreenState extends State<LoginSignupScreen> {
  var mCurrentTab = "login";
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController useridController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController pwdController = new TextEditingController();
  TextEditingController confPwdController = new TextEditingController();
  CommonBloc commonBloc = new CommonBloc();
  LoginResponse mLoginResponse;
  FToast fToast;
  storeLoginDataAndProceed(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(USER_LOGIN_RES, jsonEncode(mLoginResponse));
    StateContainer.of(context).updateUserInfo(mLoginResponse);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LandingScreen()),
    );
  }
@override
  void initState() {
    // TODO: implement initState
  fToast = FToast();
  fToast.init(context);
    super.initState();
  }
  _showToast(String msg) {

    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color:CommonStyles.grey,
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon(Icons.check_circle_outline_rounded),
          SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Text(msg, style: Theme.of(context).textTheme.subtitle1.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),
          ),
        ],
      ),
    );
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 5),
    );
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => commonBloc..add(InitialEvent()),
      child: BlocListener(
          cubit: commonBloc,
          listener: (context, state) {
            if (state is LoginResState) {
              mLoginResponse = state.res;
              print("login response  "+mLoginResponse.message);
              if(mLoginResponse.status){

                storeLoginDataAndProceed(context);
              }else{
                _showToast(mLoginResponse.message);
              }

            }else if (state is RegisterResState) {
              if(state.res is RegisterRes){
                if(state.res.status){
                  _showDialog(context);
                }
              }

            }
          },
          child: BlocBuilder<CommonBloc, CommonState>(
            builder: (context, state) {
              if (state is LoginResState) {
                return getScreenUI(false);
              } else if (state is RegisterResState) {
                return getScreenUI(false);
              }  else if (state is ProgressState) {
                return getScreenUI(true);
              } else {
                return getScreenUI(false);
              }
            },
          )),
    );
  }

  getScreenUI(bool isProgress) {
    return SafeArea(
        child: Stack(
          children: [
            Scaffold(
              key: _scaffoldKey,
              body: Column(
                children: [
                  Container(
                    child: Stack(
                      children: [
                        Stack(
                          children: <Widget>[
                            // Max Size

                            Image.asset("assets/images/login_background.png", fit:BoxFit.fitWidth,height: 300, width: 1000,),
                            Center(
                              child: Container(
                                height: 300,
                                child: Image.asset("assets/images/pet.png",height: 150, width: 150,),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: space_15,
                          left: space_15,
                          child:  Container(
                            color: Colors.white,
                            height: 30,
                            child: Image.asset("assets/icons/logo.png",height: 30, width: 100,),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Transform.translate(
                        offset: const Offset(0.0, -15.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(space_15),
                                  topRight: Radius.circular(space_15))),
                          child: Container(
                            padding:
                            EdgeInsets.only(top: space_15, left: 15, right: 15),
                            margin: EdgeInsets.symmetric(horizontal: space_25),
                            child: ListView(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceAround,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          mCurrentTab = "register";
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                              padding: EdgeInsets.only(
                                                  top: space_15,
                                                  left: space_15,
                                                  right: space_15,
                                                  bottom: space_8),
                                              child: Text(
                                                "SIGN UP",
                                                style:
                                                CommonStyles.getMontserratStyle(
                                                    space_15,
                                                    FontWeight.w600,
                                                    mCurrentTab == "register"
                                                        ? CommonStyles.darkAmber
                                                        : CommonStyles.grey
                                                        .withOpacity(0.5)),
                                              )),
                                          mCurrentTab == "register"
                                              ? Container(
                                            height: space_3,
                                            width: space_80,
                                            color: mCurrentTab == "register"
                                                ? CommonStyles.darkAmber
                                                : CommonStyles.grey
                                                .withOpacity(0.5),
                                          )
                                              : Container(
                                            height: 0,
                                            width: 0,
                                          )
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          mCurrentTab = "login";
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                              padding: EdgeInsets.only(
                                                  top: space_15,
                                                  left: space_15,
                                                  right: space_15,
                                                  bottom: space_8),
                                              child: Text(
                                                "LOGIN",
                                                style:
                                                CommonStyles.getMontserratStyle(
                                                    space_15,
                                                    FontWeight.w600,
                                                    mCurrentTab == "login"
                                                        ? CommonStyles.darkAmber
                                                        : CommonStyles.grey
                                                        .withOpacity(0.5)),
                                              )),
                                          mCurrentTab == "login"
                                              ? Container(
                                            height: space_3,
                                            width: space_80,
                                            color: mCurrentTab == "login"
                                                ? CommonStyles.darkAmber
                                                : CommonStyles.grey
                                                .withOpacity(0.5),
                                          )
                                              : Container(
                                            height: 0,
                                            width: 0,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: space_30,
                                ),
                                mCurrentTab == "register"
                                    ? ListView(
                                  shrinkWrap: true,
                                  primary: false,
                                  children: [
                                    TextInputWithIconWidget(
                                        useridController,
                                        false,
                                        TextInputType.text,
                                        "assets/images/user_logo.png",
                                        "Username"),
                                    SizedBox(
                                      height: space_15,
                                    ),
                                    TextInputWithIconWidget(
                                        emailController,
                                        false,
                                        TextInputType.text,
                                        "assets/images/email.png",
                                        "Mail"),
                                    SizedBox(
                                      height: space_10,
                                    ),
                                    TextInputWithIconWidget(
                                        pwdController,
                                        true,
                                        TextInputType.text,
                                        "assets/images/password.png",
                                        "Password"),
                                    SizedBox(
                                      height: space_10,
                                    ),
                                    TextInputWithIconWidget(
                                        confPwdController,
                                        true,
                                        TextInputType.text,
                                        "assets/images/tick.png",
                                        "Confirm Password"),
                                    SizedBox(
                                      height: space_10,
                                    ),
                                  ],
                                )
                                    : ListView(
                                  shrinkWrap: true,
                                  primary: false,
                                  children: [
                                    TextInputWithIconWidget(
                                        emailController,
                                        false,
                                        TextInputType.text,
                                        "assets/images/user_logo.png",
                                        "Mail"),
                                    SizedBox(
                                      height: space_15,
                                    ),
                                    TextInputWithIconWidget(
                                        pwdController,
                                        true,
                                        TextInputType.text,
                                        "assets/images/tick.png",
                                        "Password"),
                                    SizedBox(
                                      height: space_10,
                                    ),
                                  ],
                                ),
                                mCurrentTab == "register"
                                    ? Container(
                                  height: 0,
                                  width: 0,
                                )
                                    : Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: space_15),
                                    child: Text(
                                      "Forgot Password",
                                      style: CommonStyles.getMontserratStyle(
                                          space_14,
                                          FontWeight.w600,
                                          CommonStyles.blue),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: space_15),
                                  height: space_50,
                                  width: space_120,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LandingScreen()),
                                      );
                                    },
                                    child: GestureDetector(
                                      onTap: () {
                                        onSubmit();
                                      },
                                      child: Container(
                                        height: space_50,
                                        width: space_120,
                                        decoration: BoxDecoration(
                                            color: CommonStyles.amber,
                                            borderRadius:
                                            BorderRadius.circular(space_5)),
                                        child: Center(
                                          child: Padding(
                                              padding: EdgeInsets.all(space_15),
                                              child: Text(
                                                mCurrentTab == "register"
                                                    ? "Submit"
                                                    : "Login",
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
                                ),
                                SizedBox(
                                  height: space_25,
                                ),
                                Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      mCurrentTab == "register"
                                          ? "Or Signup With"
                                          : "Or Login With",
                                      style: CommonStyles.getRalewayStyle(
                                          space_12,
                                          FontWeight.w400, CommonStyles.grey),
                                    )),
                                SizedBox(
                                  height: space_15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Card(
                                      elevation: space_3,
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(space_20)),
                                      child: Container(
                                        padding: EdgeInsets.all(space_10),
                                        width: space_40,
                                        height: space_40,
                                        child: Center(
                                          child: Image.asset(
                                              "assets/images/google.png"),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(space_10),
                                      child: Text(
                                        "or",
                                        style: CommonStyles.getMontserratStyle(
                                            space_12,
                                            FontWeight.w500,
                                            CommonStyles.grey),
                                      ),
                                    ),
                                    Card(
                                      elevation: space_3,
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(space_20)),
                                      child: Container(
                                        padding: EdgeInsets.all(space_10),
                                        width: space_40,
                                        height: space_40,
                                        child: Center(
                                          child: Image.asset(
                                              "assets/images/facebook.png"),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ),
            isProgress
                ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
                : Container(
              height: space_0,
              width: space_0,
            )
          ],
        ));
  }

  onSubmit() {
    if (mCurrentTab == "register") {
      if (useridController.text
          .trim()
          .isEmpty) {
        showSnakbar(_scaffoldKey, empty_username);
      } else if (emailController.text
          .trim()
          .isEmpty) {
        showSnakbar(_scaffoldKey, empty_email);
      } else if (pwdController.text
          .trim()
          .isEmpty) {
        showSnakbar(_scaffoldKey, empty_password);
      } else if (confPwdController.text
          .trim()
          .isEmpty) {
        showSnakbar(_scaffoldKey, empty_conf_password);
      } else if (pwdController.text.trim() !=
          confPwdController.text.trim()) {
        showSnakbar(_scaffoldKey, pwd_no_match);
      } else {
        commonBloc..add(RegisterEvent(name: useridController.text.trim(),
            email: emailController.text.trim(),
            password: pwdController.text.trim()));
      }
    } else if (mCurrentTab == "login") {
      if (emailController.text
          .trim()
          .isEmpty) {
        showSnakbar(_scaffoldKey, empty_email);
      } else if (pwdController.text
          .trim()
          .isEmpty) {
        showSnakbar(_scaffoldKey, empty_password);
      } else {
        commonBloc..add(LoginEvent(email: emailController.text.trim(),
            password: pwdController.text.trim()));
      }
    }
  }

  VoidCallback continueCallBack() {
    setState(() {
      mCurrentTab = "login";
    });
  }

  _showDialog(BuildContext context) {
    BlurryDialog alert = BlurryDialog(
        "Verify", "Please verify your email", continueCallBack);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


}

class BlurryDialog extends StatelessWidget {
  String title;
  String content;
  VoidCallback continueCallBack;

  BlurryDialog(this.title, this.content, this.continueCallBack);

  TextStyle textStyle = TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: AlertDialog(
          title: new Text(
            title,
            style: textStyle,
          ),
          content: new Text(
            content,
            style: textStyle,
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Login"),
              onPressed: () {
                continueCallBack();
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ));
  }

}
