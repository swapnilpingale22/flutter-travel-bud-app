const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
const authRouter = require("./routes/auth");
require("dotenv").config();

const PORT = process.env.PORT || 3000;
const app = express();
const mongoDBUrl = process.env.MONGODB_URL;

//for multi platform support eg. chrome
app.use(cors());
app.use(express.json());
app.use(authRouter);

mongoose
  .connect(mongoDBUrl)
  .then(() => {
    console.log("Connected to MongoDB");
  })
  .catch((err) => {
    console.error("Error connecting to MongoDB:", err);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`Server is running on port: ${PORT}`);
});
