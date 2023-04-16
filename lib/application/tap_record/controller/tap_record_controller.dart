import 'dart:async';

import 'package:get/get.dart';

class TapRecordController extends GetxController {
  final RxList<int> _tapTimes = <int>[].obs;
  final RxInt _tapCount = 0.obs;
  final RxBool _isExecuting = false.obs;

  int get tapCount => _tapCount.value;

  bool get isExecuting => _isExecuting.value;

  /// Record the time between each tab then add it to [_tapTimes]
  void recordTap() => _tapTimes.add(DateTime.now().millisecondsSinceEpoch);

  /// Increment the [_tapCount] with the same delays just after long press
  Future<void> incrementCount() async {
    _isExecuting.value = true;
    var previousTapTime = _tapTimes.isEmpty ? 0 : _tapTimes.last;

    for (var i = 0; i < _tapTimes.length; i++) {
      final delay = _tapTimes[i] - previousTapTime;
      await Future.delayed(Duration(milliseconds: delay), () {
        _tapCount.value++;
      });
      previousTapTime = _tapTimes[i];
    }

    _tapTimes.clear();
    _isExecuting.value = false;
  }
}
