// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

List<ProfileModel> profileModelFromJson(String str) => List<ProfileModel>.from(json.decode(str).map((x) => ProfileModel.fromJson(x)));

String profileModelToJson(List<ProfileModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProfileModel {
    String? fullName;
    String? email;

    ProfileModel({
        this.fullName,
        this.email,
    });

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        fullName: json["fullName"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "email": email,
    };
}
