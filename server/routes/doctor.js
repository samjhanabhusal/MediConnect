const express = require("express");
const {Doctor} = require('../models/doctor');
const User = require('../models/user');
const bcryptjs = require("bcryptjs");
const doctorRouter = express.Router();
const jwt = require("jsonwebtoken");
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


  