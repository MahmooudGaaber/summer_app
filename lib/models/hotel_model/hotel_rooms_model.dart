import 'package:flutter/material.dart';
import 'package:summer_app/shared/app_style.dart';

class HotelRoomsModel {
  // late String hotelName  ;
  late String roomType ;
  late String roomPrice ;
  late String roomPic ;
  late String roomPeopleNum ;



  HotelRoomsModel({
     // this.hotelName = "Grand Royal Hotel",
    required this.roomType,
    required this.roomPrice,
    required this.roomPic,
    required this.roomPeopleNum,

});
}

List<HotelRoomsModel> hotelRoomsModel = [
  HotelRoomsModel(
      roomPrice: '280\$',
      roomPic: 'assets/images/hotelsrooms1.jpg',
      roomType: 'Deluxe Rooms',
      roomPeopleNum:"Fit 2 People" ,

  ),
  HotelRoomsModel(
      roomPrice: '300\$',
      roomPic: 'assets/images/hotelsrooms2.jpg',
      roomType: 'Premium Rooms',
    roomPeopleNum:"Fit 3 People" ,

  ),
  HotelRoomsModel(
      roomPrice: '350\$',
      roomPic: 'assets/images/hotelsroom3.jpg',
      roomType: 'suite Rooms',
    roomPeopleNum:"Fit 5 People" ,
  ),
];