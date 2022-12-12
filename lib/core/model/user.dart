class UserProfile {
  String? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? password;
  String? imageUrl;
  String? fcmToken;
  String? city;
  bool? isInstitution;

  UserProfile({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.password,
    this.imageUrl,
    this.city,
    this.fcmToken,
    this.isInstitution,
  });

  UserProfile.fromJson(Map<String, dynamic> json, this.id) {
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    fcmToken = json['fcmToken'];
    imageUrl = json['imageUrl'];
    city = json['city'];
    isInstitution = json['isInstitution'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['fcmToken'] = fcmToken;
    data['phoneNumber'] = phoneNumber;
    data['imageUrl'] = imageUrl;
    data['city'] = city;
    data['isInstitution'] = isInstitution ?? false;

    return data;
  }
}
