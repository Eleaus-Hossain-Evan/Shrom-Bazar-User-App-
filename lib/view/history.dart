import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/variables/colors.dart';
import 'package:user_app/variables/config.dart';
import 'package:user_app/view/history_tab/car_history.dart';
import 'package:user_app/view/history_tab/home_rent_history.dart';
import 'package:user_app/view/history_tab/shop_history.dart';
import 'package:user_app/view/history_tab/worker_history.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60.0), child: _appBar()),
        body: _bodyUI(),
      ),
    );
  }

  /// body
  Widget _bodyUI() => DefaultTabController(
      length: 4,
      child: Column(
        children:  [
          TabBar(
              labelColor: Colors.green,
              unselectedLabelColor: Colors.black,
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: dynamicSize(.04)),
              labelStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: dynamicSize(.04)),
              tabs: const [
                Tab(
                  text: 'Worker',
                ),
                Tab(
                  text: 'Shop',
                ),
                Tab(
                  text: 'Car',
                ),
                Tab(
                  text: 'Home',
                )
              ]),
          Expanded(
            child: TabBarView(children: [
              WorkerHistory(),
              ShopHistory(),
              CarHistory(),
              HomeRentHistory()
            ]),
          )
        ],
      ));

  /// custom app bar
  Widget _appBar() => Container(
        padding: EdgeInsets.symmetric(horizontal: dynamicSize(0.02)),
        width: Get.width,
        height: AppBar().preferredSize.height,
        color: Clrs.themeColor.withOpacity(0.1),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back,
                  color: Colors.black, size: dynamicSize(0.08)),
            ),
            SizedBox(
              width: dynamicSize(0.04),
            ),
            Expanded(
              child: Text(
                'History',
                style: TextStyle(
                    fontSize: dynamicSize(.05),
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      );
}
