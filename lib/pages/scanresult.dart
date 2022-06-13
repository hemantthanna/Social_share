import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/storecontroller.dart';
import '../models/socialcard.dart';

class ScanResult extends GetView<StoreController> {
  ScanResult({Key? key}) : super(key: key);
  final storeController = Get.put(StoreController());


  @override
  Widget build(BuildContext context) {
    List scandatalist = controller.barcoderesult.entries.toList();
    
    return Scaffold(
      appBar: AppBar(title: Text('Scan Result')),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
            scandatalist.length,
            (index) => Center(
                  child: SocialCard(
                    idkey: scandatalist[index].key,
                    idvalue: scandatalist[index].value,
                    icon: 'assets/${scandatalist[index].key}.png',
                  ),
                )),
      ),
    );
  }
}
