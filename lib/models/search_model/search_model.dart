class LastSearch {
  String img ;
  String city ;
  String room ;
  String date ;

  LastSearch({
    required this.img,
    required this.city,
    required this.date,
    required this.room,
});
}

List<LastSearch> lastSearch = [
  LastSearch(
    city: "London",
    date:"22 Dec - 24 Dec" ,
    img: "assets/images/city1.jpg",
    room:"1 Room - Double" ,
  ),
  LastSearch(
    city: "Paris",
    date:"22 Dec - 24 Dec" ,
    img: "assets/images/city2.jpg",
    room:"1 Room - Double" ,
  ),
  LastSearch(
    city: "Italy",
    date:"22 Dec - 24 Dec" ,
    img: "assets/images/city3.jpg",
    room:"1 Room - Double" ,
  ),
] ;


