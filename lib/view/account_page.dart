import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:user_app/variables/colors.dart';
import 'package:user_app/variables/config.dart';
import 'package:user_app/widgets/solid_button.dart';
import 'package:user_app/widgets/text_field_tile.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final TextEditingController _name = TextEditingController(text: '');
  final TextEditingController _email = TextEditingController(text: '');
  final TextEditingController _password = TextEditingController(text: '');
  final TextEditingController _mobile = TextEditingController(text: '');
  final TextEditingController _address = TextEditingController(text: '');
  final TextEditingController _purpose = TextEditingController(text: '');
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyUI(),
    );
  }

  Widget _bodyUI()=>SafeArea(
    child: Column(
      children: [
        ///Header Section
        Stack(
          alignment: Alignment.center,
          //clipBehavior: Clip.none,
          children: [

            Container(height: dynamicSize(.6)),

            ///Gradient background
            Positioned(
              top: 0.0,
              child: Container(
                height: dynamicSize(.4),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Clrs.themeColor, Clrs.themeColor.withOpacity(.5)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                  )
                ),
              ),
            ),

            ///Back Button
            Positioned(
              left: dynamicSize(.02),
              top: dynamicSize(.02),
              child: InkWell(
                onTap: ()=>Get.back(),
                child: Icon(LineAwesomeIcons.arrow_left,color: Colors.white,size: dynamicSize(.06)),
              ),
            ),

            ///Profile Image
            Positioned(
              top: dynamicSize(.22),
              left: dynamicSize(.02),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ///Image
                  Container(
                    alignment: Alignment.center,
                    height: dynamicSize(.35),
                    width: dynamicSize(.35),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white,width: 5),
                        shape: BoxShape.circle,
                        color: Colors.blueGrey.shade100),
                    child: _imageFile!=null?
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(dynamicSize(.3))),
                          child: Image.file(_imageFile!, height: dynamicSize(.35),
                              width: dynamicSize(.35),fit: BoxFit.cover),
                        ) : Icon(Icons.person,
                        size: dynamicSize(.3),
                        color: Clrs.themeColor),
                  ),
                  ///Edit Button
                  Positioned(
                    right: dynamicSize(.005),
                    bottom: dynamicSize(.07),
                    child: GestureDetector(
                      onTap: ()=>_getImage(),
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(color: Colors.blueGrey.shade100)
                        ),
                        child: Icon(LineAwesomeIcons.pen,size: dynamicSize(.05),color: Clrs.themeColor),
                      ),
                    ),
                  )
                ],
              ),
            ),

            ///user Full Name
            Positioned(
              right: 0.0,
              top: dynamicSize(.3),
              child: SizedBox(
                width: dynamicSize(.55),
                child: Text('Mojanur Rahman Milon',maxLines: 2,style: TextStyle(
                 color: Colors.white,
                 fontWeight: FontWeight.w500,
                  fontSize: dynamicSize(.05)
                )),
              ),
            ),

            ///Email & Number
            Positioned(
              right: dynamicSize(.03),
              bottom: dynamicSize(.07),
              child: SizedBox(
                width: dynamicSize(.55),
                child: RichText(
                  textAlign:TextAlign.end,
                  text: TextSpan(
                    style: TextStyle(color: Colors.grey.shade700,fontSize: dynamicSize(.04)),
                    children:const <TextSpan>[
                      TextSpan(text: 'milon99887@gmail.com\n'),
                      TextSpan(text: '+88001404460052'),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),

        ///Body.....
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(dynamicSize(.04)),
              child: Column(
                children: [

                  TextFieldBuilder(controller: _name,labelText: 'Full Name',
                      prefixIcon: LineAwesomeIcons.user,textCapitalization: TextCapitalization.words),
                  SizedBox(height: dynamicSize(.04)),

                  TextFieldBuilder(controller: _email,labelText: 'Email Address',
                    prefixIcon: LineAwesomeIcons.envelope,textInputType: TextInputType.emailAddress,),
                  SizedBox(height: dynamicSize(.04)),

                  TextFieldBuilder(controller: _mobile,labelText: 'Phone',
                      prefixIcon: LineAwesomeIcons.phone,textInputType: TextInputType.number),
                  SizedBox(height: dynamicSize(.04)),

                  TextFieldBuilder(controller: _address,labelText: 'Address',
                      prefixIcon: LineAwesomeIcons.alternate_map_marker,textInputType: TextInputType.number),
                  SizedBox(height: dynamicSize(.04)),

                  TextFieldBuilder(controller: _purpose,labelText: 'Purpose',
                      prefixIcon: LineAwesomeIcons.question,textInputType: TextInputType.number),
                  SizedBox(height: dynamicSize(.04)),

                  TextFieldBuilder(controller: _password,labelText:'Password',obscure: true,
                      prefixIcon: LineAwesomeIcons.key),
                  SizedBox(height: dynamicSize(.07)),

                  SolidButton(
                    onPressed: (){},
                    child: Text('Update',
                        style: TextStyle(color: Colors.white,fontSize: dynamicSize(.05),fontWeight: FontWeight.w500)),
                    borderRadius: dynamicSize(.1),
                    width: dynamicSize(.5),
                    height: dynamicSize(.12),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ),
  );

  void _getImage()async{
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if(image!=null){
      setState(()=> _imageFile=File(image.path));
    }
  }
}
