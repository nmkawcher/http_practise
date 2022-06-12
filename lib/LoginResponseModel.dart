

class LoginResponseModel {
  bool? result;
  String? message;
  int? id;
  String? type;
  String? name;
  String? email;
  dynamic avatar;
  String? avatarOriginal;
  String? phone;

  LoginResponseModel(
      {this.result,
        this.message,
        this.id,
        this.type,
        this.name,
        this.email,
        this.avatar,
        this.avatarOriginal,
        this.phone});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    id = json['id'];
    type = json['type'];
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
    avatarOriginal = json['avatar_original'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['message'] = this.message;
    data['id'] = this.id;
    data['type'] = this.type;
    data['name'] = this.name;
    data['email'] = this.email;
    data['avatar'] = this.avatar;
    data['avatar_original'] = this.avatarOriginal;
    data['phone'] = this.phone;
    return data;
  }
}