const express = require("express");
const { Profile } = require("../models/profile");
const profileRouter = express.Router();
const auth = require("../middlewares/auth");


profileRouter.post("/api/add/profile",auth, async (req, res) => {

try {

    const {  firstname, lastname, age, phoneno, address ,gender} = req.body;
    let profile = new Profile({
      userId:req.user,
      // status:'true',
      // name:req.decoded.name,
      lastname,
      firstname,
      phoneno,
      address,
      gender,
      age,
    });
    // const profile = Profile({
    //     userId:req.user,
    //     name: req.decoded.username,
    //     firstname: req.body.firstname,
    //     lastname: req.body.lastname,
    //     gender: req.body.gender,
    //     age: req.body.age,
    //     phoneno: req.body.phoneno,
    //     address: req.body.address,
    //   });
  profile = await profile.save();
    res.json(profile);
    
} catch (e) {
    res.status(500).json({ error: e.message });

}
});

profileRouter.get("/api/profile/me", auth, async (req, res) => {
  try {
    const profile = await Profile.find({ userId: req.user });
    res.json(profile);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
// Check Profile data

profileRouter.get("/checkProfile",auth,async (req, res) => {
  Profile.findOne({ userId: req.user }, (err, result) => {
    // sending error message to frontedn
    if (err) return res.json({ err: err });
    // Now setting the status
    else if (result == null) {
      return res.json({ status: false, userId:req.user });
      // return res.json({ status: false });
    } else {
      return res.json({ status: true, userId:req.user });
      // return res.json({ status: true});
    }
  });
});

// profileRouter.post("/api/changeStatus", auth, async (req, res) => {
//   try {
//     const {  status } = req.body;
//     let profile = await Profile.findByOne({userId:req.user});
//     profile.status = status;
//     profile = await profile.save();
//     res.json(profile);
//   } catch (e) {
//     res.status(500).json({ error: e.message });
//   }
// });
profileRouter.get("/api/profile/get-data", auth, async (req,res)=>{

  try {
      const profiles = await Profile.find({});
      res.json(profiles);
      
  } catch (error) {
      res.status(500).json({ error: e.message });
  
  }        
}); 


// Check Profile data

// router.route("/checkProfile").get(middleware.checkToken, (req, res) => {
//   Profile.findOne({ username: req.decoded.username }, (err, result) => {
//     if (err) return res.json({ err: err });
//     else if (result == null) {
//       return res.json({ status: false, username: req.decoded.username });
//     } else {
//       return res.json({ status: true, username: req.decoded.username });
//     }
//   });
// });
profileRouter.get("/getProfileData", auth, async (req, res) => {
  Profile.findOne({ userId: req.user}, (err, result) => {
    if (err) return res.json({ err: err });
    if (result == null) return res.json({ data: [] });
    else return res.json({ data: result });
  });
});
// router.route("/update").patch(middleware.checkToken, async (req, res) => {
profileRouter.put("/api/update/profile",auth, async (req, res) => {
  let profile = {};
  // await Profile.findOne({ userId: req.user }, (err, result) => {
  //   if (err) {
  //     profile = {};
  //   }
  //   if (result != null) {
  //     profile = result;
  //   }
  // });
   Profile.findOneAndUpdate(
    // { username: req.decoded.username },
    { userId: req.user },
    {
      $set: {
        // firstname:req.body.firstname
        firstname: req.body.firstname ? req.body.firstname : profile.firstname,
        lastname: req.body.lastname ? req.body.lastname : profile.firstname,
        gender: req.body.gender
          ? req.body.gender
          : profile.gender,
        age: req.body.age ? req.body.age : profile.age,
        phoneno: req.body.phoneno ? req.body.phoneno : profile.phoneno,
        address: req.body.address ? req.body.address : profile.address, //about:""
      },
    },
    { new: true },
    (err, result) => {
      if (err) return res.json({ err: err });
      if (result == null) return res.json({ data: [] });
      else return res.json({ data: result });
    }
  );
});
module.exports = profileRouter;