import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WillPopScopeDialog extends StatelessWidget {
  const WillPopScopeDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Caution!'),
      content: const Text('Do you really want to close the application?'),
      actions: [
        ElevatedButton(
          onPressed: () {
            Get.back(result: true);
          },
          child: const Text('Yes'),
        ),
        ElevatedButton(
          onPressed: () {
            Get.back(result: false);
          },
          child: const Text('No'),
        ),
      ],
    );
  }
}
