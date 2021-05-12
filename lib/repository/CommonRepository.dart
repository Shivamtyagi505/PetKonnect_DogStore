import 'dart:convert';
import 'dart:io';
import 'package:flutter_petkon/model/DeleteCartResponse.dart';
import 'package:flutter_petkon/model/SearchResponse.dart';
import 'package:flutter_petkon/model/get_all_product_res.dart';
import 'package:flutter_petkon/model/get_product_detail_res.dart';
import 'package:flutter_petkon/model/get_store_listing.dart';
import 'package:flutter_petkon/model/login_response.dart';
import 'package:flutter_petkon/model/myCartResponse.dart';
import 'package:flutter_petkon/model/order_history.dart';
import 'package:flutter_petkon/model/register_res.dart';
import 'package:flutter_petkon/model/view_cart.dart';
import 'package:flutter_petkon/repository/base_repository.dart';
import 'package:flutter_petkon/utils/CommonStyles.dart';
import 'package:http/io_client.dart';
import 'package:http/http.dart' as http;

class CommonRepository extends BaseRepository {
  final http.Client _httpClient;

  CommonRepository({http.Client httpClient})
      : _httpClient = httpClient ?? http.Client();

  makeHttpSecure() {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    var http = new IOClient(ioc);
    return http;
  }

