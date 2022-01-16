import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:user_app/variables/colors.dart';
import 'package:user_app/variables/config.dart';
import 'package:user_app/view/account_page.dart';
import 'package:user_app/view/login_page.dart';

class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Material(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(dynamicSize(.02)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ///Profile Image
                  Container(
                    height: dynamicSize(.22),
                    width: dynamicSize(.22),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Clrs.themeColor.withOpacity(0.2)
                    ),
                    child: Icon(Icons.person,color: Clrs.themeColor,size: dynamicSize(.2)),
                  ),
                  SizedBox(height: dynamicSize(.04)),

                  ///Name Email
                  RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.grey.shade700,fontSize: dynamicSize(.04)),
                      children: <TextSpan>[
                        TextSpan(text: 'Mijanur Rahman Milon\n',
                            style: TextStyle(fontWeight: FontWeight.bold,color: Clrs.textColor,fontSize: dynamicSize(.05))),
                        const TextSpan(text: 'milon99887@gmail.com\n'),
                        const TextSpan(text: '+88001404460052'),
                      ],
                    ),
                  ),
                  SizedBox(height: dynamicSize(.04)),
                  const Divider(color: Colors.grey,thickness: 1),
                  SizedBox(height: dynamicSize(.04)),

                  ///Buttons
                  DrawerButton(
                      leading: LineAwesomeIcons.user_plus,
                      title: 'Create Account',
                      onTap: ()=>Get.to(()=>const LoginPage())),
                  DrawerButton(
                      leading: LineAwesomeIcons.search,
                      title: 'Search Worker',
                      onTap: (){}),
                  DrawerButton(
                      leading: LineAwesomeIcons.taxi,
                      title: 'Car Search',
                      onTap: (){}),
                  DrawerButton(
                      leading: LineAwesomeIcons.home,
                      title: 'Home Search',
                      onTap: (){}),
                  DrawerButton(
                      leading: LineAwesomeIcons.alternate_store,
                      title: 'Shop Search',
                      onTap: (){}),
                  DrawerButton(
                      leading: LineAwesomeIcons.user,
                      title: 'Account',
                      onTap: ()=>Get.to(()=>const AccountPage())),
                  DrawerButton(
                      leading: LineAwesomeIcons.info_circle,
                      title: 'About',
                      onTap: (){}),
                  DrawerButton(
                      leading: LineAwesomeIcons.phone,
                      title: 'Contact',
                      onTap: (){}),
                  DrawerButton(
                      leading: LineAwesomeIcons.gavel,
                      title: 'Terms & Condition',
                      onTap: (){}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DrawerButton extends StatelessWidget {
  const DrawerButton({Key? key, required this.leading, required this.title, required this.onTap})
      : super(key: key);
  final IconData leading;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: dynamicSize(.04)),
      decoration: BoxDecoration(
        color:  Clrs.themeColor.withOpacity(0.1),
        borderRadius: BorderRadius.all(Radius.circular(dynamicSize(.03))),
      ),
      child: ListTile(
        leading: Icon(leading,color: Clrs.themeColor,size: dynamicSize(.07)),
        title: Text(title,style: TextStyle(fontSize: dynamicSize(.045),color: Clrs.textColor)),
        onTap: onTap,
        trailing: Icon(CupertinoIcons.right_chevron,color: Clrs.textColor,size: dynamicSize(.06)),
        dense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: dynamicSize(.04),vertical: dynamicSize(.01)),
        horizontalTitleGap: dynamicSize(.02),
      ),
    );
  }
}

