import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


abstract class CommonEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialEvent extends CommonEvent {}

class ProgressEvent extends CommonEvent {}

class NonProgressEvent extends CommonEvent {}

class CheckLoggedInEvent extends CommonEvent {}


class LoginEvent extends CommonEvent {
  final String email;
  final String password;

  LoginEvent({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];
}

class RegisterEvent extends CommonEvent {
  final String name;
  final String email;
  final String password;

  RegisterEvent({@required this.name, @required this.email, @required this.password});

  @override
  List<Object> get props => [name, email, password];
}

class ForgotPasswordEvent extends CommonEvent {
  final String email;
  final String token;

  ForgotPasswordEvent({@required this.email, @required this.token});

  @override
  List<Object> get props => [email, token];
}
class GetAllStoresEvent extends CommonEvent {
  final String token;


  GetAllStoresEvent({@required this.token});

  @override
  List<Object> get props => [token];
}
class GetAllProductsEvent extends CommonEvent {
  final String token;
  final String vendorId;


  GetAllProductsEvent({@required this.token, @required this.vendorId});

  @override
  List<Object> get props => [token, vendorId];
}

class GetProductDetailEvent extends CommonEvent {
  final String token;
  final String prodId;

  GetProductDetailEvent({@required this.token, @required this.prodId});

  @override
  List<Object> get props => [token, prodId];
}
class AddCartEvent extends CommonEvent {
  final String token;
final String vendorId;
final String prodId;
final String qunatity;

  AddCartEvent({@required this.token,@required this.vendorId, @required this.prodId, @required this.qunatity});
  @override
  List<Object> get props => [vendorId, prodId,qunatity];
}

class ViewCartEvent extends CommonEvent {
  final String token;


  ViewCartEvent({@required this.token});

  @override
  List<Object> get props => [];
}

class ConfirmorderEvent extends CommonEvent {
  final String token;


  ConfirmorderEvent({@required this.token});

  @override
  List<Object> get props => [];
}

class OrderHistoryEvent extends CommonEvent {
  final String token;


  OrderHistoryEvent({@required this.token});

  @override
  List<Object> get props => [];
}

class DeleteCartEvent extends CommonEvent {
  final String token;
  final List<String> productId;


  DeleteCartEvent({@required this.token,@required this.productId});

  @override
  List<Object> get props => [];
}