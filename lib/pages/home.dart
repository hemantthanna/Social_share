import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shareqr/pages/history.dart';
import 'package:shareqr/pages/profile.dart';
import 'package:shareqr/pages/scanresult.dart';
import '../controllers/storecontroller.dart';

class Home extends GetView<StoreController> {
  Home({Key? key}) : super(key: key);
  final storeController = Get.put(StoreController());

  Future<void> scanQR() async {
    // var _temp = jsonDecode(await FlutterBarcodeScanner.scanBarcode(
    //     '#ff6666', 'Cancel', true, ScanMode.QR));
    // if (_temp != -1) {
    //   controller.barcoderesult = _temp;
    //   Get.to(History());
    // }
    controller.barcoderesult = {
      "instagram": "thannahemant",
      "twitter": "hemantthanna",
      "phonenumber": "9340765396",
      "email": "Hemantthanna10@gmail.com"
    };
   
    Get.to(ScanResult());
  }

  @override
  Widget build(BuildContext context) {
    String shareabledata = '${controller.mydata.toString()}' ;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.purple, Colors.blue]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
            'Social Share',
            style: TextStyle(fontSize: 35),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(Profile());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(20)),
                        width: 150,
                        height: 120,
                        child: Column(
                          children: const [
                            Icon(
                              Icons.person,
                              size: 80,
                            ),
                            Text(
                              'My Profile',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(History());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(20)),
                        width: 150,
                        height: 120,
                        child: Column(
                          children: const [
                            Icon(
                              Icons.history,
                              size: 80,
                            ),
                            Text(
                              'History',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    // border: Border.all(color: Colors.blue, width: 10),
                  ),
                  child: QrImage(
                    data: shareabledata,
                    size: 270,
                    padding: const EdgeInsets.all(30),
                    semanticsLabel: 'Social Share',
                  ),
                ),
                InkWell(
                  onTap: () {
                    scanQR();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 100),
                    child: const Text(
                      'Scan QR code',
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
