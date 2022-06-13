import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/storecontroller.dart';

class Profile extends GetView<StoreController> {
  Profile({Key? key}) : super(key: key);
  final storeController = Get.put(StoreController());

  @override
  Widget build(BuildContext context) {
    List mydatalist = controller.mydata.entries.toList();

    return Scaffold(
      appBar: AppBar(title: Text('Visible Social Profiles')),
      body: Column(
        children: [
          /////////////////////////////////
          Column(children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: ListView.builder(
                  itemCount: mydatalist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ExpansionTile(
                        tilePadding: EdgeInsets.only(left: 10),
                        childrenPadding: EdgeInsets.symmetric(horizontal: 10),
                        trailing: const SizedBox(),
                        title: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                child: Image(
                                  fit: BoxFit.contain,
                                  image: AssetImage(
                                      'assets/${mydatalist[index].key}.png'),
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    mydatalist[index].key,
                                    style: const TextStyle(fontSize: 25),
                                  ),
                                  Text(
                                    mydatalist[index].value,
                                    style: const TextStyle(
                                        fontSize: 13,
                                        overflow: TextOverflow.ellipsis),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    String? newvalue = mydatalist[index].value;
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Center(
                                            child: Container(
                                              height: 300,
                                              width: 300,
                                              color: Colors.amber,
                                              child: Column(
                                                children: [
                                                  Text(
                                                      'Enter ${mydatalist[index].key} profile'),
                                                  Material(
                                                    child: TextFormField(
                                                        initialValue: newvalue,
                                                        onChanged: (value) {
                                                          newvalue = value;
                                                          // print(newvalue);
                                                        }),
                                                  ),
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        controller.mydata[
                                                                mydatalist[
                                                                        index]
                                                                    .key] =
                                                            newvalue;
                                                        print(controller.mydata[
                                                            mydatalist[index]
                                                                .key]);
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text('done')),
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  child: Text('edit')),
                              ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Container(
                                            child: Column(children: [
                                              Text(
                                                  'are you sure you want to remove it '),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    controller.mydata.remove(
                                                        mydatalist[index].key);
                                                    Navigator.pop(context);
                                                    Get.back();
                                                    Get.to(Profile());
                                                  },
                                                  child: Text('remove')),
                                            ]),
                                          );
                                        });
                                  },
                                  child: Text('remove')),
                            ],
                          ),
                        ]);
                  }),
            )
          ]),
          ///////////////////////////////////
          ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Center(
                        child: Container(
                          height: 600,
                          width: 350,
                          child: Material(
                            color: Colors.amber,
                            child: Column(
                              children: [
                                Text(
                                  'Add a Social',
                                  style: TextStyle(fontSize: 50),
                                ),
                              //   Container(
                              //   height: 60,
                              //   width: 60,
                              //   child: Image(
                              //     fit: BoxFit.contain,
                              //     image: AssetImage(
                              //         'assets/${mydatalist[index].key}.png'),
                              //   ),
                              // ),
                              GridView.builder(gridDelegate: gridDelegate, itemBuilder: itemBuilder)
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
              child: Text('Add More'),
              style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size(500, 50))))
        ],
      ),
    );
  }
}
