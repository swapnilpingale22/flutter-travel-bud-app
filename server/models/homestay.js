const mongoose = require("mongoose");

const homestaySchema = mongoose.Schema({
  title: {
    type: String,
    required: true,
    trim: true,
  },
  homestayType: {
    type: String,
    required: true,
  },
  area: {
    type: String,
    required: true,
  },
  maxGuests: {
    type: Number,
    required: true,
  },
  bedrooms: {
    type: Number,
    required: true,
  },
  singleBed: {
    type: Number,
    required: true,
  },
  doubleBed: {
    type: Number,
    required: true,
  },
  extraFloorMat: {
    type: Number,
    required: true,
  },
  bathrooms: {
    type: Number,
    required: true,
  },
  isKitchen: {
    type: Boolean,
    required: true,
  },
  amenities: [
    {
      type: String,
      required: true,
    },
  ],
  checkInTime: {
    hours: Number,
    minutes: Number,
  },
  checkOutTime: {
    hours: Number,
    minutes: Number,
  },
  isCheckInFlexible: {
    type: Boolean,
    required: true,
  },
  isCheckOutFlexible: {
    type: Boolean,
    required: true,
  },
  latitude: {
    type: Number,
    required: true,
  },
  longitude: {
    type: Number,
    required: true,
  },
  address: {
    type: String,
    required: true,
  },
  streetAddress: {
    type: String,
    required: true,
  },
  landmark: {
    type: String,
    required: true,
  },
  city: {
    type: String,
    required: true,
  },
  pincode: {
    type: Number,
    required: true,
  },
  state: {
    type: String,
    required: true,
  },
  isLocationSpecific: {
    type: Boolean,
    required: true,
  },
  photos: [
    {
      type: String,
      required: true,
    },
  ],
  description: {
    type: String,
    required: true,
  },
  startPrice: {
    type: Number,
    required: true,
  },
  endPrice: {
    type: Number,
    required: true,
  },
  ownerContactNo: {
    type: Number,
    required: true,
  },
  ownerEmail: {
    type: String,
    required: true,
  },
  homestayContactNo: {
    type: Number,
    required: true,
  },
  homestayEmail: {
    type: String,
    required: true,
  },
  userId: {
    type: String,
    required: true,
  },
});

const HomestayModel = mongoose.model("Homestay", homestaySchema);

module.exports = { HomestayModel, homestaySchema };
