class UserModel {
  String? name;
  String? email;
  String? uId;
  String? image;

  UserModel({
    this.name,
    this.email,
    this.uId,
    this.image,
  });
  UserModel.fromJson(Map<String, dynamic> json){
    email = json['email'];
    name = json['name'];
    uId = json['uId'];
    image = json['image'];
  }
  Map<String, dynamic> ToMap()
  {
    return {
      'name': name,
      'email': email,
      'uId': uId,
      'image': image,
    };
  }
}
