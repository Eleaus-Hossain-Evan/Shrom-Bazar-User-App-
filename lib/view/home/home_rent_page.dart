import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/variables/config.dart';
import 'package:user_app/view/home/home_view.dart';


class HomeRentPage extends StatefulWidget {
  const HomeRentPage({Key? key}) : super(key: key);

  @override
  _HomeRentPageState createState() => _HomeRentPageState();
}

class _HomeRentPageState extends State<HomeRentPage> {
  bool _showSearchBar = false;
  final TextEditingController _searchController = TextEditingController();

  final List<String> titleList = [
    '2 Bedrooms, 1 dinnings, 1 drawing, 1 kitchen, 2 toilets',
    '3 Bedrooms, 1 dinnings, 1 kitchen, 2 toilets',
    '2 Bedrooms, 1 dinnings, 1 kitchen, 2 toilets',
    '1 Bedrooms, 1 dinnings, 1 kitchen, 1 toilets',
  ];
  final List<String> imageLink = [
    'assets/room1.jpg',
    'assets/room2.jpg',
    'assets/room3.jpg',
    'assets/room4.png',
  ];
  final List<String> locationList = [
    'Sector- 12, Uttara, Dhaka',
    'Pallabi, Mirpur- 11, Dhaka',
    'Sector- 12, Uttara, Dhaka',
    'Pallabi, Mirpur- 11, Dhaka',
  ];
  final List<String> sizeList = [
    '1500',
    '1310',
    '900',
    '650',
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


  /// search bar
  Widget _searchBar() => Container(
    padding: EdgeInsets.symmetric(horizontal: dynamicSize(0.02)),
    color: Colors.deepPurple.withOpacity(0.2),
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

  /// body
  Widget _bodyUI() => ListView.builder(
    shrinkWrap: true,
    physics: const ClampingScrollPhysics(),
    itemCount: titleList.length,
    itemBuilder: (context, index){
      return HomeRentView(title: titleList[index], location: locationList[index], size: sizeList[index], imageList: imageLink);
    },
  );


  /// custom app bar
  Widget _appBar() => Container(
    padding: EdgeInsets.symmetric(horizontal: dynamicSize(0.02)),
    width: Get.width,
    height:  AppBar().preferredSize.height,
    color: Colors.deepPurple.withOpacity(0.2),
    child: Row(
      children: [
        IconButton(
          onPressed: (){

          },
          icon:  Icon(Icons.arrow_back, color: Colors.black,size: dynamicSize(0.08)),
        ),
        Expanded(
          child: Text(
            'Home Rent',
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
