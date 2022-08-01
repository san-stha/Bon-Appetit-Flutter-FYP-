import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:fyp/controller/reward_item_controller.dart';
import 'package:get/get.dart';

class RewardPage extends StatefulWidget {
  const RewardPage({Key? key}) : super(key: key);

  @override
  State<RewardPage> createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage> {
    var ri = Get.put(RewardItemController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(8, 0, 49, 1),
          title: const Text("Reward"),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, 'dashboard');
            },
            icon: Icon(Icons.close),
          ),
        ),
        body: GestureDetector(
          onTap: () {},
          child: FortuneWheel(
            styleStrategy: UniformStyleStrategy(
              color: Colors.green,
              borderColor: Color.fromRGBO(8, 0, 49, 1),
              borderWidth: 3,
            ),
            items: [
              // FortuneItem(
              //   child: ListView.builder(
              //     shrinkWrap: true,
              //     itemCount: ri.rewardItemList.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       return Text(ri.rewardItemList[index].name.toString());
              //     },
              //   ),
              // )

              FortuneItem(child: Text('11')),
              FortuneItem(child: Text('12')),
              FortuneItem(child: Text('10')),
              FortuneItem(child: Text('11')),
              FortuneItem(child: Text('12')),
              FortuneItem(child: Text('10')),
              FortuneItem(child: Text('11')),
              FortuneItem(child: Text('12')),
              
            ],
          ),
        ),
      ),
    );
  }
}
