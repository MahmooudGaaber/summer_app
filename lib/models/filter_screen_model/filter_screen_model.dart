import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterScreenCheckBoxModel
{
  late String checkBoxTittle ;
  bool checkBoxValue  ;

  FilterScreenCheckBoxModel({
    required this.checkBoxTittle,
    required this.checkBoxValue,
});
}

List<FilterScreenCheckBoxModel> filterScreenCheckBoxModel = [
  FilterScreenCheckBoxModel(checkBoxTittle: "Free Breakfast" , checkBoxValue : false ),
  FilterScreenCheckBoxModel(checkBoxTittle: "Free Parking", checkBoxValue : false),
  FilterScreenCheckBoxModel(checkBoxTittle: "Pool", checkBoxValue : false),
  FilterScreenCheckBoxModel(checkBoxTittle: "Pet Friendly", checkBoxValue : false),
  FilterScreenCheckBoxModel(checkBoxTittle: "Free Wifi", checkBoxValue : false),
] ;



class FilterScreenSwitchModel
{
  late String switchTittle ;
   bool switchValue ;

  FilterScreenSwitchModel({
    required this.switchTittle,
    required this.switchValue,
});
}

List<FilterScreenSwitchModel> filterScreenSwitchModel = [
  FilterScreenSwitchModel(switchTittle:  "All" , switchValue:  true ),
  FilterScreenSwitchModel(switchTittle: "Apartment", switchValue : false),
  FilterScreenSwitchModel(switchTittle: "Home", switchValue : false),
  FilterScreenSwitchModel(switchTittle: "Villa", switchValue : false),
  FilterScreenSwitchModel(switchTittle: "Hotels", switchValue : false),
  FilterScreenSwitchModel(switchTittle: "Resorts", switchValue : false),
] ;