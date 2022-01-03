class HotelsDetailModels {
 String tripStart ;
 String tripEnd ;
 String numOfRooms ;
 String numOfPeople ;
 String hotelImg ;

 HotelsDetailModels({
   required this.numOfPeople,
   required this.numOfRooms,
   required this.tripEnd,
   required this.tripStart,
   required this.hotelImg,
});
}


List<HotelsDetailModels> hotelsDetailModels =
[
  HotelsDetailModels(numOfPeople: '2 Adults', tripEnd: '13 Dec', numOfRooms: '1 Room', tripStart: '12 Dec', hotelImg: 'assets/images/hotels1.jpg'),
  HotelsDetailModels(numOfPeople: '2 Adults', tripEnd: '24 Dec', numOfRooms: '1 Room', tripStart: '23 Dec', hotelImg: 'assets/images/hotels2.jpg'),
];