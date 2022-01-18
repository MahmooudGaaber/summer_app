// class LastSearch {
//   String img ;
//   String city ;
//   String room ;
//   String date ;
//
//   LastSearch({
//     required this.img,
//     required this.city,
//     required this.date,
//     required this.room,
// });
// }
//
// List<LastSearch> lastSearch = [
//   LastSearch(
//     city: "London",
//     date:"22 Dec - 24 Dec" ,
//     img: "assets/images/city1.jpg",
//     room:"1 Room - Double" ,
//   ),
//   LastSearch(
//     city: "Paris",
//     date:"22 Dec - 24 Dec" ,
//     img: "assets/images/city2.jpg",
//     room:"1 Room - Double" ,
//   ),
//   LastSearch(
//     city: "Italy",
//     date:"22 Dec - 24 Dec" ,
//     img: "assets/images/city3.jpg",
//     room:"1 Room - Double" ,
//   ),
// ] ;
//
//


class SearchModel {
 late String userId;
 late String tripDate;
 late String numberOfRooms;
 late String hotelId;

  SearchModel({ required this.userId, required this.tripDate, required this.numberOfRooms, required this.hotelId});

  SearchModel.fromJson(Map<dynamic, dynamic> json) {
    userId = json['userId'];
    tripDate = json['tripDate'];
    numberOfRooms = json['numberOfRooms'];
    hotelId = json['hotelId'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['userId'] = userId;
    data['tripDate'] = tripDate;
    data['numberOfRooms'] = numberOfRooms;
    data['hotelId'] = hotelId;
    return data;
  }
}
