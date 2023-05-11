const express = require("express");
const puppeteer = require('puppeteer');
const {Doctor} = require('../models/doctor');
const User = require('../models/user');
const bcryptjs = require("bcryptjs");
const doctorRouter = express.Router();
const jwt = require("jsonwebtoken");
const auth = require("../middlewares/auth");
const doctors = require("../middlewares/doctor");
const doctor = require("../middlewares/auth");
const axios = require('axios');
const cheerio = require('cheerio');
// doctorRouter.post("/doctor/register",async (req, res)=>{

//  GET request to the deregistration page of NMC 
//  loads the HTML response into a Cheerio object. 
// It then uses Cheerio's selector syntax to target the td element that contains the NMC numbers, 
// and extracts the text content of each td element. 
// Finally, it returns an array of NMC numbers.
//  the NMC numbers are stored in the second column (td:nth-child(3)) 

  async function searchDoctorOnNmc(name, nmc_no, qualification) {
    const searchUrl = `https://www.nmc.org.np/searchPractitioner?name=${name}&nmc=${nmc_no}&degree=${qualification}`;
  
    const response = await axios.get(searchUrl);
    const $ = cheerio.load(response.data);
    const doctors = [];
  
    $('table > tbody > tr').each((i, row) => {
      const doctor = {};
      $(row).find('td').each((j, cell) => {
        switch(j) {
          case 0:
            doctor.nmc_no = $(cell).text().trim();
            break;
        }
      });
      doctors.push(doctor);
    });
  
    return doctors;
  }
  
  async function getNmcNumbers() {
    const response = await axios.get('https://www.nmc.org.np/deregistration');
    const $ = cheerio.load(response.data);
    const nmcNumbers = [];
  
    $('td:nth-child(3)').each((i, element) => {
      const nmcNumber = $(element).text().trim();
      nmcNumbers.push(nmcNumber);
    });
  
    return nmcNumbers;
  }
  getNmcNumbers().then((nmcNumbers) => {
  console.log(nmcNumbers);
});
  
  doctorRouter.post("/doctor/register", async (req, res) => {
    try {
      const { name, email, password, contactno, address, qualification, specialization, experience, nmc_no } = req.body;
  
      const existingDoctor = await Doctor.findOne({ email });
      if (existingDoctor) {
        return res.status(400).json({ msg: "Email already exists!" });
      }
  
      const existingUser = await User.findOne({ email });
      if (existingUser) {
        return res.status(400).json({ msg: "User with same email already exists!" });
      }

      // Check if deregistered doctor
    const nmcNumbers = await getNmcNumbers();
    const nmcNumberExists = nmcNumbers.includes(nmc_no);
    if (nmcNumberExists) {
      return res.status(400).json({ msg: 'Deregistered Doctor!  Please check your nmc number' });
    }
  
      // // Check if the given NMC number exists
      // const doctors = await searchDoctorOnNmc(name, nmc_no, qualification);
      // const foundDoctor = doctors.find(doctor => doctor.nmc_no === nmc_no);
      // if (!foundDoctor) {
      //   return res.status(400).json({ msg: 'Invalid NMC number!' });
      // }
  
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
  
      let user = new User({
        email,
        password: hashedPassword,
        name,
        role: "doctor",
      });
      user = await user.save();
  
      res.json(doctor);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  }); 
  

// async function getNmcNumbers() {
//   try {
//     const response = await axios.get('https://www.nmc.org.np/deregistration');
//     const $ = cheerio.load(response.data);
//     const nmcNumbers = [];

//     $('td:nth-child(3)').each((i, element) => {
//       const nmcNumber = $(element).text().trim();
//       nmcNumbers.push(nmcNumber);
//     });

//     return nmcNumbers;
//   } catch (error) {
//     console.error(error);
//   }
// }

// getNmcNumbers().then((nmcNumbers) => {
//   console.log(nmcNumbers);
// });
//   doctorRouter.post("/doctor/register", async (req, res) => {

//     try {
//         const {name , email, password, contactno, address,qualification, specialization, experience, nmc_no }= req.body;
//         const existingDoctor = await Doctor.findOne({ email });
//         if (existingDoctor) {
//           return res
//             .status(400)
//             .json({ msg: "Email already exists!" });
//         }const existingUser = await User.findOne({ email });
//         if (existingUser) {
//           return res
//             .status(400)
//             .json({ msg: "User with same email already exists!" });
//         }
    
//        // Check if the given NMC number exists
//     const nmcNumbers = await getNmcNumbers();
//     const nmcNumberExists = nmcNumbers.includes(nmc_no);
//     if (nmcNumberExists) {
//       return res.status(400).json({ msg: 'Deregistered Doctor!  Please check your nmc number' });
//     }
//     const searchUrl = `https://www.nmc.org.np/searchPractitioner?name=${name}&nmc=${nmc_no}&degree=${qualification}`;
//   axios.get(searchUrl)
//     .then(response => {
//       const $ = cheerio.load(response.data);
//       const doctors = [];
//       let foundDoctor = false;
  
//       $('table > tbody > tr').each((i, row) => {
//         const doctor = {};
//         $(row).find('td').each((j, cell) => {
//           switch(j) {
//             // case 0:
//             //   doctor.name = $(cell).text().trim();
//             //   break;
//             case 0:
//               doctor.nmc_no = $(cell).text().trim();
//               break;
//             // case 2:
//             //   doctor.qualification = $(cell).text().trim();
//             //   break;
//             // case 3:
//             //   doctor.registrationDate = $(cell).text().trim();
//             //   break;
//             // case 4:
//             //   doctor.validityPeriod = $(cell).text().trim();
//             //   break;
//           }
//         });
//         doctors.push(doctor);
//         if (doctor.nmc_no === nmc_no) {
//           foundDoctor = true;
//         }

//       });
//       if (!foundDoctor) {
//         return res.status(400).json({ msg: 'Practitioner not found' });
//       }
//       console.log(doctors);
      
   
//     })
//     .catch(error => {
//       return(error);
//     });

//     if (nmc_no == "Sorry Practitioner you searched for not found.") {
//       return res.status(400).json({ error: 'Practitioner not found' });
//     }
   
    
//         const hashedPassword = await bcryptjs.hash(password, 8);
    
//         let doctor = new Doctor({
//           email,
//           password: hashedPassword,
//           name,
//           contactno,
//           address,
//           qualification,
//           specialization,
//           experience,
//           nmc_no
//         });
//         doctor = await doctor.save();
//         // user.role = doctor;
//         // await User.save();
//         res.json(doctor);
//         let user = new User({
//           email,
//           password: hashedPassword,
//           name,
//           role: "doctor",
//         });
//         user = await user.save();
//       }
//         // res.json(user);
//        catch (e) {
//         res.status(500).json({ error: e.message });
//       }

// });

// // Gel all doctor
// doctorRouter.get("/api/get-doctors",async(req, res)=>{
//   try {
//     const doctors = await Doctor.find({})
//     res.json(doctors);
    
//   } catch (e) {
//     res.status(500).json({error:e.message});
    
//   }
// });

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
    const { nmc_no } = req.body;
    const response = await fetch(`https://nmc.org.np/api/doctor/${nmc_no}`);
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



doctorRouter.get("/api/get-doctors",async(req, res)=>{
  try {
    const doctors = await Doctor.find({})
    res.json(doctors);
    
  } catch (e) {
    res.status(500).json({error:e.message});
    
  }
});





// get doctor data
doctorRouter.get("/doctor/findbyId", auth, async (req, res) => {
  const doctor = await Doctor.findById(req.doctor);
  if (doctor) {
    res.json({ ...doctor._doc, token: req.token });
  } else {
    res.status(404).json({ message: "Doctor not found" });
  }});

  // This will give token 
  doctorRouter.get("/doctor", auth, async (req, res) => {
    const doctor = await Doctor.find(req.doctor);
    if (doctor) {
      res.json({ ...doctor._doc, token: req.token });
    } else {
      res.status(404).json({ message: "Doctor not found" });
    }});
// const axios = require('axios');
// const cheerio = require('cheerio');

// const checkNMC = async (nmc_no) => {
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
//       if (doctor.nmc_no === nmc_no) {
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

module.exports = doctor;


module.exports = doctorRouter;






// // const user = await User.findOne({ email });

// // if (!user) {
// //     return res.status(400).json({ msg: "User with this email does not exist!" });
// //   }
  
// //   if (user.role === 'doctor' && !user.npc_no) {
// //     return res.status(400).json({ msg: "Doctor credentials not found." });
// //   }
  
// //   const isMatch = await bcryptjs.compare(password, user.password);
  
// //   if (!isMatch) {
// //     return res.status(400).json({ msg: "Incorrect password." });
// //   }


  