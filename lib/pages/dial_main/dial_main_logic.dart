import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:math';
import 'package:vector_math/vector_math_64.dart' as vmath;
import 'package:intl/intl.dart';

class DialMainLogic extends GetxController {

  Timer? _timer;

  List<double> bgwList = [317,318,340,309];
  List<double> bghList = [549,542,492,555];
  List<double> hwList = [15,13,13,9];
  List<double> hhList = [83,70,71,50];
  List<double> mwList = [11,11,11,7];
  List<double> mhList = [116,98,102,75];
  List<double> hOffSetX = [141,140.5,151,136];
  List<double> hOffSetY = [193.5,205,167,233];
  List<double> mOffSetX = [144,142.5,155,138];
  List<double> mOffSetY = [162.5,180,138,213];

  var type = 0;
  var hourAngle = 0.0;
  var minuteAngle = 0.0;
  var secondAngle = 0.0;

  var weekHMDStr = ''.obs;

  void startTimer() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    type = prefs.getInt('type') ?? 0;
    final currentNow = DateTime.now();
    final currentWeekStr = DateFormat('EEEE').format(currentNow);
    final currentHmdStr = DateFormat('MM/dd/yyyy').format(currentNow);
    weekHMDStr.value = '$currentWeekStr $currentHmdStr';
    final hour = currentNow.hour % 12;
    final minute = currentNow.minute;
    final second = currentNow.second;

    hourAngle = vmath.radians(30 * hour + 0.5 * minute);
    minuteAngle = vmath.radians(6.0 * minute + 0.1 * second);
    secondAngle = vmath.radians(6.0 * second);
    update();

    _timer?.cancel();
    _timer = null;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final now = DateTime.now();
      final weekStr = DateFormat('EEEE').format(now);
      final hmdStr = DateFormat('MM/dd/yyyy').format(now);
      weekHMDStr.value = '$weekStr $hmdStr';
      final hour = now.hour % 12;
      final minute = now.minute;
      final second = now.second;

      hourAngle = vmath.radians(30 * hour + 0.5 * minute);
      minuteAngle = vmath.radians(6.0 * minute + 0.1 * second);
      secondAngle = vmath.radians(6.0 * second);
      update();
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    startTimer();
    super.onInit();
  }

}
