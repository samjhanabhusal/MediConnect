const express = require("express");
const bcryptjs = require("bcryptjs");
const User = require("../models/user");
// const UserVerification = require("../models/UserVerification");
const jwt = require("jsonwebtoken");
const nodemailer = require("nodemailer");
const auth = require("../middlewares/auth");
// const Profile = require("../models/Profile");
const fs = require('fs')
// const express = require ('express');
// const app = express();
// import VerifyMail from "./src/components/EmailVerify";

// uuid to generate random string
// uuid has submodel v4
const { v4: uuidv4 } = require("uuid");

const authRouter = express.Router();
// let testAccount =   nodemailer.createTestAccount();

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
authRouter.post("/api/signup", async (req, res) => {
  try {
    const { name, email, password } = req.body;

    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res.status(400).json({ msg: "User already existed" });
    }

    const hashedPassword = await bcryptjs.hash(password, 8);

    let user = new User({
      name,
      email,
      password: hashedPassword,
      verified: false,
    });
    user = await user.save();
    res.json(user);
    if (user) {
      sendVerifyMail(req.body.name, req.body.email, user._id);
    }
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});


 authRouter.get("/user/verify/:userId", async (req, res) => {
  try {
    const verifyupdat = await User.updateOne(
      { _id: req.params.userId},
      { $set: { is_verified: 1 } }
    );
    // const is_ver = await User.find({email})
    // res.json(<Route exact element = {VerifyMail}></Route>);
    // res.json({msg:"You are Verified"})
    // fs.readFile('../index.html', function(err, data){
    //   if(err){
    //     res.json({msg:"Err"});
    //   }
    //   else{
    //     res.write(data)
    //   }
    // })


    // res.sendFile('index.html', {root:__dirname})
    res.json({msg:"Email has been verified.Now you can sign in"})

  } catch (e) {
    res.status(400).send({ msg: e.message });
  }
});
// signin route
// authRouter.post("/api/signin", async (req, res) => {
//   try {
//     const { email, password } = req.body;

//     const user = await User.findOne({ email });
//     const isMatch = await bcryptjs.compare(password, user.password);
//     const token = jwt.sign(
//         { id: user._id, type: user.type, name: user.name, email: user.email },
//         process.env.JWT_SEC,
//         { expiresIn: "3d" }
//       );
//     console.log(user.email);
//     if (!user) {
//       return res
//         .status(400)
//         .json({ msg: "User with this email does not exist!" });
//     }

//     else if(user.is_verified === 0){

//       res.json({msg:"Email has been send. First Verify that "});
//     }

//     else if (!isMatch) {
//       return res.status(400).json({ msg: "Incorrect password." });
//     }

//     // const token = jwt.sign({ id: user._id }, "passwordKey");

//     // const token = jwt.sign({id:user._id,}, process.env.JWT_SEC,{expiresIn:"3d"});
   
   
//     else res.json({ token, ...user._doc });
//     console.log("User in signin");
//   } catch (e) {
//     res.status(500).json({ error: e.message });
//   }
// });





authRouter.post("/api/signin", async (req, res) => {
    try {
      const { email, password } = req.body;
  
      const user = await User.findOne({ email });
      console.log(user);
  
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
  
      const token = jwt.sign(
        { id: user._id, type: user.type, name: user.name, email: user.email },
        process.env.JWT_SEC,
        { expiresIn: "3d" }
      );
  
      res.json({ token, ...user._doc });
      console.log("User in signin");
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });
  












authRouter.post("/tokenIsValid", async (req, res) => {
  try {
    const token = req.header("x-auth-token");
    if (!token) return res.json(false);

    const verified = jwt.verify(token, "passwordkey");
    if (!verified) return res.json(false);

    // verified ma id xa...coz sigin in garda ko jwt.sign ma has id
    const user = User.findById(verified.id);
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

// authRouter.get("/", auth,async (req, res) => {
//   const user = await User.findById(req.user);
//   res.json({ ...user._doc, token: req.token });
// });

const sendResetPasswordMail = (name, email, token) => {
  // const sendResetPasswordMail = (name, email)=>{

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
      subject: "For Reset Password",

      // html:'<p>Hi '+name+ ', Please copy the link and <a href = "http://3000/api/reset-password?'+token+'"> and reset you password',
      html:
        "<p> Hi " +
        name +
        ', please copy the link and <a href = "http://3000/api/reset-password?token=' +
        token +
        '">reset your password</a>',

      // <p><a href = "${process.env.CLIENT_URL}"></a></p>`

      // <p><a href = "${process.env.CLIENT_URL}reset-password/${token}"></a></p>`
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

authRouter.post("/api/forget-password", auth, async (req, res) => {
  try {
    // coog(user.email);
    const { email } = req.body;

    const user = await User.findOne({ email });

    const token = req.token
    ;

    if (user) {
      //   // res.status(200).send({success: true, msg:"Please check email"});

      sendResetPasswordMail(user.name, user.email, token);

      res.status(200).send({ success: true, msg: "Please check email" });
    } else {
      return res
        .status(400)
        .json({ msg: "User with this email does not exist!" });
    }
  } catch (e) {
    res.status(400).json({ error: e.message });
  }
});
authRouter.post("/api/reset-password", async (req, res) => {
  try {
    const token = req.query.token;

    const tokenData = await User.findOne({ token: token });
    if (tokenData) {
      const password = req.body.password;
      const verified = jwt.verify(token, process.env.JWT_SEC);
      if (!verified)
        return res
          .status(401)
          .json({ msg: "Token verification failed, authorization denied." });

      const newPassword = await bcryptjs.hash(password, 8);

      // can fetch user id

      const id = verified.id;

      const userData = await User.findByIdAndUpdate(
        { _id: id },
        { $set: { password: newPassword, token: "" } },
        { new: true }
      );

      res.status(200).json({ msg: "Password has been reset" });
    } else {
      return res.status(200).json({ msg: "This link has expired" });
    }
  } catch (e) {
    res.status(400).json({ error: e.message });
  }
});
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








// authRouter.post("/api/UpdatePassword", auth, async (req, res) => {
//   try {
//     // string newpassword
//     let { email, newpassword, confirmPassword } = req.body;
//     const user = await User.find({ email });
//     const token = req.token;
//     if (!user) {
//       return res
//         .status(400)
//         .json({ msg: "User with this email does not exist!" });
//     }

//     if (newpassword.length == 0 || confirmPassword.length == 0) {
//       return res.status(400).json({ msg: "Password cannot be null" });
//     }
//     // const newpassword = req.body.password;

//     const hashedPassword = await bcryptjs.hash(newpassword, 8);

//     // const confirmPassword = req.body.confirmpassword;

//     const isMatch = await bcryptjs.compare(confirmPassword, hashedPassword);
//     // const id = verified.id;
//     if (!isMatch) {
//       return res.status(400).json({ msg: "Both password should matched." });
//     }

//     const id = req.user;

//     const passwordUpdated = User.findByIdAndUpdate(
//       {
//         _id: id,
//       },
//       {
//         $set: { password: hashedPassword, token: "" },
//       },
//       {
//         new: true,
//       }
//     );
//     // res.status(200).josn({msg: "Password has been updated"});
//   } catch (e) {
//     res.status(400).json({ error: e.message });
//   }
// });

module.exports = authRouter;