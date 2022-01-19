class UserModel {
  late String firstName;
  late String email;
  late String lastname;
  late String id;

UserModel({
  required this.firstName,
  required this.email,
  required this.lastname,
  required this.id,
});

UserModel.fromJson(Map<dynamic, dynamic> json) {
firstName = json['firstName'];
email = json['email'];
lastname = json['lastname'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data =  <String, dynamic>{};
data['firstName'] = firstName;
data['email'] = email;
data['lastname'] = lastname;
return data;
}
}
