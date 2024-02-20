const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
const authRouter = require("./routes/auth");

const PORT = process.env.PORT || 3000;
const app = express();
const DBurl = "mongodb+srv://swapnil:Swapnil789@cluster0.bihocz1.mongodb.net/?retryWrites=true&w=majority"

//for multi platform support eg. chrome
app.use(cors());
app.use(express.json());
app.use(authRouter);

mongoose
  .connect(DBurl)
  .then(() => {
    console.log("MongoDB Connected");
  })
  .catch((e) => {
    console.error("Error connecting to MongoDB:", e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`Server is running on port: ${PORT}`);
});
