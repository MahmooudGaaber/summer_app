class TestModel {
 late String image;
 late String name;
 late String price;
 late String date;
 late String people;
 late String rooms;
 late String location;

  TestModel({
    required this.location,
    required this.name,
    required this.price,
    required this.date,
    required this.image,
    required this.people ,
    required this.rooms
  });

  TestModel.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'];
    price = json['price'];
    date = json['date'];
    image = json['image'];
    people = json['people'];
    rooms = json['rooms'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['name'] = name;
    data['price'] = price;
    data['date'] = date;
    data['image'] = image;
    data['people'] = people;
    data['rooms'] = rooms;
    data['location'] = location;
    return data;
  }
}
