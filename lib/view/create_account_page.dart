import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:user_app/variables/colors.dart';
import 'package:user_app/variables/config.dart';
import 'package:user_app/view/home_page.dart';
import 'package:user_app/widgets/solid_button.dart';
import 'package:user_app/widgets/text_field_tile.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final TextEditingController _name = TextEditingController(text: '');
  final TextEditingController _email = TextEditingController(text: '');
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
                      child: Text('Create Account',
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
                        child: Icon(LineAwesomeIcons.user_plus,
                          size: dynamicSize(.15),
                          color: Clrs.themeColor,),
                      ),
                    ),

                    Column(children: [
                      SizedBox(height: dynamicSize(.1)),

                      TextFieldBuilder(controller: _name,hintText: 'Full Name',
                          prefixIcon: LineAwesomeIcons.user,textCapitalization: TextCapitalization.words),
                      SizedBox(height: dynamicSize(.05)),

                      TextFieldBuilder(controller: _email,hintText: 'Email Address',
                          prefixIcon: LineAwesomeIcons.envelope,textInputType: TextInputType.emailAddress,),
                      SizedBox(height: dynamicSize(.05)),

                      TextFieldBuilder(controller: _mobile,hintText: 'Phone',
                          prefixIcon: LineAwesomeIcons.phone,textInputType: TextInputType.number),
                      SizedBox(height: dynamicSize(.05)),

                      TextFieldBuilder(controller: _password,hintText:'Password',obscure: true,
                          prefixIcon: LineAwesomeIcons.key),
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
