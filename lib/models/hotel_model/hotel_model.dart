class HotelModel{
  String hotelName ;
  String hotelPrice ;
  String hotelLocation ;
  String hotelFarAway ;
  String hotelNumOfReviews ;
  String hotelimg ;

  HotelModel({
    required this.hotelName,
    required this.hotelLocation,
    required this.hotelNumOfReviews,
    required this.hotelPrice,
    required this.hotelimg,
    required this.hotelFarAway,
});
}


List<HotelModel> hotelModel = [
  HotelModel(
    hotelimg:"assets/images/hotels1.jpg" ,
    hotelLocation:"Barcelona, spain" ,
    hotelName:"Grand Royal\nPark Hotel" ,
    hotelPrice:  "    280\$\n/ per night",
    hotelNumOfReviews:"80 Reviews" ,
    hotelFarAway: "2km from city center",
  ),
  HotelModel(
    hotelimg:"assets/images/hotels2.jpg" ,
    hotelLocation:"Barcelona, spain" ,
    hotelName:"Grand Royal\nPark Hotel" ,
    hotelPrice:  "    280\$\n/ per night",
    hotelNumOfReviews:"80 Reviews" ,
    hotelFarAway: "2km from city center",

  ),
] ;

List<String> hotelImages = [
  "assets/images/hotelsrooms1.jpg",
  "assets/images/hotelsrooms2.jpg",
  "assets/images/hotelsroom3.jpg",
] ;
