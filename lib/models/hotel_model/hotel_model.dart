class HotelModel{
 late String name ;
 late String location ;
 late String mainImage ;
 late String summary ;
 late String id ;
 late String rate ;
 late List photos ;

  HotelModel({
    required this.name,
    required this.location,
    required this.mainImage,
    required this.summary,
    required this.id,
    required this.rate,
    required this.photos,
});



  HotelModel.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'];
    location = json['location'];
    id = json['id'];
    mainImage = json['mainImage'];
    summary = json['summary'];
    rate = json['rate'];

    photos = json['photos'] as List;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['name'] = name;
    data['location'] = location;
    data['id'] = id;
    data['mainImage'] = mainImage;
    data['summary'] = summary;
    data['rate'] = rate;

    data['photos'] = photos ;
    return data;
  }



}


// List<HotelModel> hotelModel = [
//   HotelModel(
//     hotelimg:"assets/images/hotels1.jpg" ,
//     hotelLocation:"Barcelona, spain" ,
//     hotelName:"Grand Royal\nPark Hotel" ,
//     hotelPrice:  "    280\$\n/ per night",
//     hotelNumOfReviews:"80 Reviews" ,
//     hotelFarAway: "2km from city center",
//   ),
//   HotelModel(
//     hotelimg:"assets/images/hotels2.jpg" ,
//     hotelLocation:"Barcelona, spain" ,
//     hotelName:"Grand Royal\nPark Hotel" ,
//     hotelPrice:  "    280\$\n/ per night",
//     hotelNumOfReviews:"80 Reviews" ,
//     hotelFarAway: "2km from city center",
//
//   ),
// ] ;

// List<String> hotelImages = [
//   "assets/images/hotelsrooms1.jpg",
//   "assets/images/hotelsrooms2.jpg",
//   "assets/images/hotelsroom3.jpg",
// ] ;


