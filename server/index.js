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
const doctorRouter = require("./routes/doctor");
const hospitalRoutes = require("./routes/hospital");
const messageRoutes = require("./routes/messages");
// INIT
// INIT
const dotenv = require("dotenv");
const hospitalRouter = require("./routes/hospital");
// const cors = require("cors");

dotenv.config({
  path: './.env'
})
const PORT = process.env.PORT || 3000;
const app = express();
// var server = http.createServer(app);
const server = http.createServer(app);
// importing socket.io--passing server
var io = require("socket.io")(server);

// const{Server} = require("socket.io");
// const io = new Server(server);
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
app.use(doctorRouter);
app.use(hospitalRouter);
// app.use("/api/auth", authRoutes);
app.use("/api/messages", messageRoutes);


// Connections
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });

  // listen and emit event------tes paxi callbackf

  // ---listen on connection event
  io.on("connection", (socket) => {
    console.log("connecetd");
    console.log(socket.id, "has joined");
    // socket.on("signin", (id) => {
    //   console.log(id);
    //   clients[id] = socket;
    //   console.log(clients);
    });
    // socket.on("message", (msg) => {
    //   console.log(msg);
    //   let targetId = msg.targetId;
    //   if (clients[targetId]) clients[targetId].emit("message", msg);
    // });
  // });
app.listen(3000, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});
server.listen(5000, "0.0.0.0", () => {
  console.log(`server started`);
});
