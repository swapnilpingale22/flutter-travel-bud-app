// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:travel_bud/models/homestay.dart';

class HomestayProvider extends ChangeNotifier {
  HomestayModel _homestay = HomestayModel(
    title: '',
    homestayType: '',
    area: '',
    maxGuests: 0,
    bedrooms: 0,
    singleBed: 0,
    doubleBed: 0,
    extraFloorMat: 0,
    bathrooms: 0,
    isKitchen: false,
    amenities: [],
    checkInTime: const Duration(hours: 00, minutes: 00),
    checkOutTime: const Duration(hours: 00, minutes: 00),
    isCheckInFlexible: false,
    isCheckOutFlexible: false,
    latitude: 0,
    longitude: 0,
    address: '',
    streetAddress: '',
    landmark: '',
    city: '',
    pincode: 0,
    state: '',
    isLocationSpecific: false,
    photos: [],
    description: '',
    startPrice: 0,
    endPrice: 0,
    ownerContactNo: 0,
    ownerEmail: '',
    homestayContactNo: 0,
    homestayEmail: '',
    id: '',
    userId: '',
  );

  HomestayModel get homestay => _homestay;

  // Method to update individual fields of HomestayModel
  void updateHomestayTitle(String title) {
    homestay.title = title;
    notifyListeners();
  }

  void updateHomestayType(String type) {
    homestay.homestayType = type;
    notifyListeners();
  }

  void updateAccomDetails({
    required String area,
    required int guests,
    required int bedroom,
    required int singleBed,
    required int doubleBed,
    required int extraFloorMat,
    required int bathroom,
    required bool kitchen,
  }) {
    homestay.area = area;
    homestay.maxGuests = guests;
    homestay.bedrooms = bedroom;
    homestay.singleBed = singleBed;
    homestay.doubleBed = doubleBed;
    homestay.extraFloorMat = extraFloorMat;
    homestay.bathrooms = bathroom;
    homestay.isKitchen = kitchen;
    notifyListeners();
  }

  void updateAmenities({required List<String> amenitiesList}) {
    homestay.amenities = amenitiesList;
    notifyListeners();
  }

  void updateCheckInOut({
    required Duration checkIn,
    required Duration checkOut,
    required bool isCheckInFlexi,
    required bool isCheckOutFlexi,
  }) {
    homestay.checkInTime = checkIn;
    homestay.checkOutTime = checkOut;
    homestay.isCheckInFlexible = isCheckInFlexi;
    homestay.isCheckOutFlexible = isCheckOutFlexi;
    notifyListeners();
  }

  void updateLocation({
    required double lat,
    required double long,
  }) {
    homestay.latitude = lat;
    homestay.longitude = long;
    notifyListeners();
  }

  void updateAddress({
    required String address,
    required String streetAddress,
    required String landmark,
    required String city,
    required int pincode,
    required String state,
    required bool islocationSpecif,
  }) {
    homestay.address = address;
    homestay.streetAddress = streetAddress;
    homestay.landmark = landmark;
    homestay.city = city;
    homestay.pincode = pincode;
    homestay.state = state;
    homestay.isLocationSpecific = islocationSpecif;
    notifyListeners();
  }

  void updatePhotos({
    required List<String> photosList,
  }) {
    homestay.photos = photosList;
    notifyListeners();
  }

  void updateDescription({
    required String description,
  }) {
    homestay.description = description;
    notifyListeners();
  }

  void updatePriceContact({
    required double startPrice,
    required double endPrice,
    required int ownerContactNo,
    required String ownerEmail,
    required int homestayContactNo,
    required String homestayEmail,
  }) {
    homestay.startPrice = startPrice;
    homestay.endPrice = endPrice;
    homestay.ownerContactNo = ownerContactNo;
    homestay.ownerEmail = ownerEmail;
    homestay.homestayContactNo = homestayContactNo;
    homestay.homestayEmail = homestayEmail;
    notifyListeners();
  }

  // Method to submit homestay details to the backend
  Future<void> submitHomestayToBackend() async {
    // Call your backend API here to submit _homestay
    // Example:
    // await ApiService.submitHomestay(_homestay.toJson());
  }
}
