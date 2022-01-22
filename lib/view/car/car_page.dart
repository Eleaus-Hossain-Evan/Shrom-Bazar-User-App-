import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/variables/config.dart';
import 'package:user_app/view/car/car_category_view.dart';

class CarPage extends StatefulWidget {
  const CarPage({Key? key}) : super(key: key);

  @override
  _CarPageState createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {
  bool _showSearchBar = false;
  final TextEditingController _searchController = TextEditingController();

  final List<String> carCategoryList = [
    'Small Package',
    'Family Package',
    'Mini Bus',
    'Jeep',
    'Caravan'
  ];

  final List<String> imageList = [
    'assets/car_4_seat_icon.png',
    'assets/car_8_seat_icon.png',
    'assets/mini_bus_icon.png',
    'assets/jeep_4_seat_icon.png',
    'assets/caravan_icon.png'
  ];

  final List<String> seatList = [
    '4',
    '8',
    '16',
    '4',
    '1'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60.0), child: _showSearchBar? _searchBar() : _appBar()),

        body: _bodyUI(),
      ),
    );
  }

  /// body
  Widget _bodyUI() => ListView.builder(
    shrinkWrap: true,
    physics: const ClampingScrollPhysics(),
    itemCount: carCategoryList.length,
    itemBuilder: (context, index){
      return CarCategoryView(carCategoryName: carCategoryList[index], numberOfSeat: seatList[index], amount: '1200', imageLink: imageList[index]);
    },
  );


  /// search bar
  Widget _searchBar() => Container(
    padding: EdgeInsets.symmetric(horizontal: dynamicSize(0.02)),
    color: Colors.cyan.withOpacity(0.2),
    height:  AppBar().preferredSize.height,
    width: Get.width,
    child: Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: _searchController,
            cursorColor: Colors.black,
            autofocus: true,
            style: TextStyle(fontSize: dynamicSize(.04)),
            decoration: InputDecoration(
                hintText: 'Search',
                contentPadding: EdgeInsets.only(top: dynamicSize(0.04)),
                hintStyle: TextStyle(fontSize: dynamicSize(.04)),
                prefixIcon: Icon(Icons.search,
                    color: Colors.black, size: dynamicSize(.08)),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none),
          ),
        ),

        IconButton(
            onPressed: () {
              if(_searchController.text.isEmpty){
                setState(() {
                  _showSearchBar = false;
                });
              }else{
                setState(() {
                  _searchController.clear();
                });
              }
            },
            icon: Icon(Icons.close,
                color: Colors.black, size: dynamicSize(.08)))
      ],
    ),
  );


  /// custom app bar
  Widget _appBar() => Container(
    padding: EdgeInsets.symmetric(horizontal: dynamicSize(0.02)),
    width: Get.width,
    height:  AppBar().preferredSize.height,
    color: Colors.cyan.withOpacity(0.2),
    child: Row(
      children: [
        IconButton(
          onPressed: (){

          },
          icon:  Icon(Icons.arrow_back, color: Colors.black,size: dynamicSize(0.08)),
        ),
        Expanded(
          child: Text(
            'Car',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: dynamicSize(.05),
                color: Colors.black,
                fontWeight: FontWeight.w500),
          ),
        ),
        IconButton(onPressed: (){
          setState(() {
            _showSearchBar = true;
          });
        }, icon: Icon(Icons.search, color: Colors.black, size: dynamicSize(0.08),))
      ],
    ),
  );
}
