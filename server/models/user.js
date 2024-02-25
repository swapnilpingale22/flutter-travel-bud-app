const mongoose = require("mongoose");
const { homestaySchema } = require("./homestay");

const userSchema = mongoose.Schema({
  name: {
    required: true,
    type: String,
    trim: true,
  },
  mobileNo: {
    required: true,
    type: Number,
    validate: {
      validator: (value) => {
        return value.toString().length === 10;
      },
      message: "Please enter a valid mobile number",
    },
  },
  email: {
    required: true,
    type: String,
    trim: true,
    validate: {
      validator: (value) => {
        const re =
          /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
        return value.match(re);
      },
      message: "Please enter a valid email address",
    },
  },
  password: {
    required: true,
    type: String,
    validate: {
      validator: (value) => {
        return value.length > 6;
      },
      message: "Please enter a long password",
    },
  },
  type: {
    type: String,
    default: "user",
  },
  //homestay data
  homestays: [
    {
      homestay: homestaySchema,
    },
  ],
});

const User = mongoose.model("User", userSchema);

module.exports = User;
