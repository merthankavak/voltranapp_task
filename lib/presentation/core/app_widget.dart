import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../application/tap_record/index.dart';
import '../pages/tap_record/tap_record_view.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Voltran App Task',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialBinding: TapRecordBinding(),
      home: const TapRecordView(),
    );
  }
}
