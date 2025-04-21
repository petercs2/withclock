import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:styled_widget/styled_widget.dart';

import 'dial_setting_logic.dart';

class DialSettingPage extends GetView<DialSettingLogic> {
  const DialSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: Colors.white,
          title: const Text(
            'Setting',
            style: TextStyle(color: Colors.white),
          )),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: GetBuilder<DialSettingLogic>(builder: (_) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: <Widget>[
                  const Text(
                    'Select the dial',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  <Widget>[
                    const Icon(
                      Icons.keyboard_arrow_left,
                      size: 37,
                      color: Color(0xff6a6a6a),
                    ).gestures(onTap: () async {
                      controller.type--;
                      if (controller.type < 0) {
                        controller.type = 3;
                      }
                      controller.update();
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setInt('type', controller.type);
                    }),
                    Image.asset(
                      'assets/bg${controller.type}.webp',
                      width: 111,
                      height: 201,
                      fit: BoxFit.fitWidth,
                    ),
                    const Icon(
                      Icons.keyboard_arrow_right,
                      size: 37,
                      color: Color(0xff6a6a6a),
                    ).gestures(onTap: () async {
                      controller.type++;
                      if (controller.type > 3) {
                        controller.type = 0;
                      }
                      controller.update();
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setInt('type', controller.type);
                    })
                  ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween)
                ].toColumn(),
              ).decorated(
                  color: const Color(0xff333333).withOpacity(0.59),
                  borderRadius: BorderRadius.circular(20)),
              const SizedBox(height: 20),
              <Widget>[
                const Text(
                  'About us',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const Text("v1.0.0",style: TextStyle(color: Colors.white),).paddingOnly(right: 10),
              ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
            ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
          );
        }).marginAll(15)),
      ),
    );
  }
}
