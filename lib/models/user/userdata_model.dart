class UserSignUpMode {
String? firstName;
String? password;
String? email;
double? id;
String? image;

UserSignUpMode({ this.firstName, this.email, this.id, this.image,this.password});

UserSignUpMode.fromJson(Map<dynamic, dynamic> json) {
firstName = json['firstName'];
email = json['email'];
id = json['id'];
image = json['image'];
password = json['password'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data =  <String, dynamic>{};
data['firstName'] = firstName;
data['email'] = email;
data['id'] = id;
data['image'] = image;
data['password'] = password;
return data;
}
}
