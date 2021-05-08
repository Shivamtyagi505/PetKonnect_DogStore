import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_petkon/bloc/CommonEvent.dart';
import 'package:flutter_petkon/bloc/CommonState.dart';
import 'package:flutter_petkon/model/login_response.dart';
import 'package:flutter_petkon/utils/CommonStyles.dart';
import 'package:flutter_petkon/repository/CommonRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CommonBloc extends Bloc<CommonEvent, CommonState> {
  CommonRepository commonRepository;

  CommonBloc() : super(null) {
    commonRepository = CommonRepository();
  }

  @override
  CommonState get initialState => InitialHomeState();

  @override
  Stream<CommonState> mapEventToState(CommonEvent event) async* {
    if (event is InitialEvent) {
      yield InitialHomeState();
    } else if (event is CheckLoggedInEvent) {
      yield* checkLoggedIn();
    } else if (event is LoginEvent) {
      yield ProgressState();
      yield* callLoginApi(event.email, event.password);
    } else if (event is RegisterEvent) {
      yield ProgressState();
      yield* callRegisterApi(event.name, event.email, event.password);
    }else if (event is ForgotPasswordEvent) {
      yield ProgressState();
      yield* callForgotPasswordAPI(event.token,event.email);
    }else if (event is GetAllStoresEvent) {
      yield ProgressState();
      yield* callGetAllStoresApi(event.token);
    }
    else if (event is GetAllProductsEvent) {
      yield ProgressState();
      yield* callGetAllProductApi(event.token,event.vendorId);
    } else if (event is GetProductDetailEvent) {
      yield ProgressState();
      yield* callGetProductDetailApi(event.token, event.prodId);
    }else if (event is AddCartEvent) {
      yield ProgressState();
      yield* callAddProductInCartApi(event.token,event.vendorId, event.prodId,event.qunatity);
    }else if (event is ViewCartEvent) {
      yield ProgressState();
      yield* callGetViewCartApis(event.token);
    }else if (event is ConfirmorderEvent) {
      yield ProgressState();
      yield* callConfirmOrderApis(event.token);
    }else if (event is OrderHistoryEvent) {
      yield ProgressState();
      yield* callgetOrderHistory(event.token);
    }else if (event is DeleteCartEvent) {
      yield ProgressState();
      yield* callDeleteCartItem(event.token,event.productId);
    }


  }

  Stream<CommonState> checkLoggedIn() async* {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isLoggedIn = (prefs.getString(USER_NAME) != null &&
          prefs.getString(USER_NAME).isNotEmpty)
          ? true
          : false;
      if (isLoggedIn) {
        debugPrint("PREFS_READ -- ${prefs.getString(USER_NAME)}");
        var response =
        LoginResponse.fromJson(jsonDecode(prefs.getString(USER_LOGIN_RES)));
        yield CheckLoggedInState(obj: response);
      } else {
        yield CheckLoggedInState(obj: null);
      }
    } catch (e) {
      debugPrint("Exception while checkLoggedIn ${e.toString()}");
    }
  }

  Stream<CommonState> callLoginApi(String email, String pwd) async* {
    try {
      commonRepository =
      commonRepository != null ? commonRepository : CommonRepository();
      debugPrint(
          "LOGIN_API_CALL ${commonRepository == null ? "NULL" : "NOTNULL"}");
      final loginRes = await commonRepository.callLogin(email, pwd);
      debugPrint("LOGIN_API_CALL_RES ${jsonEncode(loginRes)}");
      yield LoginResState(res: loginRes);
    } catch (e, stacktrace) {
      debugPrint("Exception while Login ${e.toString()}, \n${stacktrace.toString()}");
    }
  }

  Stream<CommonState> callRegisterApi(String name, String email, String pwd) async* {
    try {
      commonRepository =
      commonRepository != null ? commonRepository : CommonRepository();
      debugPrint(
          "REGISTER_API_CALL ${commonRepository == null ? "NULL" : "NOTNULL"}");
      final registerRes = await commonRepository.callRegister(name, email, pwd);
      debugPrint("REGISTER_API_CALL_RES ${jsonEncode(registerRes)}");
      yield RegisterResState(res: registerRes);
    } catch (e,stacktrace) {
      debugPrint("Exception while REGISTER_API_CALL ${e.toString()}\n${stacktrace.toString()}");
    }
  }
  Stream<CommonState> callForgotPasswordAPI(String email, String token) async* {
    try {
      commonRepository =
      commonRepository != null ? commonRepository : CommonRepository();
      debugPrint(
          "LOGIN_API_CALL ${commonRepository == null ? "NULL" : "NOTNULL"}");
      final forgotPasswordRes = await commonRepository.callLogin(email, token);
      debugPrint("LOGIN_API_CALL_RES ${jsonEncode(forgotPasswordRes)}");
      yield ForgotPasswordResState(res: forgotPasswordRes);
    } catch (e, stacktrace) {
      debugPrint("Exception while Login ${e.toString()}, \n${stacktrace.toString()}");
    }
  }
  Stream<CommonState> callGetAllStoresApi(String token) async* {
    try {
      commonRepository =
      commonRepository != null ? commonRepository : CommonRepository();
      debugPrint(
          "GET_ALL_PRODUCT_API_CALL ${commonRepository == null ? "NULL" : "NOTNULL"}");
      final getAllStores = await commonRepository.callGetAllStores(token);
      debugPrint("yha aaya ${getAllStores}");
      debugPrint("GET_ALL_PRODUCT_API_CALL_RES ${jsonEncode(getAllStores)}");
      yield GetAllStoresResState(res: getAllStores);
    } catch (e, stacktrace) {
      debugPrint("Exception while GET_ALL_PRODUCT_API_CALL ${e.toString()}\n${stacktrace.toString()}");
    }
  }

  Stream<CommonState> callGetAllProductApi(String token,String vendorId) async* {
    try {
      commonRepository =
      commonRepository != null ? commonRepository : CommonRepository();
      debugPrint(
          "GET_ALL_PRODUCT_API_CALL ${commonRepository == null ? "NULL" : "NOTNULL"}");
      final getAllProdRes = await commonRepository.callGetAllProduct2(token,vendorId);
      debugPrint("yha aaya ${getAllProdRes}");
      debugPrint("GET_ALL_PRODUCT_API_CALL_RES ${jsonEncode(getAllProdRes)}");
      yield GetAllProductResState(res: getAllProdRes);
    } catch (e, stacktrace) {
      debugPrint("Exception while GET_ALL_PRODUCT_API_CALL ${e.toString()}\n${stacktrace.toString()}");
    }
  }

  Stream<CommonState> callGetProductDetailApi(String token, String prodId) async* {
    debugPrint("detail main aaya");
    try {
      commonRepository =
      commonRepository != null ? commonRepository : CommonRepository();
      debugPrint(
          "PRODUCT_DETAIL_API_CALL ${commonRepository == null ? "NULL" : "NOTNULL"}");
      final prodDetailRes = await commonRepository.callProductDetail(token, prodId);
      debugPrint("PRODUCT_DETAIL_API_CALL_RES ${jsonEncode(prodDetailRes)}");
      yield ProductDetailResState(res: prodDetailRes);
    } catch (e, stacktrace) {
      debugPrint("Exception while PRODUCT_DETAIL_API_CALL ${e.toString()}\n${stacktrace.toString()}");
    }
  }
  Stream<CommonState> callAddProductInCartApi(String token,String vendorId, String prodId,String quantity) async* {
    debugPrint("detail main aaya");
    try {
      commonRepository =
      commonRepository != null ? commonRepository : CommonRepository();
      debugPrint(
          "ADD TO CART API ${commonRepository == null ? "NULL" : "NOTNULL"}");
      final prodDetailRes = await commonRepository.callAddProductInCart(token,vendorId, prodId,quantity);
      debugPrint("ADD TO CART API res ${jsonEncode(prodDetailRes)}");
      yield AddCartResState(res: prodDetailRes);
    } catch (e, stacktrace) {
      debugPrint("Exception while ADD TO CART API ${e.toString()}\n${stacktrace.toString()}");
    }
  }
  Stream<CommonState> callGetViewCartApis(String token) async* {

    try {
      commonRepository =
      commonRepository != null ? commonRepository : CommonRepository();
      debugPrint(
          "callGetViewCartApis ${commonRepository == null ? "NULL" : "NOTNULL"}");
      final viewcartResstate = await commonRepository.callViewcart(token);
      debugPrint("callGetViewCartApis_RES ${jsonEncode(viewcartResstate)}");
      yield ViewCartResState(res: viewcartResstate);
    } catch (e, stacktrace) {
      debugPrint("Exception while callGetViewCartApis_API_CALL ${e.toString()}\n${stacktrace.toString()}");
    }
  }
  Stream<CommonState> callConfirmOrderApis(String token) async* {

    try {
      commonRepository =
      commonRepository != null ? commonRepository : CommonRepository();
      debugPrint(
          "callConfirmOrderApis ${commonRepository == null ? "NULL" : "NOTNULL"}");
      final viewcartResstate = await commonRepository.callConfirmOrderAPI(token);
      debugPrint("callConfirmOrderApis_RES ${jsonEncode(viewcartResstate)}");
      yield ConfirmOrderResState(res: viewcartResstate);
    } catch (e, stacktrace) {
      debugPrint("Exception while callConfirmOrderApis ${e.toString()}\n${stacktrace.toString()}");
    }
  }
  Stream<CommonState> callgetOrderHistory(String token) async* {

    try {
      commonRepository =
      commonRepository != null ? commonRepository : CommonRepository();
      debugPrint(
          "callgetOrderHistory ${commonRepository == null ? "NULL" : "NOTNULL"}");
      final viewcartResstate = await commonRepository.callgetOrderHistoryAPI(token);
    debugPrint("callgetOrderHistory ${jsonEncode(viewcartResstate)}");
      yield OrderHistoryResState(res: viewcartResstate);
    } catch (e, stacktrace) {
      debugPrint("Exception while callgetOrderHistory ${e.toString()}\n${stacktrace.toString()}");
    }
  }

  Stream<CommonState> callDeleteCartItem(String token, List<String> productId) async* {

    try {
      commonRepository =
      commonRepository != null ? commonRepository : CommonRepository();
      debugPrint(
          "callgetOrderHistory ${commonRepository == null ? "NULL" : "NOTNULL"}");
      final viewcartResstate = await commonRepository.calldeletecartAPI(token,productId);
      debugPrint("callgetOrderHistory ${jsonEncode(viewcartResstate)}");
      yield DeletecartResState(res: viewcartResstate);
    } catch (e, stacktrace) {
      debugPrint("Exception while callgetOrderHistory ${e.toString()}\n${stacktrace.toString()}");
    }
  }

}

