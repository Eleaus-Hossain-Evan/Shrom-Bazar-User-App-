import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app/variables/colors.dart';
import 'package:user_app/variables/config.dart';
import 'package:user_app/variables/static_variables.dart';
import 'package:user_app/widgets/home_app_bar.dart';
import 'package:user_app/widgets/home_menu_tile.dart';
import 'package:user_app/widgets/home_page_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const HomePageDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: HomeAppBar(scaffoldKey: _scaffoldKey),
      ),
      body: _bodyUI(),
    );
  }

  Widget _bodyUI()=>SingleChildScrollView(
    physics: const ClampingScrollPhysics(),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: dynamicSize(.02)),
      child: Column(
        children: [
          ///Image Slider
          SizedBox(
            height: dynamicSize(.45),
            child: Carousel(
              dotBgColor: Colors.transparent,
              boxFit: BoxFit.cover,
              indicatorBgPadding: 5.0,
              dotIncreasedColor: Clrs.themeColor,
              dotIncreaseSize: 1.5,
              dotSize: 6,
              autoplayDuration: const Duration(seconds: 4),
              animationDuration: const Duration(seconds: 1),
              images: Variables.imageList.map((item) => CachedNetworkImage(
                imageUrl: item,
                fit: BoxFit.cover,
                placeholder: (context, url) => const CupertinoActivityIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              )).toList(),
            ),
          ),
          SizedBox(height: dynamicSize(.05)),

          GridView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const ClampingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: dynamicSize(.02),
                mainAxisSpacing: dynamicSize(.02),
                childAspectRatio: 1.2
            ),
            children: Variables.homeMenuDataList.map((item) => HomeMenuTile(menuModel: item)).toList(),
          )
        ],
      ),
    ),
  );
}
