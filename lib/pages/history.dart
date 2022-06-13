import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/storecontroller.dart';

class History extends GetView<StoreController> {
  History({Key? key}) : super(key: key);
  final storeController = Get.put(StoreController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('History'),
      ),
    );
  }
}
