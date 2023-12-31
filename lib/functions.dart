import 'package:flutter/material.dart';
import 'package:get/get.dart';

void loading() {
  showDialog(
    barrierDismissible: false,
    context: Get.context!,
    builder: (BuildContext context) => WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: const Center(
        child: CircularProgressIndicator(color: Colors.white),
      ),
    ),
  );
}
