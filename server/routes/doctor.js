const express = require("express");
const {Doctor} = require('../models/doctor');
const User = require('../models/user');
const bcryptjs = require("bcryptjs");
const doctorRouter = express.Router();
const jwt = require("jsonwebtoken");
const auth = require("../middlewares/auth");
const doctors = require("../middlewares/doctor");
const doctor = require("../middlewares/auth");
// doctorRouter.post("/doctor/register",async (req, res)=>{
  doctorRouter.post("/doctor/register", async (req, res) => {

    try {
        const {name , email, password, contactno, address,qualification, specialization, experience, nmc_no }= req.body;
        const existingDoctor = await Doctor.findOne({ email });
        if (existingDoctor) {
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
    
        let doctor = new Doctor({
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
        doctor = await doctor.save();
        // User.type = doctor;
        // await User.save();
        res.json(doctor);
        let user = new User({
          email,
          password: hashedPassword,
          name,
          role: "doctor",
        });
        user = await user.save();
        // res.json(user);
      } catch (e) {
        res.status(500).json({ error: e.message });
      }

});

// Gel all doctor
doctorRouter.get("/api/get-doctors",async(req, res)=>{
  try {
    const doctors = await Doctor.find({})
    res.json(doctors);
    
  } catch (e) {
    res.status(500).json({error:e.message});
    
  }
});

doctorRouter.get("/api/doctors/find/:id",async(req, res)=>{
  try {
    const doctor = await Doctor.findbyId(req.params.id)
    res.json(doctor);
    
  } catch (e) {
    res.status(500).json({error:e.message});
    
  }
});
doctorRouter.post("/api/enter-to-chat", doctor, auth, async (req, res) => {
  try {
    const { id } = req.body;
    const doctor = await Doctor.findById(id);
    let user = await User.findById(req.user);
    res.json(doctor);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
doctorRouter.post("/api/check-npc", async (req, res) => {
  try {
    const { npc_no } = req.body;
    const response = await fetch(`https://nmc.org.np/api/doctor/${npc_no}`);
    const data = await response.json();
    if (!data || data.length === 0) {
      return res.status(400).json({ msg: "Invalid NPC number." });
    }
    // If the response contains valid data, return it to the client
    res.json(data);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

const axios = require('axios');
const cheerio = require('cheerio');

const checkNMC = async (name) => {
  try {
    const url = `https://www.nmc.org.np/deregistration`;
    const response = await axios.get(url);
    const html = response.data;
    const $ = cheerio.load(html);
    const json = $('script[type="application/json"]').html();
    const data = JSON.parse(json);
    const deregisteredDoctors = data.deregisteredDoctors;
    for (let i = 0; i < deregisteredDoctors.length; i++) {
      const doctor = deregisteredDoctors[i];
      if (doctor.name === name) {
        return doctor.nmc_no;
      }
    }
    return 'Doctor not found';
  } catch (error) {
    console.error(error);
    return 'Error occurred';
  }
};

// Usage
checkNMC('Doctor Name')
  .then(nmc_no => console.log(nmc_no))
  .catch(error => console.log(error));

module.exports = doctor;


module.exports = doctorRouter;






// const user = await User.findOne({ email });

// if (!user) {
//     return res.status(400).json({ msg: "User with this email does not exist!" });
//   }
  
//   if (user.type === 'doctor' && !user.npc_no) {
//     return res.status(400).json({ msg: "Doctor credentials not found." });
//   }
  
//   const isMatch = await bcryptjs.compare(password, user.password);
  
//   if (!isMatch) {
//     return res.status(400).json({ msg: "Incorrect password." });
//   }


  