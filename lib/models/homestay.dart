import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class HomestayModel {
  String title;
  String homestayType;
  String area;
  int maxGuests;
  int bedrooms;
  int singleBed;
  int doubleBed;
  int extraFloorMat;
  int bathrooms;
  bool isKitchen;
  List<dynamic> amenities;
  Duration checkInTime;
  Duration checkOutTime;
  bool isCheckInFlexible;
  bool isCheckOutFlexible;
  double latitude;
  double longitude;
  String address;
  String streetAddress;
  String landmark;
  String city;
  int pincode;
  String state;
  bool isLocationSpecific;
  String coverPhoto;
  List<dynamic> photos;
  String description;
  double startPrice;
  double endPrice;
  int ownerContactNo;
  String ownerEmail;
  int homestayContactNo;
  String homestayEmail;
  String? id;
  String userId;

  HomestayModel({
    required this.title,
    required this.homestayType,
    required this.area,
    required this.maxGuests,
    required this.bedrooms,
    required this.singleBed,
    required this.doubleBed,
    required this.extraFloorMat,
    required this.bathrooms,
    required this.isKitchen,
    required this.amenities,
    required this.checkInTime,
    required this.checkOutTime,
    required this.isCheckInFlexible,
    required this.isCheckOutFlexible,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.streetAddress,
    required this.landmark,
    required this.city,
    required this.pincode,
    required this.state,
    required this.isLocationSpecific,
    required this.photos,
    required this.coverPhoto,
    required this.description,
    required this.startPrice,
    required this.endPrice,
    required this.ownerContactNo,
    required this.ownerEmail,
    required this.homestayContactNo,
    required this.homestayEmail,
    this.id,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'homestayType': homestayType,
      'area': area,
      'maxGuests': maxGuests,
      'bedrooms': bedrooms,
      'singleBed': singleBed,
      'doubleBed': doubleBed,
      'extraFloorMat': extraFloorMat,
      'bathrooms': bathrooms,
      'isKitchen': isKitchen,
      'amenities': amenities,
      'checkInTime': {
        'hours': checkInTime.inHours,
        'minutes': checkInTime.inMinutes.remainder(60),
      },
      'checkOutTime': {
        'hours': checkOutTime.inHours,
        'minutes': checkOutTime.inMinutes.remainder(60),
      },
      'isCheckInFlexible': isCheckInFlexible,
      'isCheckOutFlexible': isCheckOutFlexible,
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
      'streetAddress': streetAddress,
      'landmark': landmark,
      'city': city,
      'pincode': pincode,
      'state': state,
      'isLocationSpecific': isLocationSpecific,
      'photos': photos,
      'coverPhoto': coverPhoto,
      'description': description,
      'startPrice': startPrice,
      'endPrice': endPrice,
      'ownerContactNo': ownerContactNo,
      'ownerEmail': ownerEmail,
      'homestayContactNo': homestayContactNo,
      'homestayEmail': homestayEmail,
      'id': id,
      'userId': userId,
    };
  }

  factory HomestayModel.fromMap(Map<String, dynamic> map) {
    return HomestayModel(
      title: map['title'] as String,
      homestayType: map['homestayType'] as String,
      area: map['area'] as String,
      maxGuests: map['maxGuests'] as int,
      bedrooms: map['bedrooms'] as int,
      singleBed: map['singleBed'] as int,
      doubleBed: map['doubleBed'] as int,
      extraFloorMat: map['extraFloorMat'] as int,
      bathrooms: map['bathrooms'] as int,
      isKitchen: map['isKitchen'] as bool,
      amenities: List<String>.from((map['amenities'] as List<dynamic>)),
      checkInTime: Duration(
        hours: map['checkInTime']['hours'],
        minutes: map['checkInTime']['minutes'],
      ),
      checkOutTime: Duration(
        hours: map['checkOutTime']['hours'],
        minutes: map['checkOutTime']['minutes'],
      ),
      isCheckInFlexible: map['isCheckInFlexible'] as bool,
      isCheckOutFlexible: map['isCheckOutFlexible'] as bool,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      address: map['address'] as String,
      streetAddress: map['streetAddress'] as String,
      landmark: map['landmark'] as String,
      city: map['city'] as String,
      pincode: map['pincode'] as int,
      state: map['state'] as String,
      isLocationSpecific: map['isLocationSpecific'] as bool,
      photos: List<String>.from((map['photos'] as List<dynamic>)),
      coverPhoto: (map['coverPhoto'] == null)
          ? 'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW50ZXJpb3IlMjBkZXNpZ258ZW58MHx8MHx8fDA%3D'
          : map['coverPhoto'] as String,
      description: map['description'] as String,
      startPrice: (map['startPrice'] ?? 0).toDouble(),
      endPrice: (map['endPrice'] ?? 0).toDouble(),
      ownerContactNo: map['ownerContactNo'] as int,
      ownerEmail: map['ownerEmail'] as String,
      homestayContactNo: map['homestayContactNo'] as int,
      homestayEmail: map['homestayEmail'] as String,
      id: map['_id'] as String,
      userId: map['userId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HomestayModel.fromJson(String source) =>
      HomestayModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
