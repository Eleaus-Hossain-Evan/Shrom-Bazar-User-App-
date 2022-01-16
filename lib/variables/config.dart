import 'package:user_app/controller/data_controller.dart';

double dynamicSize(double size){
  return DataController.dc.size.value*size;
}