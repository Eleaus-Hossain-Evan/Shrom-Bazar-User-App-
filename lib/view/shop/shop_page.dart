import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/variables/config.dart';
import 'package:user_app/view/category/category_page.dart';
import 'package:user_app/view/shop/shop_category_view.dart';

import 'category/shop_category_page.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  bool _showSearchBar = false;
  final TextEditingController _searchController = TextEditingController();

  final List<String> shopCategoryLsit = [
    'Office',
    'Grocery shop',
    'Gyms',
    'Restaurant',
    'Hardware shop',
    'Bank',
    'Shopping mall',
    'Warehouse'
  ];

  final List<String> locationNumberList = [
    '3',
    '22',
    '50',
    '102',
    '3',
    '22',
    '50',
    '102',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
            child: _showSearchBar ? _searchBar() : _appBar()),
        body: _bodyUI(),
      ),
    );
  }

  /// body
  Widget _bodyUI() => ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: shopCategoryLsit.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => Get.to(
              () => ShopCategoryPage(
                categoryName: shopCategoryLsit[index],
                numberOfWorkers: int.parse(locationNumberList[index]),
              ),
            ),
            child: ShopCategoryView(
                shopRentCategory: shopCategoryLsit[index],
                numberOfLocation: locationNumberList[index]),
          );
        },
      );

  /// search bar
  Widget _searchBar() => Container(
        padding: EdgeInsets.symmetric(horizontal: dynamicSize(0.02)),
        color: Colors.green.withOpacity(0.2),
        height: AppBar().preferredSize.height,
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
                  if (_searchController.text.isEmpty) {
                    setState(() {
                      _showSearchBar = false;
                    });
                  } else {
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
        height: AppBar().preferredSize.height,
        color: Colors.green.withOpacity(0.2),
        child: Row(
          children: [
            IconButton(
              onPressed: () => Get.back(),
              icon: Icon(Icons.arrow_back,
                  color: Colors.black, size: dynamicSize(0.08)),
            ),
            Expanded(
              child: Text(
                'Shop',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: dynamicSize(.05),
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    _showSearchBar = true;
                  });
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: dynamicSize(0.08),
                ))
          ],
        ),
      );
}
