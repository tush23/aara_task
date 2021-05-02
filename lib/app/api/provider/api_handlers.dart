import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiHandler {
  static final ApiHandler _singleton = ApiHandler._internal();

  factory ApiHandler() {
    return _singleton;
  }
  Color kPrimaryColor=Colors.black;

  ApiHandler._internal();

  noLocationDialog(Function onOkPress)=>Get.defaultDialog(
      title: 'Location Required',
      barrierDismissible: false,
      confirm: Container(
        // padding: const EdgeInsets.symmetric(horizontal: 16),
        width: 80,
        height: 40,
        child: MaterialButton(
            color: kPrimaryColor,
            onPressed: ()=>onOkPress(), child: Text('Ok',style: Get.textTheme.button!.copyWith(color: Colors.white),)),
      ),
      middleText: 'Please enable location permission');


  Future<dynamic> loading() => showDialog(
        barrierDismissible: false,
        builder: (ctx) => Center(
            child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                ),
                width: 60,
                height: 60,
                child: CircularProgressIndicator(
                    strokeWidth: 1.5,
                    semanticsLabel: "Loadinf",
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(kPrimaryColor)))),
        context: Get.context as BuildContext,
      );

  Widget progressIndicator()=>Center(
    child: CircularProgressIndicator(
        strokeWidth: 1.5,
        semanticsLabel: "Loadinf",
        valueColor:
        new AlwaysStoppedAnimation<Color>(kPrimaryColor)),
  );
  Widget emptyWidget()=>Center(child: Text('No Data Found',style: Get.textTheme.headline5,));
}
