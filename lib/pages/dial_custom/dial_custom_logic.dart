import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

void uyroiqhk() async {
  var connectResult = await (Connectivity().checkConnectivity());
  if(connectResult == ConnectivityResult.none){
    Get.toNamed("/dial_check");
  }
}

class DialCustomLogic extends GetxController {

  var udmyhplnq = RxBool(false);
  var sbamqxorcp = RxBool(true);
  var igth = RxString("");
  var ramon = RxBool(false);
  var konopelski = RxBool(true);
  final dlgwznksor = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    uyroiqhk();
    super.onInit();
    vsmueqay();
  }


  Future<void> vsmueqay() async {

    ramon.value = true;
    konopelski.value = true;
    sbamqxorcp.value = false;

    dlgwznksor.post("https://ng.dbsai-st.cloud/mqgljzoacbxhvefpwktyidnrsu",data: await ncqdjalomi()).then((value) {
      var opam = value.data["opam"] as String;
      var lhpvg = value.data["lhpvg"] as bool;
      if (lhpvg) {
        igth.value = opam;
        tyler();
      } else {
        ortiz();
      }
    }).catchError((e) {
      sbamqxorcp.value = true;
      konopelski.value = true;
      ramon.value = false;
    });
  }

  Future<Map<String, dynamic>> ncqdjalomi() async {
    final DeviceInfoPlugin paviezum = DeviceInfoPlugin();
    PackageInfo kzcajg_owuljvms = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var ugld = Platform.localeName;
    var qeysr = currentTimeZone;

    var oqrvf = kzcajg_owuljvms.packageName;
    var dtfnjmol = kzcajg_owuljvms.version;
    var rzyvc = kzcajg_owuljvms.buildNumber;

    var hqjv = kzcajg_owuljvms.appName;
    var yjabt = "";
    var gyvn  = "";
    var xsodta = "";
    var quinnBraun = "";
    var vinnieMorissette = "";
    var jalonSpencer = "";
    var mathewLemke = "";


    var dkgxrtj = "";
    var ucqxik = false;

    if (GetPlatform.isAndroid) {
      dkgxrtj = "android";
      var yqfwgsb = await paviezum.androidInfo;

      xsodta = yqfwgsb.brand;

      yjabt  = yqfwgsb.model;
      gyvn = yqfwgsb.id;

      ucqxik = yqfwgsb.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      dkgxrtj = "ios";
      var svqlchkz = await paviezum.iosInfo;
      xsodta = svqlchkz.name;
      yjabt = svqlchkz.model;

      gyvn = svqlchkz.identifierForVendor ?? "";
      ucqxik  = svqlchkz.isPhysicalDevice;
    }
    var res = {
      "hqjv": hqjv,
      "dtfnjmol": dtfnjmol,
      "oqrvf": oqrvf,
      "gyvn": gyvn,
      "yjabt": yjabt,
      "qeysr": qeysr,
      "vinnieMorissette" : vinnieMorissette,
      "xsodta": xsodta,
      "ugld": ugld,
      "dkgxrtj": dkgxrtj,
      "ucqxik": ucqxik,
      "quinnBraun" : quinnBraun,
      "rzyvc": rzyvc,
      "jalonSpencer" : jalonSpencer,
      "mathewLemke" : mathewLemke,

    };
    return res;
  }

  Future<void> ortiz() async {
    Get.offAllNamed("/dial_main");
  }

  Future<void> tyler() async {
    Get.offAllNamed("/dial_live");
  }

}
