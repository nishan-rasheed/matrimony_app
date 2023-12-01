// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromJson(jsonString);

import 'dart:convert';

UserDataModel userDataModelFromJson(String str) => UserDataModel.fromJson(json.decode(str));

String userDataModelToJson(UserDataModel data) => json.encode(data.toJson());

class UserDataModel {
    String? fullName;
    String? email;
    String? phoneNumber;
    String? password;
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
        this.password,
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
        password: json["password"],
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
        "password": password,
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
}
