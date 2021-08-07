// To parse this JSON data, do
//
//     final employeeInformationModel = employeeInformationModelFromJson(jsonString);

import 'dart:convert';

List<EmployeeInformation> employeeInformationModelFromJson(String str) => List<EmployeeInformation>.from(json.decode(str).map((x) => EmployeeInformation.fromJson(x)));

String employeeInformationModelToJson(List<EmployeeInformation> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//class EmployeeInfoModel{
//  List<EmployeeInformation> employeeInformation;
//  EmployeeInfoModel({this.employeeInformation});
//
//  factory EmployeeInfoModel.fromJson(Map<String, dynamic> json) => EmployeeInfoModel(
//    employeeInformation: List<dynamic>.from(json.map((x) => x.toJson()))
//  );
//
//}
class EmployeeInformation {
  EmployeeInformation({
    this.id,
    this.name,
    this.username,
    this.email,
    this.profileImage,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  int id;
  String name;
  String username;
  String email;
  String profileImage;
  Address address;
  String phone;
  String website;
  Company company;

  factory EmployeeInformation.fromJson(Map<String, dynamic> json) => EmployeeInformation(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    profileImage: json["profile_image"] == null ? null : json["profile_image"],
    address: Address.fromJson(json["address"]),
    phone: json["phone"] == null ? null : json["phone"],
    website: json["website"] == null ? null : json["website"],
    company: json["company"] == null ? null : Company.fromJson(json["company"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "email": email,
    "profile_image": profileImage == null ? null : profileImage,
    "address": address.toJson(),
    "phone": phone == null ? null : phone,
    "website": website == null ? null : website,
    "company": company == null ? null : company.toJson(),
  };
}

class Address {
  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    street: json["street"],
    suite: json["suite"],
    city: json["city"],
    zipcode: json["zipcode"],
    geo: Geo.fromJson(json["geo"]),
  );

  Map<String, dynamic> toJson() => {
    "street": street,
    "suite": suite,
    "city": city,
    "zipcode": zipcode,
    "geo": geo.toJson(),
  };
}

class Geo {
  Geo({
    this.lat,
    this.lng,
  });

  String lat;
  String lng;

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
    lat: json["lat"],
    lng: json["lng"],
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lng": lng,
  };
}

class Company {
  Company({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  String name;
  String catchPhrase;
  String bs;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    name: json["name"],
    catchPhrase: json["catchPhrase"],
    bs: json["bs"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "catchPhrase": catchPhrase,
    "bs": bs,
  };
}
