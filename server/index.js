// IMPORTS FROM PACKAGES
const express = require("express");
const mongoose = require("mongoose");
const adminRouter = require("./routes/admin");
const dotenv=require("dotenv");
// IMPORTS FROM OTHER FILES
const authRouter = require("./routes/auth");
const productRouter = require("./routes/product");
const userRouter = require("./routes/user");
const profileRouter = require("./routes/profile");

dotenv.config({
  path: './.env'
})

// INIT
const PORT = process.env.PORT || 3000;
const app = express();
const DB = "mongodb+srv://luveen:luveenpassword@cluster0.vop3wa1.mongodb.net/?retryWrites=true&w=majority";

// middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);
app.use(profileRouter);

// Connections
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });

// app.listen(PORT, "0.0.0.0", () => {
app.listen(PORT || 5000, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});
