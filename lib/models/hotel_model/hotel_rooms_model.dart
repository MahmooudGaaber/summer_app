import 'package:flutter/material.dart';
import 'package:summer_app/shared/app_style.dart';

class HotelRoomsModel {
  // late String hotelName  ;
  late String roomType ;
  late String roomPrice ;
  late String roomImage ;
  late String roomNumberofPeople ;



  HotelRoomsModel({
     // this.hotelName = "Grand Royal Hotel",
     required this.roomType,
     required this.roomPrice,
     required this.roomImage,
     required this.roomNumberofPeople,
});


  HotelRoomsModel.fromJson(Map<dynamic, dynamic> json) {
    roomType = json['roomType'];
    roomPrice = json['roomPrice'];
    roomImage = json['roomImage'];
    roomNumberofPeople = json['roomNumberofPeople'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['roomType'] = roomType;
    data['roomPrice'] = roomPrice;
    data['roomImage'] = roomImage;
    data['roomNumberofPeople'] = roomNumberofPeople;
    return data;
  }

}

// List<HotelRoomsModel> hotelRoomsModel = [
//   HotelRoomsModel(
//       roomPrice: '280\$',
//       roomPic: 'assets/images/hotelsrooms1.jpg',
//       roomType: 'Deluxe Rooms',
//       roomPeopleNum:"Fit 2 People" ,
//
//   ),
//   HotelRoomsModel(
//       roomPrice: '300\$',
//       roomPic: 'assets/images/hotelsrooms2.jpg',
//       roomType: 'Premium Rooms',
//     roomPeopleNum:"Fit 3 People" ,
//
//   ),
//   HotelRoomsModel(
//       roomPrice: '350\$',
//       roomPic: 'assets/images/hotelsroom3.jpg',
//       roomType: 'suite Rooms',
//     roomPeopleNum:"Fit 5 People" ,
//   ),
// ];