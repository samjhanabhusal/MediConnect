// import Cheerio  from "cheerio";
const axios = require ("axios");
const Cheerio =  require("cheerio");
const express = require("express");
const nodemailer = require("nodemailer");
const User = require("../models/user");
// const Doctor = require('../models/doctor');
const { v4: uuidv4 } = require("uuid");
const bcryptjs = require("bcryptjs");
const authRouter = express.Router();
const jwt = require("jsonwebtoken");
const auth = require("../middlewares/auth");
const admin = require("../middlewares/admin");
const { Product } = require("../models/product");
const {Doctor} = require('../models/doctor');
const sendVerifyMail = (name, email, user_id) => {
  // const sendResetPasswordMail = (name, email)=>{
  const currentUrl = "http://localhost:5000/";
  const uniqueString = uuidv4() + user_id;
  try {
    const transporter = nodemailer.createTransport({
      host: "smtp.gmail.com",
      port: 587,
      secure: false,
      requireTLS: true,
      auth: {
        user: process.env.EMAIL_USER,
        pass: process.env.EMAIL_PASSWORD,
      },
    });

    const mailOptions = {
      from: process.env.EMAIL_USER,

      to: email,
      subject: "For Verification Mail",

        // html:
        //   "<p> Hi " +
        //   name +
        //   ', please click here to and <a href = "http://3000/api/verify/mail' +
        //   user_id +
        //   '">Verify</a>your mail.</P>',
      html: `<p>Verify your email to complete signup and singin to your account.</p><p>This link 
      <b>expires in 6 days</b>.</p><p>Press <a href = ${
        currentUrl + "user/verify/" + user_id
      }>here.</p>`,
    };

    

    transporter.sendMail(mailOptions, function (error, info) {
      if (error) {
        console.log(error);
      } else {
        console.log("mail has been send:-", info.response);
      }
    });
  } catch (e) {
    res.status(400).json({ error: e.message });
  }
};
// SIGN UP
authRouter.post("/api/signup", async (req, res) => {
  try {
    const { name, email, password } = req.body;

    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res
        .status(400)
        .json({ msg: "User with same email already exists!" });
    }

    const hashedPassword = await bcryptjs.hash(password, 8);

    let user = new User({
      email,
      password: hashedPassword,
      name,
    });
    user = await user.save();
    res.json(user);
    if (user) {
      sendVerifyMail(req.body.name, req.body.email, user._id);
    }
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

authRouter.get("/user/verify/:userId", async (req, res) => {
  try {
    const verifyupdat = await User.updateOne(
      { _id: req.params.userId},
      { $set: { is_verified: 1 } }
    );
    res.json({msg:"Email has been verified.Now you can sign in"})

  } catch (e) {
    res.status(400).send({ msg: e.message });
  }
});

// Sign In Route
// Exercise
authRouter.post("/api/signin", async (req, res) => {
  try {
    const { email, password } = req.body;

    const user = await User.findOne({ email });
    if (!user) {
      return res
        .status(400)
        .json({ msg: "User with this email does not exist!" });
    }
    if (user.is_verified === 0) {
      return res.status(400).json({ msg: "Email has been sent. First verify it." });
    }

    const isMatch = await bcryptjs.compare(password, user.password);
    if (!isMatch) {
      return res.status(400).json({ msg: "Incorrect password." });
    }

    const token = jwt.sign({ id: user._id , name: user.name}, "passwordKey");
    res.json({ token, ...user._doc });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

authRouter.post("/tokenIsValid", async (req, res) => {
  try {
    const token = req.header("x-auth-token");
    if (!token) return res.json(false);
    const verified = jwt.verify(token, "passwordKey");
    if (!verified) return res.json(false);

    const user = await User.findById(verified.id);
    if (!user) return res.json(false);
    res.json(true);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// get user data
authRouter.get("/", auth, async (req, res) => {
  const user = await User.findById(req.user);
  res.json({ ...user._doc, token: req.token });
});
// authRouter.get("/auth/get-products",  async (req, res) => {
//   try {
//     const products = await Product.find({});
//     res.json(products);
//   } catch (e) {
//     res.status(500).json({ error: e.message });
//   }
// });

authRouter.put("/api/updatePassword", async (req, res) => {
  const { email, newpassword, confirmpassword } = req.body;
  const user = await User.findOne({ email });
  // console.log(user);
  const id = user.id;
  console.log(id);

  if (!user) {
    res.status(400).json({ msg: "User Not Found" });
  } else {
    const isMatch = newpassword === confirmpassword;

    if (isMatch) {
      const hashedPassword = await bcryptjs.hash(newpassword, 8);
      const user = await User.findOne({ email });
  // console.log(user);
  const id = user.id;
      const token = req.token;
      console.log(token);
      console.log("Mathillio tokne");
      
       User.findOneAndUpdate(
        {
          _id: id,
          
        },
        {
          $set: { password: hashedPassword, token: "" },
        },
        {
          new: true,
        },
        (err,result) => {
          if(err) return res.json({err:err});
          else return res.json ({data:result});
        }
      );
      // res.json(user);

      
      // console.log(token);
      // return res.json({ msg: "Password Updated and token is empty now" });
    } else {
      return res.status(400).json({msg:"Password donot Matched"});
    }
  }
});

// authRouter.put("/api/UpdatePassword", auth,async (req,res)=>
// {

//   try {
//     // string newpassword
//     let {email,newpassword,confirmPassword} = req.body;
//   const user = await User.find({email});
//   const token = req.token;

//   console.log("This is token in ")
//   console.log(token);
//   if (!user) {
//     return res
//       .status(400)
//       .json({ msg: "User with this email does not exist!" });
//   }

//   if(newpassword.length == 0 || confirmPassword.length == 0){
//     return res.status(400).json({msg:"Password cannot be null"});
//   }
// const newpassword = req.body.password;

// const hashedPassword = await bcryptjs.hash(newpassword, 8)

// // const confirmPassword = req.body.confirmpassword;

// const isMatch = await bcryptjs.compare(confirmPassword,hashedPassword);
// // const id = verified.id;
// if (!isMatch) {
//   return res.status(400).json({ msg: "Both password should matched." });
// }

// const id = req.user

//   const passwordUpdated = User.findByIdAndUpdate({
//     _id:id},
//     {
//     $set:{ password : hashedPassword, token: ""} },
//     {
//       new:true
//     }
//   );
// res.status(200).josn({msg: "Password has been updated"});

//     }

//  catch (e) {
//     res.status(400).json({ error: e.message });
//   }

// });

module.exports = authRouter;
