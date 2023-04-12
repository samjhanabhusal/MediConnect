// IMPORTS FROM PACKAGES
const express = require("express");
const mongoose = require("mongoose");
const cors = require('cors');
const http = require("http");
const adminRouter = require("./routes/admin");
// IMPORTS FROM OTHER FILES
const authRouter = require("./routes/auth");
const productRouter = require("./routes/product");
const userRouter = require("./routes/user");
const profileRouter = require("./routes/profile");

// INIT
// INIT
const dotenv = require("dotenv");
// const cors = require("cors");

dotenv.config({
  path: './.env'
})
const PORT = process.env.PORT || 3000;
const app = express();
var server = http.createServer(app);
var io = require("socket.io")(server);
// const DB = "mongodb+srv://luveen:luveenpassword@cluster0.vop3wa1.mongodb.net/?retryWrites=true&w=majority";
var username = encodeURIComponent("Samjhana");

var password = encodeURIComponent("password05#")
const DB = `mongodb+srv://${username}:${password}@cluster0.hmea1x6.mongodb.net/?retryWrites=true&w=majority`

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
  io.on("connection", (socket) => {
    console.log("connetetd");
    console.log(socket.id, "has joined");
    socket.on("signin", (id) => {
      console.log(id);
      clients[id] = socket;
      console.log(clients);
    });
    socket.on("message", (msg) => {
      console.log(msg);
      let targetId = msg.targetId;
      if (clients[targetId]) clients[targetId].emit("message", msg);
    });
  });
app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});
server.listen(5000, "0.0.0.0", () => {
  console.log(`server started`);
});
