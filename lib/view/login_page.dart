import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:user_app/variables/colors.dart';
import 'package:user_app/variables/config.dart';
import 'package:user_app/view/create_account_page.dart';
import 'package:user_app/widgets/solid_button.dart';
import 'package:user_app/widgets/text_field_tile.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _password = TextEditingController(text: '');
  final TextEditingController _mobile = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyUI(),
    );
  }

  Widget _bodyUI()=>SafeArea(
    child: Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Clrs.themeColor.withOpacity(.1),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(dynamicSize(.07)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(dynamicSize(.04)),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(dynamicSize(.02)))
                ),
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [

                    Positioned(
                      top: -dynamicSize(.3),
                      child: Text('Log In',
                          style: TextStyle(color: Clrs.themeColor,fontSize: dynamicSize(.07),fontWeight: FontWeight.w500)),
                    ),

                    Positioned(
                      top: -dynamicSize(.15),
                      child: Container(
                        alignment: Alignment.center,
                        height: dynamicSize(.22),
                        width: dynamicSize(.22),
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffE2F5F1),width: 8),
                            shape: BoxShape.circle,
                            color: Colors.white),
                        child: Icon(LineAwesomeIcons.alternate_sign_in,
                          size: dynamicSize(.15),
                          color: Clrs.themeColor),
                      ),
                    ),

                    Column(children: [
                      SizedBox(height: dynamicSize(.1)),

                      TextFieldBuilder(controller: _mobile,hintText: 'Phone or Email',
                          prefixIcon: LineAwesomeIcons.phone,textInputType: TextInputType.emailAddress),
                      SizedBox(height: dynamicSize(.05)),

                      TextFieldBuilder(controller: _password,hintText:'Password',obscure: true,
                          prefixIcon: LineAwesomeIcons.key),
                      SizedBox(height: dynamicSize(.07)),

                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Don\'t have account? ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: dynamicSize(.04),
                            fontWeight: FontWeight.w400,
                          ),
                          children: <TextSpan>[
                            TextSpan(text: 'create account',
                                recognizer:  TapGestureRecognizer()..onTap=()=>Get.to(()=>const CreateAccountPage()),
                                style: const TextStyle(color: Clrs.themeColor,fontWeight: FontWeight.w500))
                          ],
                        ),
                      ),
                      SizedBox(height: dynamicSize(.07)),

                      SolidButton(
                        onPressed: ()=>Get.offAll(()=>const HomePage()),
                        child: Text('Submit',
                            style: TextStyle(color: Colors.white,fontSize: dynamicSize(.05),fontWeight: FontWeight.w500)),
                        borderRadius: dynamicSize(.1),
                        width: dynamicSize(.5),
                        height: dynamicSize(.12),
                      )
                    ],)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
