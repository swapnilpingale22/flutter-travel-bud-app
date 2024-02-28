const express = require("express");
const homestayRouter = express.Router();
const auth = require("../middlewares/auth");
const { HomestayModel } = require("../models/homestay");

// host a property
homestayRouter.post("/host-property", auth, async (req, res) => {
  try {
    const {
      title,
      homestayType,
      area,
      maxGuests,
      bedrooms,
      singleBed,
      doubleBed,
      extraFloorMat,
      bathrooms,
      isKitchen,
      amenities,
      checkInTime,
      checkOutTime,
      isCheckInFlexible,
      isCheckOutFlexible,
      latitude,
      longitude,
      address,
      streetAddress,
      landmark,
      city,
      pincode,
      state,
      isLocationSpecific,
      coverPhoto,
      photos,
      description,
      startPrice,
      endPrice,
      ownerContactNo,
      ownerEmail,
      homestayContactNo,
      homestayEmail,
      userId,
    } = req.body;

    let homestay = new HomestayModel({
      title,
      homestayType,
      area,
      maxGuests,
      bedrooms,
      singleBed,
      doubleBed,
      extraFloorMat,
      bathrooms,
      isKitchen,
      amenities,
      checkInTime,
      checkOutTime,
      isCheckInFlexible,
      isCheckOutFlexible,
      latitude,
      longitude,
      address,
      streetAddress,
      landmark,
      city,
      pincode,
      state,
      isLocationSpecific,
      coverPhoto,
      photos,
      description,
      startPrice,
      endPrice,
      ownerContactNo,
      ownerEmail,
      homestayContactNo,
      homestayEmail,
      userId,
    });

    homestay = await homestay.save();

    res.json(homestay);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//get all the properties

homestayRouter.get("/get-properties", auth, async (req, res) => {
  try {
    const properties = await HomestayModel.find({});
    res.json(properties);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//get properties by current user

homestayRouter.post("/get-your-properties", auth, async (req, res) => {
  try {
    const { id } = req.body;
    const properties = await HomestayModel.find({ userId: id });
    res.json(properties);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//delete a property

homestayRouter.post("/delete-property", auth, async (req, res) => {
  try {
    const { id } = req.body;
    let property = await HomestayModel.findByIdAndDelete(id);
    res.json(property);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = homestayRouter;
