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

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}


class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  var mCurrentTab = "Forgot Password";
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController emailController = new TextEditingController();
  CommonBloc commonBloc = new CommonBloc();
  LoginResponse mLoginResponse;
  FToast fToast;

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

              }else{
                _showToast(mLoginResponse.message);
              }

            }
          },
          child: BlocBuilder<CommonBloc, CommonState>(
            builder: (context, state) {
              if (state is ForgotPasswordResState) {
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
                                          mCurrentTab = "Forgot Password";
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
                                                "Forgot Password",
                                                style:
                                                CommonStyles.getMontserratStyle(
                                                    space_15,
                                                    FontWeight.w600,
                                                    mCurrentTab == "Forgot Password"
                                                        ? CommonStyles.darkAmber
                                                        : CommonStyles.grey
                                                        .withOpacity(0.5)),
                                              )),

                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                                SizedBox(
                                  height: space_30,
                                ),
                                ListView(
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
                                    GestureDetector(
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
                                              child: Text( "Submit",
                                                style: CommonStyles
                                                    .getRalewayStyle(
                                                    space_14,
                                                    FontWeight.w600,
                                                    Colors.white),
                                              )),
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

      if (emailController.text
          .trim()
          .isEmpty) {
        showSnakbar(_scaffoldKey, empty_email);
      } else {
      commonBloc..add(ForgotPasswordEvent(email: emailController.text.trim(), token: ""));
      }

  }

  VoidCallback continueCallBack() {
    setState(() {
      mCurrentTab = "login";
    });
  }



}


