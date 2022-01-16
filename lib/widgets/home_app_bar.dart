import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:user_app/variables/config.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key,required this.scaffoldKey}) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: dynamicSize(0.04),vertical: dynamicSize(0.03)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: ()=> scaffoldKey.currentState!.openDrawer(),
              child: Icon(LineAwesomeIcons.bars,color:Colors.grey.shade800,size: dynamicSize(0.08))),
            SizedBox(width: dynamicSize(0.03)),
            Expanded(
              child: InkWell(
                onTap: (){},
                child: Container(
                  padding: EdgeInsets.all(dynamicSize(0.02)),
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(dynamicSize(0.1))),
                  border: Border.all(color: Colors.grey)),
                  child: Text('Search Here...',
                      style: TextStyle(color: Colors.grey,fontSize: dynamicSize(.04))),
                ),
                borderRadius: BorderRadius.all(Radius.circular(dynamicSize(0.1))),
              ),
            ),
            SizedBox(width: dynamicSize(0.03)),
            InkWell(
              onTap: (){},
              child: Icon(LineAwesomeIcons.bell,color:Colors.grey.shade800,size: dynamicSize(0.08))),
          ],
        ),
      ),
    );
  }
}
