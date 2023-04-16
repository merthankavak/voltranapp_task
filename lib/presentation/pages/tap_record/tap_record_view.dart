import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../application/tap_record/index.dart';

class TapRecordView extends StatelessWidget {
  const TapRecordView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TapRecordController>();
    return Scaffold(
      appBar: AppBar(title: const Text('Voltran App Task'), centerTitle: true),
      floatingActionButton: _buildFAB(controller),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Obx(
              () => Text(
                '${controller.tapCount}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAB(TapRecordController controller) {
    return InkWell(
      onLongPress: controller.incrementCount,
      child: Obx(
        () => FloatingActionButton(
          backgroundColor: controller.isExecuting ? Colors.red : Colors.blue,
          onPressed: controller.recordTap,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
