const express = require("express");
const {Doctor} = require('../models/doctor');
const User = require('../models/user');
const bcryptjs = require("bcryptjs");
const hospitalRouter = express.Router();
const jwt = require("jsonwebtoken");
const auth = require("../middlewares/auth");
const doctors = require("../middlewares/doctor");
const hospital = require("../middlewares/auth");
// hospitalRouter.post("/doctor/register",async (req, res)=>{
  hospitalRouter.post("/hospital/register", async (req, res) => {

    try {
        const {name , email, password, contactno, address,qualification, specialization, experience, nmc_no }= req.body;
        const existingHospital = await Hospital.findOne({ email });
        if (existingHospital) {
          return res
            .status(400)
            .json({ msg: "Email already exists!" });
        }const existingUser = await User.findOne({ email });
        if (existingUser) {
          return res
            .status(400)
            .json({ msg: "User with same email already exists!" });
        }
    
        // const hashedPassword = await bcryptjs.hash(password, 8);
    
        
    
        const hashedPassword = await bcryptjs.hash(password, 8);
    
        let hospital = new hospital({
          email,
          password: hashedPassword,
          name,
          contactno,
          address,
          qualification,
          specialization,
          experience,
          nmc_no
        });
        hospital = await hospital.save();
        // User.type = doctor;
        // await User.save();
        res.json(doctor);
        let user = new User({
          email,
          password: hashedPassword,
          name,
          role: "hospital",
        });
        user = await user.save();
        // res.json(user);
      } catch (e) {
        res.status(500).json({ error: e.message });
      }

});

// Gel all doctor
hospitalRouter.get("/api/get-hospital",async(req, res)=>{
  try {
    const doctors = await Hospital.find({})
    res.json(doctors);
    
  } catch (e) {
    res.status(500).json({error:e.message});
    
  }
});

hospitalRouter.get("/api/hospitals/find/:id",async(req, res)=>{
  try {
    const hospital = await Hospital.findbyId(req.params.id)
    res.json(hospital);
    
  } catch (e) {
    res.status(500).json({error:e.message});
    
  }
});


// const axios = require('axios');
// const cheerio = require('cheerio');

// const checkNMC = async (name) => {
//   try {
//     const url = `https://www.nmc.org.np/deregistration`;
//     const response = await axios.get(url);
//     const html = response.data;
//     const $ = cheerio.load(html);
//     const json = $('script[type="application/json"]').html();
//     const data = JSON.parse(json);
//     const deregisteredDoctors = data.deregisteredDoctors;
//     for (let i = 0; i < deregisteredDoctors.length; i++) {
//       const doctor = deregisteredDoctors[i];
//       if (doctor.name === name) {
//         return doctor.nmc_no;
//       }
//     }
//     return 'Doctor not found';
//   } catch (error) {
//     console.error(error);
//     return 'Error occurred';
//   }
// };

// // Usage
// checkNMC('Doctor Name')
//   .then(nmc_no => console.log(nmc_no))
//   .catch(error => console.log(error));

module.exports = hospital;


module.exports = hospitalRouter;






// // const user = await User.findOne({ email });

// // if (!user) {
// //     return res.status(400).json({ msg: "User with this email does not exist!" });
// //   }
  
// //   if (user.type === 'doctor' && !user.npc_no) {
// //     return res.status(400).json({ msg: "Doctor credentials not found." });
// //   }
  
// //   const isMatch = await bcryptjs.compare(password, user.password);
  
// //   if (!isMatch) {
// //     return res.status(400).json({ msg: "Incorrect password." });
// //   }


  