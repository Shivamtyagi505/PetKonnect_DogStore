import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_petkon/bloc/CommonBloc.dart';
import 'package:flutter_petkon/bloc/CommonEvent.dart';
import 'package:flutter_petkon/bloc/CommonState.dart';
import 'package:flutter_petkon/inherited/StateContainer.dart';
import 'package:flutter_petkon/model/FilterData.dart';
import 'package:flutter_petkon/model/get_all_product_res.dart';
import 'package:flutter_petkon/model/get_store_listing.dart';
import 'package:flutter_petkon/model/login_response.dart';
import 'package:flutter_petkon/screens/FilterScreen.dart';
import 'package:flutter_petkon/utils/CommonStyles.dart';
import 'package:flutter_petkon/utils/Constants.dart';
import 'package:flutter_petkon/utils/size_config.dart';
import 'package:flutter_petkon/widgets/CommonWidget.dart';

class StoreListingScreen extends StatefulWidget {
  @override
  _StoreListingScreenState createState() => new _StoreListingScreenState();
}

class _StoreListingScreenState extends State<StoreListingScreen> {
  var scrollController = new ScrollController();
  var scrollOffset = 0.0;
  var mCurrentTab = "product";
  TextEditingController searchController = new TextEditingController();
  CommonBloc commonBloc = new CommonBloc();
  var token = "";
  LoginResponse loginResponse;
  StorelistingResponse allStoresList;
  List<Vendors> mVendorList = List();
  var isSearchEnabled = false;
  var bannerlist = List<String>();
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
    scrollController.addListener(() => setState(() {}));
    super.initState();

    bannerlist.add("assets/images/banner_1.png");
    bannerlist.add("assets/images/banner_2.png");
    bannerlist.add("assets/images/banner_3.png");

  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("yha aaya --> ${allStoresList?.vendors?.length}");
    return BlocProvider(
      create: (context) => commonBloc..add(GetAllStoresEvent(token: token)),
      child: BlocListener(
          cubit: commonBloc,
          listener: (context, state) {
            debugPrint("ARRAYPOPULATlistener --> ${allStoresList?.vendors?.length}");
            if (state is GetAllStoresResState) {
              allStoresList = state.res;
            }
          },
          child: BlocBuilder<CommonBloc, CommonState>(
            builder: (context, state) {
              debugPrint("ARRAYPOPULATBlocBuilder --> ${allStoresList?.vendors?.length}");
              if (state is GetAllStoresResState) {
                if(state?.res?.status){
                  return getScreenUI(state.res);
                }else{
                  return ProgressWidget();
                }
              } else {
                return ProgressWidget();
              }
            },
          )),
    );
  }

  getScreenUI(StorelistingResponse StorelistingResponse) {
    if(!isSearchEnabled){
      allStoresList = StorelistingResponse;
      debugPrint("ARRAYPOPULATE4 --> ${StorelistingResponse?.vendors?.length}");
      mVendorList = allStoresList?.vendors;
      debugPrint("ARRAYPOPULATE2 --> ${mVendorList?.length}");
    }


    return new Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: space_15),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: space_50),
              child:    ItemDetailImgCarousalWidget(
                  bannerList: bannerlist),
            ),

            SizedBox(
              height: space_20,
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                      flex: 8,
                      child: Container(
                        child: SearchTextInputWidget(
                            searchController, false, TextInputType.name),
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                          child: IconButton(
                              icon: Icon(
                                Icons.filter_list,
                                color: CommonStyles.red,
                              ),
                              onPressed: () {
//                                    openFilter(allStoresList?.filterPet);
                              }))),
                ],
              ),
            ),
            SizedBox(
              height: space_25,
            ),
            Text(
              "Shops recommended for you",
              style: CommonStyles.getMontserratStyle(space_15,
                  FontWeight.w600, CommonStyles.grey.withOpacity(0.8)),
            ),
            SizedBox(
              height: space_15,
            ),
            Container(
              child: Container(
                child: GridView.builder(
                  shrinkWrap: true,
                  primary: false,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: getWidthToHeightRatio(context),
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                  ),
                  itemCount: mVendorList?.length,
                  itemBuilder: (context, index) {
                    return ItemCardNoMarginWidget(
                        mVendorList[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  openFilter(List<String> filterPet) async {
    var res = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FilterScreen(filterPet)),
    );
    isSearchEnabled = false;
    if (res != null && res is FilterData) {
   // commonBloc..add(GetAllProductsEvent(token: token, lowToHigh: res?.sortBy=="low"?"true":"false", highToLow: res?.sortBy=="high"?"true":"false", animalType: res?.foods));
    }
  }

  Positioned _buildFloatingActionButton() {
    final defaultTopMargin = 200.0 - 4.0;
    final startScale = 96.0;
    final endScale = startScale / 2;

    var top = defaultTopMargin;
    var scale = 1.0;

    if (scrollController.hasClients) {
      final offset = scrollOffset;
      top -= offset;
      if (offset < defaultTopMargin - startScale) {
        scale = 1.0;
      } else if (offset < defaultTopMargin - endScale) {
        scale = (defaultTopMargin - endScale - offset) / endScale;
      } else {
        scale = 0.0;
      }
    }
    debugPrint("OFFSET--> ${scale}");

    return new Positioned(
      child: new Transform.scale(
        scale: scale,
        child: Container(
          height: 80,
          width: 80,
          child: new FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {},
            child: Icon(Icons.photo),
          ),
        ),
      ),
      top: top,
      left: (MediaQuery.of(context).size.width / 2) - 40,
      right: (MediaQuery.of(context).size.width / 2) - 40,
    );
  }
}
