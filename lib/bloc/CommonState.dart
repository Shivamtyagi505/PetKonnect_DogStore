import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_petkon/model/DeleteCartResponse.dart';
import 'package:flutter_petkon/model/get_all_product_res.dart';
import 'package:flutter_petkon/model/get_product_detail_res.dart';
import 'package:flutter_petkon/model/get_store_listing.dart';
import 'package:flutter_petkon/model/login_response.dart';
import 'package:flutter_petkon/model/myCartResponse.dart';
import 'package:flutter_petkon/model/order_history.dart';
import 'package:flutter_petkon/model/register_res.dart';
import 'package:flutter_petkon/model/view_cart.dart';

abstract class CommonState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialHomeState extends CommonState {}

class ProgressState extends CommonState {}

class NonProgressState extends CommonState {}

class SuccessState extends CommonState {
  final obj;

  SuccessState({@required this.obj});

  @override
  List<Object> get props => [obj];
}

class CheckLoggedInState extends CommonState {
  final obj;

  CheckLoggedInState({@required this.obj});

  @override
  List<Object> get props => [obj];
}

class LoginResState extends CommonState {
  final res;

  LoginResState({@required this.res});

  @override
  List<LoginResponse> get props => [res];
}
class ForgotPasswordResState extends CommonState {
  final res;

  ForgotPasswordResState({@required this.res});

  @override
  List<LoginResponse> get props => [res];
}

class RegisterResState extends CommonState {
  final res;

  RegisterResState({@required this.res});

  @override
  List<RegisterRes> get props => [res];
}
class GetAllStoresResState extends CommonState {
  final res;

  GetAllStoresResState({@required this.res});

  @override
  List<StorelistingResponse> get props => [res];
}

class GetAllProductResState extends CommonState {
  final res;

  GetAllProductResState({@required this.res});

  @override
  List<GetAllProductRes> get props => [res];
}

class ProductDetailResState extends CommonState {
  final res;

  ProductDetailResState({@required this.res});

  @override
  List<GetProductDetailRes> get props => [res];
}

class AddCartResState extends CommonState {
  final res;

  AddCartResState({@required this.res});

  @override
  List<MycartResponse> get props => [res];
}

class ViewCartResState extends CommonState {
  final res;

  ViewCartResState({@required this.res});

  @override
  List<ViewCartResponse> get props => [res];
}
class ConfirmOrderResState extends CommonState {
  final res;

  ConfirmOrderResState({@required this.res});

  @override
  List<MycartResponse> get props => [res];
}

class OrderHistoryResState extends CommonState {
  final res;

  OrderHistoryResState({@required this.res});

  @override
  List<OrderHistoryResponse> get props => [res];
}

class DeletecartResState extends CommonState {
  final res;

  DeletecartResState({@required this.res});

  @override
  List<DeleteCartResponse> get props => [res];
}
///inventory/get_all_products/{low_to_high}/{high_to_low}
