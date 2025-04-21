import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'dart:math';
import 'dial_main_logic.dart';

class DialMainPage extends StatefulWidget {
  const DialMainPage({Key? key}) : super(key: key);

  @override
  State<DialMainPage> createState() => _DialMainPageState();
}

class _DialMainPageState extends State<DialMainPage> {
  DialMainLogic controller = Get.find();

  void checkNetwork() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      Get.toNamed('/dial_check');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    checkNetwork();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<DialMainLogic>(builder: (_) {
        return SafeArea(
            child: <Widget>[
              Obx(() {
                return Text(
                  controller.weekHMDStr.value,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                );
              }),
              const SizedBox(
                height: 20,
              ),
              <Widget>[
                Image.asset(
                  'assets/bg${controller.type}.webp',
                  width: controller.bgwList[controller.type],
                  height: controller.bghList[controller.type],
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: controller.mOffSetY[controller.type],
                  left: controller.mOffSetX[controller.type],
                  child: Transform.rotate(
                    angle: controller.minuteAngle,
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      'assets/m${controller.type}.webp',
                      width: controller.mwList[controller.type],
                      height: controller.mhList[controller.type],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: controller.hOffSetY[controller.type],
                  left: controller.hOffSetX[controller.type],
                  child: Transform.rotate(
                    angle: controller.hourAngle,
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      'assets/h${controller.type}.webp',
                      width: controller.hwList[controller.type],
                      height: controller.hhList[controller.type],
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ].toStack(alignment: Alignment.center),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerRight,
                child:const Icon(
                  Icons.settings,
                  size: 37,
                  color: Color(0xff5d5d5d),
                ).gestures(onTap: (){
                  Get.toNamed('/dial_setting',arguments: controller.type)?.then((_) {
                    controller.startTimer();
                  });
                }),
              )
            ].toColumn(mainAxisAlignment: MainAxisAlignment.center));
      }),
    );
  }
}
