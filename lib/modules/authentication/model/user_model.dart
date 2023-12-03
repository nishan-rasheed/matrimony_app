// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromJson(jsonString);

import 'dart:convert';


UserDataModel userDataModelFromJson(String str) => UserDataModel.fromJson(json.decode(str));

// List<UserDataModel> profileModelFromDocument(String str) => List<UserDataModel>.from(json.decode(str).map((x) => UserDataModel.fromDocumentSnapshot(x)));

String userDataModelToJson(UserDataModel data) => json.encode(data.toJson());

class UserDataModel {
    String? fullName;
    String? email;
    String? phoneNumber;
    String? job;
    String? gender;
    String? height;
    String? weight;
    String? age;
    String? country;
    String? state;
    String? city;
    String? address;
    String? familyInfo;
    String? image;

    UserDataModel({
        this.fullName,
        this.email,
        this.phoneNumber,
        this.job,
        this.gender,
        this.height,
        this.weight,
        this.age,
        this.country,
        this.state,
        this.city,
        this.address,
        this.familyInfo,
        this.image,
    });

    factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        fullName: json["fullName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        job: json["job"],
        gender: json["gender"],
        height: json["height"],
        weight: json["weight"],
        age: json["age"],
        country: json["country"],
        state: json["state"],
        city: json["city"],
        address: json["address"],
        familyInfo: json["familyInfo"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "email": email,
        "phoneNumber": phoneNumber,
        "job": job,
        "gender": gender,
        "height": height,
        "weight": weight,
        "age": age,
        "country": country,
        "state": state,
        "city": city,
        "address": address,
        "familyInfo": familyInfo,
        "image": image,
    };



    factory UserDataModel.fromMap(Map<String, dynamic> map){
      return UserDataModel(
        fullName: map['fullName'],
        email: map['email'],
        phoneNumber: map['phoneNumber'],
        job: map['password'],
        gender: map['gender'],
        height: map['height'],
        weight: map['weight'],
        age: map['age'],
        country: map['country'],
        state: map['state'],
        city: map['city'],
        address: map['address'],
        familyInfo: map['familyInfo'],
        image: map['image'],

      );
     }

}
