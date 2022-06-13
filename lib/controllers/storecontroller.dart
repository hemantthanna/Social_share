import 'package:get/get.dart';

// this class contains all the variables that we need to make observable

class StoreController extends GetxController {
  Map barcoderesult = {}.obs;
  Map mydata = {
    "instagram": "thannahemant",
    "twitter": "hemantthanna",
    "phonenumber": "9340765396",
    "email": "Hemantthanna10@gmail.com"
  }.obs;
}