  Future<LoginResponse> callLogin(String email, String pwd) async {
    bool status = false;
    LoginResponse response;
    int code = 0;
    //http secure connection
    var http = makeHttpSecure();
 //
     //Map reqBodyMap = {"email": "chiragj97.cj@gmail.com", "password": "Chirag@1234"};
    // Map reqBodyMap = {"email": "aman.mehra655@gmail.com", "password": "12345678"};
       Map reqBodyMap = {"email": email, "password": pwd};
    print("UNDER callLogin ${email}, ${pwd}, ${BASE_URL + LOGIN_API}");
    var res = await http
        .post(BASE_URL + LOGIN_API,
        headers: {"Content-Type":"application/json"},
        body: JsonEncoder().convert(reqBodyMap));
    print("PRINTING callLogin ${res.body}");
    code = res.statusCode;
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      status = data["status"];
      print("PRINTING_STATUS ${status}");
      response = LoginResponse.fromJson(data);
      print("-----------${data}");
    } else {
      response = new LoginResponse();
    }
    return response;
  }

  Future<LoginResponse> callForgotPasswordAPI(String email, String token) async {
    bool status = false;
    LoginResponse response;
    int code = 0;
    //http secure connection
    var http = makeHttpSecure();
    //
    // Map reqBodyMap = {"email": "chiragj97.cj@gmail.com", "password": "Chirag@1234"};
    Map reqBodyMap = {"email": "aman.mehra655@gmail.com"};
    //  Map reqBodyMap = {"email": email, "password": pwd};

    var res = await http
        .post(BASE_URL + FORGOTPASSWORD_API,
        headers: {"Content-Type":"application/json"},
        body: JsonEncoder().convert(reqBodyMap));
    print("PRINTING callLogin ${res.body}");
    code = res.statusCode;
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      status = data["status"];
      print("PRINTING_STATUS ${status}");
      response = LoginResponse.fromJson(data);
      print("-----------${data}");
    } else {
      response = new LoginResponse();
    }
    return response;
  }

  Future<RegisterRes> callRegister(
      String name, String email, String pwd) async {
    bool status = false;
    RegisterRes response;
    int code = 0;
    //http secure connection
    var http = makeHttpSecure();
    Map<String, String> mainheader =  {
      'Content-Type': 'application/json',
    };
    Map reqBodyMap = {"name": name, "email": email, "password": pwd};
    print("UNDER callRegister ");
    var res = await http
        .post(BASE_URL + REGISTER_API,
        headers: {"Content-Type":"application/json"},
        body: JsonEncoder().convert(reqBodyMap));
    // var url = Uri.https('petkonnect.in', 'vendor/vendor_registration');
    // var res = await http.post(url,
    //     headers: mainheader,
    //     body: JsonEncoder().convert(reqBodyMap));
    print("PRINTING  callRegister ${res.body}");
    code = res.statusCode;
    if (res.statusCode == 200) {
      var data = json.decode(res.body);

      print("-----------${data}");
      status = data["status"];
      print("PRINTING_STATUS ${status}");
      response = RegisterRes.fromJson(data);

    } else {
      response = new RegisterRes(status:false);
    }
    return response;
  }
  Future<GetAllProductRes> callGetAllProduct2(String token,String vendorId) async {
    bool status = false;
    GetAllProductRes response;

    print("token  $token");

    print("APi name $GET_ALL_PRODUCTS");
    //60730b0c9063af92d2063822
    final res = await http.get(BASE_URL + GET_ALL_PRODUCTS +"vendorID=$vendorId", headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    print("PRINTING ${res.body}");
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      status = data["status"];
      print("PRINTING_STATUS ${status}");
      response = GetAllProductRes.fromJson(data);
      print("-----------${data}");

    } else {
      response = new GetAllProductRes(status: false);
    }
    print("-----------rresssssss  ${response}");
    return response;
  }

  Future<StorelistingResponse> callGetAllStores(String token) async {
    bool status = false;
    StorelistingResponse response;

    print("token  $token");

    print("APi name $GET_ALL_PRODUCTS");
    final res = await http.get(BASE_URL + GET_VENDORS, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    print("PRINTING ${res.body}");
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      status = data["status"];
      print("PRINTING_STATUS ${status}");
      response = StorelistingResponse.fromJson(data);
      print("-----------${data}");

    } else {
      response = new StorelistingResponse(status: false);
    }
    print("-----------rresssssss  ${response}");
    return response;
  }

  Future<SearchResponse> callGetSearch(String token, String seacrhKeyword) async {
    bool status = false;
    SearchResponse response;

    print("token  $token");



     Map reqBodyMap = {"search": seacrhKeyword};
    print("url.... "+BASE_URL + SEARCH_FUNCTION);
    var res = await http
        .post(BASE_URL + SEARCH_FUNCTION,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: JsonEncoder().convert(reqBodyMap));
    print("PRINTING ${res.body}");
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      status = data["status"];
      print("PRINTING_STATUS ${status}");
      response = SearchResponse.fromJson(data);
      print("-----------${data}");

    } else {
      response = new SearchResponse(status: false);
    }
    print("-----------rresssssss  ${response}");
    return response;
  }

  Future<GetProductDetailRes> callProductDetail(
      String token, String prodId) async {
    bool status = false;
    GetProductDetailRes response;
    int code = 0;
    //http secure connection
    var http = makeHttpSecure();
    print("UNDER callProductDetail ${BASE_URL + GET_PRODUCTDETAIL+"/${prodId}"}");


    final res = await http.get(BASE_URL + GET_PRODUCTDETAIL+"/${prodId}", headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    code = res.statusCode;
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      status = data["status"];
      print("PRINTING_STATUS ${status}");
      response = GetProductDetailRes.fromJson(data);
      print("-----------${data}");
    } else {
      response = new GetProductDetailRes();
    }
    return response;
  }
  Future<ViewCartResponse> callViewcart(
      String token) async {
    bool status = false;
    ViewCartResponse response;
    int code = 0;
    print("-----------${token}");
    //http secure connection
    var http = makeHttpSecure();
    print("-----------${BASE_URL + VIEW_CART}");
    final res = await http.post(BASE_URL + VIEW_CART, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    code = res.statusCode;
    print("-----------${res.statusCode}");
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      status = data["status"];
      print("PRINTING_STATUS ${status}");
      print("-----------${data}");
      response = ViewCartResponse.fromJson(data);

    } else {
      response = new ViewCartResponse();
    }
    return response;
  }
  Future<MycartResponse> callConfirmOrderAPI(
      String token) async {
    bool status = false;
    MycartResponse response;
    int code = 0;
    print("-----------${token}");
    //http secure connection
    var http = makeHttpSecure();
    print("-----------${BASE_URL + CONFIRM_ORDER}");
    final res = await http.post(BASE_URL + CONFIRM_ORDER, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    code = res.statusCode;
    print("-----------${res.statusCode}");
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      status = data["status"];
      print("PRINTING_STATUS ${status}");
      print("-----------${data}");
      response = MycartResponse.fromJson(data);

    } else {
      response = new MycartResponse();
    }
    return response;
  }
  Future<OrderHistoryResponse> callgetOrderHistoryAPI(String token) async {
    bool status = false;
    OrderHistoryResponse response;
    int code = 0;
    print("-----------${token}");
    //http secure connection
    var http = makeHttpSecure();
    print("-----------${BASE_URL + ORDER_HISTORY}");
    final res = await http.post(BASE_URL + ORDER_HISTORY, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    code = res.statusCode;
    print("-----------${res.statusCode}");
    if (res.statusCode == 200) {

      var data = json.decode(res.body);
      print("-----------${data}");
      status = data["status"];
      print("PRINTING_STATUS ${status}");
      print("-----------${data}");
      response = OrderHistoryResponse.fromJson(data);

    } else {
      response = new OrderHistoryResponse();
    }
    return response;
  }

  Future<DeleteCartResponse> calldeletecartAPI(String token, List<String> productId) async {
    bool status = false;
    DeleteCartResponse response;
    int code = 0;
    print("-----------${token}");
    //http secure connection
    var http = makeHttpSecure();

    var productIdThis= productId.toString();
    String requestParam = '{"productIDs": $productIdThis}';
    print("-----------$requestParam");
    print("-----------${BASE_URL + DELETE_CART}");
    final res = await http.post(BASE_URL + DELETE_CART,body:requestParam, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    code = res.statusCode;
    print("-----------${res.statusCode}");
    if (res.statusCode == 200) {

      var data = json.decode(res.body);
      print("-----------${data}");
      status = data["status"];
      print("PRINTING_STATUS ${status}");
      print("-----------${data}");
      response = DeleteCartResponse.fromJson(data);

    } else {
      response = new DeleteCartResponse();
    }
    return response;
  }


  Future<MycartResponse> callAddProductInCart(String token,String vendorId,String prodId,String quantity) async {
    bool status = false;
    MycartResponse response;

    print("token: $token  productID: $prodId vendorID: $vendorId   quantity: $quantity" );

    print("method: $ADD_PRODUCT_INCART" );
    // set up PUT request arguments
    String requestParam = '{"productID": "$prodId", "vendorID": "$vendorId", "quantity": $quantity}';


  //  Map reqBodyMap = {"productID": prodId, "vendorID": vendorId, "quantity": quantity};
    print("url.... "+BASE_URL + ADD_PRODUCT_INCART);
    var res = await http
        .put(BASE_URL + ADD_PRODUCT_INCART,
         headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        },
        body: requestParam);
    print("PRINTING ${res.body}");
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      status = data["status"];
      print("PRINTING_STATUS ${status}");
      response = MycartResponse.fromJson(data);
      print("-----------${data}");

    } else {
      response = new MycartResponse(status: false);
    }
    print("-----------rresssssss  ${response}");
    return response;
  }
  @override
  void dispose() {
    // TODO: implement dispose
  }
}
