const express = require('express');
const Hospital = require('../models/hospital');
const {Bed} = require('../models/bed');
const hospitalRouter = express.Router();
const hospital = require('../middlewares/hospital');
const auth = require('../middlewares/auth');
const User = require('../models/user');
const bcryptjs = require("bcryptjs");
// const verify = require('../config/verifyToken');



const axios = require('axios');
const cheerio = require('cheerio');

// async function getHospitals() {
//   try {
//     const response = await axios.get('https://nepal.gov.np:8443/NationalPortal/view-page?id=31');
//     const $ = cheerio.load(response.data);
//     const hospitals = [];

//     $('.sub_list > ul > li').each((i, element) => {
//       const hospital = $(element).text().trim();
//       hospitals.push(hospital);
//     });

//     return hospitals;
//   } catch (error) {
//     console.error(error);
//   }
// }

// getHospitals().then((hospitals) => {
//   console.log(hospitals);
// });

async function getHospitals(){
	const url = 'https://nepalipedia.com/hospitals/list-of-hospitals-in-kathmandu-nepal/';
	const response = await axios.get(url);
	const $ = cheerio.load(response.data);
	const hospitals = [];
  
	$('table tr').each((i, row) => {
	  const hospital = {};
	  $(row).find('td').each((j, cell) => {
		switch(j) {
		  case 0:
			hospital.name = $(cell).text().trim();
			break;
		  case 1:
			hospital.address = $(cell).text().trim();
			break;
		  case 2:
			hospital.contact = $(cell).text().trim();
			break;
		}
	  });
	  if (Object.keys(hospital).length !== 0) {
		hospitals.push(hospital);
	  }
	});
  
	return hospitals;
  }
  

hospitalRouter.post("/hospital/register", async (req, res) => {
	try {
		const { name,email,password} = req.body;
		const existingHospital = await Hospital.findOne({email});
		if (existingHospital) {
			return res
				.status(400)
				.json({ msg: 'Hospital exists' });
		}const existingUser = await User.findOne({ email });
        if (existingUser) {
          return res
            .status(400)
            .json({ msg: "User with same email already exists!" });
        }
 // Check if the hospital name provided by the user matches any of the scraped hospital names
 const hospitals = await getHospitals();
 console.log(hospitals);
 console.log(hospitals.length);
 const hospitalExists = hospitals.some((hospital) => name.toLowerCase() === hospital.name.toLowerCase());
 if (!hospitalExists) {
   return res.status(400).json({ msg: 'Hospital not found' });
 }

		const hashedPassword = await bcryptjs.hash(password, 8);
		let hospital = new Hospital({
			// hospital_name,
			name,
			email,
			password,
			

		})
		hospital = await hospital.save();
		res.json(hospital);
        let user = new User({
			_id : hospital.id,
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
})

//Get all hospitals
hospitalRouter.get("/api/get-hospitals",async(req, res)=>{
	try {
	  const hospitals = await Hospital.find({})
	  res.json(hospitals);
	// const hospitals = await Hospital.find({}).populate('bedd');
	// const hospitals = await Hospital.find({}, { bedd: 1 }); // include only the bedd field
    // res.json(hospitals);

	  
	} catch (e) {
	  res.status(500).json({error:e.message});
	  
	}
  });


  hospitalRouter.get('/api/beds/',auth, async(req, res) => {
	// const hospitalId = req.params.id;
  
	// Query the database for the hospital data
	try {
		const bed = await Bed.find({hospitalId:req.query.hospitalId});
		// if (!bed) {
		//   return res.status(404).send('Bed not found');
		// }
		res.json(bed);
		
	  } catch (e) {
		res.status(500).json({error:e.message});
		
	  }
	});
  
 //find a specific hospital by id
  hospitalRouter.get("/api/hospitals/:id",async(req, res)=>{
	try {
	  const hospital = await Hospital.findById(req.params.id);
	  if (!hospital) {
		return res.status(404).send('Hospital not found');
	  }
	  res.json(hospital);
	  
	} catch (e) {
	  res.status(500).json({error:e.message});
	  
	}
  });


//   Add hopital_bed information
hospitalRouter.post("/hospital/add-beds",hospital, auth, async (req, res) => {
	try {
	 
		const { hospital_picture, beds_available,hospital_location, location, general_ward_total,general_ward_available,
			VIP_ward_total,VIP_ward_available,ICU_total,ICU_available,ventilators_total,ventilators_available
		    } = req.body;
		
			// let user = await User.findById(req.user);
			// // let bed = awaid Bed.find({hospitalId : user.id})
			// const existingBed = await Bed.findOne({hospitalId});
			// if(existingBed){
			// 	return res
			// 	.status(400)
			// 	.json({ msg: "Bed  already added Now you can edit them!" });
			// }
		let bed = new Bed({
			// hospital_name,
			hospitalId:req.user,
			hospital_picture,
			beds_available,
			hospital_location,
			location,
			general_ward_total,
			general_ward_available,
			VIP_ward_total,
			VIP_ward_available,
			ICU_total,
			ICU_available,
			ventilators_total,
			ventilators_available,

		});
		bed = await bed.save();
    res.json(bed);
	} catch (e) {
	  res.status(500).json({ error: e.message });
	}
  });
  
  // Get all your beds
  hospitalRouter.get("/hospital/get-beds", async (req, res) => {
	try {
	  const beds = await Bed.find({});
	  res.json(beds);
	} catch (e) {
	  res.status(500).json({ error: e.message });
	}
  });
//   Hospital Get me
hospitalRouter.get("/api/hospital/me", auth, async (req, res) => {
	try {
	  const hospital = await Hospital.find({ userId: req.user });
	  res.json(hospital);
	} catch (e) {
	  res.status(500).json({ error: e.message });
	}
  });
  // Delete the bed
  hospitalRouter.post("/hospital/delete-bed", hospital, async (req, res) => {
	try {
	  const { id } = req.body;
	  let bed = await Bed.findByIdAndDelete(id);
	  res.json(bed);
	} catch (e) {
	  res.status(500).json({ error: e.message });
	}
  });
  
  

//Update the hospital info
  hospitalRouter.put('/api/hospitals/:id',auth, async (req, res) => {
	try{
	 const hospital = await Hospital.findByIdAndUpdate(req.params.id, req.body, { new: true });
	 if (!hospital) {
		return res.status(404).send('Hospital not found');
	  }
	//   .then((hospital) => {
	// 	if (!hospital) {
		//   res.status(404).send('Hospital not found');
		// } else {
		  res.json(hospital);
		}
	//   })
	  catch(e){
		res.status(500).json({error:e.message});
	  }
  });
 
  hospitalRouter.delete('/api/hospitals/:id',auth,async (req,res)=>{
	try{
       const hospital = await Hospital.findByIdAndDelete(req.params.id)
	   if (!hospital) {
		return res.status(404).send('Hospital not found');
	  }
	   res.json(hospital);

	}catch(e){
		res.status(500).json({error:e.message});
	}
  });
  hospitalRouter.put("/hospital/update/bed",hospital, async (req, res) => {
	let bed = {};
	// await Bed.findOne({ userId: req.user }, (err, result) => {
	//   if (err) {
	//     bed = {};
	//   }
	//   if (result != null) {
	//     bed = result;
	//   }
	// });
	 Bed.findOneAndUpdate(
	  // { username: req.decoded.username },
	  { userId: req.user },
	  {
		$set: {
		  // hospital_picture:req.body.hospital_picture
		  hospital_picture: req.body.hospital_picture ? req.body.hospital_picture : bed.hospital_picture,
		  beds_available: req.body.beds_available ? req.body.beds_available : bed.hospital_picture,
		  hospital_location: req.body.hospital_location
			? req.body.hospital_location
			: bed.hospital_location,
		  general_ward_total: req.body.general_ward_total ? req.body.general_ward_total : bed.general_ward_total,
		  general_ward_available: req.body.general_ward_available ? req.body.general_ward_available : bed.general_ward_available,
		  VIP_ward_total: req.body.VIP_ward_total ? req.body.VIP_ward_total : bed.VIP_ward_total, //about:""
		  VIP_ward_available: req.body.VIP_ward_available ? req.body.VIP_ward_total : bed.VIP_ward_total, //about:""
		  ICU_total: req.body.ICU_total ? req.body.VIP_ward_total : bed.VIP_ward_total, //about:""
		  ICU_available: req.body.ICU_available ? req.body.VIP_ward_total : bed.VIP_ward_total, //about:""
		  ventilators_total: req.body.ventilators_total ? req.body.VIP_ward_total : bed.VIP_ward_total, //about:""
		  ventilators_available: req.body.ventilators_available ? req.body.VIP_ward_total : bed.VIP_ward_total, //about:""
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

  
// get hospital data
hospitalRouter.get("/hospital", auth, async (req, res) => {
	const hospital = await Hospital.findById(req.hospital);
	if(hospital){res.json({ ...hospital._doc, token: req.token });}
	else {
		res.status(404).json({ message: "Doctor not found" });}
  });

  module.exports = hospitalRouter;
//   module.exports= hospital;

// router.post('/add', async (req, res) => {
// 	try {
// 		const { name, VIP_ward_total, totalBeds, freeBeds, city } = req.body;
// 		const { name, VIP_ward_available, totalBeds, freeBeds, city } = req.body;
// 		const { name, ICU_total, totalBeds, freeBeds, city } = req.body;
// 		const { name, ICU_available, totalBeds, freeBeds, city } = req.body;
// 		const { name, ventilators_total, totalBeds, freeBeds, city } = req.body;
// 		const { name, ventilators_available, totalBeds, freeBeds, city } = req.body;
// 		const sameHospital = await Hospital.findOne({ VIP_ward_total: VIP_ward_total });
// 		const sameHospital = await Hospital.findOne({ VIP_ward_total: VIP_ward_total });
// 		const sameHospital = await Hospital.findOne({ VIP_ward_available: VIP_ward_available });
// 		const sameHospital = await Hospital.findOne({ VIP_ward_available: VIP_ward_available });
// 		const sameHospital = await Hospital.findOne({ ICU_total: ICU_total });
// 		const sameHospital = await Hospital.findOne({ ICU_total: ICU_total });
// 		const sameHospital = await Hospital.findOne({ ICU_available: ICU_available });
// 		const sameHospital = await Hospital.findOne({ ICU_available: ICU_available });
// 		const sameHospital = await Hospital.findOne({ ventilators_total: ventilators_total });
// 		const sameHospital = await Hospital.findOne({ ventilators_total: ventilators_total });
// 		const sameHospital = await Hospital.findOne({ ventilators_available: ventilators_available });
// 		if (sameHospital) res.status(400).json({ err: 'Hospital exists' });
// 		const newHospital = Hospital({
// 			name,
// 			VIP_ward_total,
// 			VIP_ward_available,
// 			ICU_total,
// 			ICU_available,
// 			ventilators_total,
// 			ventilators_available,
// 			totalBeds,
// 			freeBeds,
// 			city
// 		});
// 		await newHospital.save();
// 		res.status(200).send('Hospital Added');
// 	} catch (err) {
// 		res.status(400).json({ err });
// 	}
// });

// Import required packages
// const express = require('express');
// const bodyParser = require('body-parser');
// const mongoose = require('mongoose');

// // Connect to MongoDB database
// mongoose.connect('mongodb://localhost/hospital', { useNewUrlParser: true })
//   .then(() => console.log('MongoDB connected'))
//   .catch(err => console.log(err));

// // Create a schema for the hospital
// const hospitalSchema = new mongoose.Schema({
//   hospital_name: String,
//   hospital_picture: String,
//   beds_available: Number,
//   hospital_location: String,
//   location1: String,
//   general_ward_total: Number,
//   general_ward_available: Number,
//   VIP_ward_total: Number,
//   VIP_ward_available: Number,
//   ICU_total: Number,
//   ICU_available: Number,
//   ventilators_total: Number,
//   ventilators_available: Number
// });

// // Create a model for the hospital
// const Hospital = mongoose.model('Hospital', hospitalSchema);

// // Create an instance of Express
// const app = express();

// // Configure middleware to parse JSON requests
// app.use(bodyParser.urlencoded({ extended: true }));
// app.use(bodyParser.json());

// // Define API routes for the hospital
// app.post('/api/hospitals', (req, res) => {
//   const hospital = new Hospital(req.body);
//   hospital.save()
//     .then(() => {
//       res.status(201).send(hospital);
//     })
//     .catch((err) => {
//       res.status(400).send(err);
//     });
// });

// app.get('/api/hospitals/:hospital_id', (req, res) => {
//   Hospital.findById(req.params.hospital_id)
//     .then((hospital) => {
//       if (!hospital) {
//         res.status(404).send('Hospital not found');
//       } else {
//         res.send(hospital);
//       }
//     })
//     .catch((err) => {
//       res.status(400).send(err);
//     });
// });

// app.put('/api/hospitals/:hospital_id', (req, res) => {
//   Hospital.findByIdAndUpdate(req.params.hospital_id, req.body, { new: true })
//     .then((hospital) => {
//       if (!hospital) {
//         res.status(404).send('Hospital not found');
//       } else {
//         res.send(hospital);
//       }
//     })
//     .catch((err) => {
//       res.status(400).send(err);
//     });
// });

// app.delete('/api/hospitals/:hospital_id', (req, res) => {
//   Hospital.findByIdAndDelete(req.params.hospital_id)
//     .then((hospital) => {
//       if (!hospital) {
//         res.status(404).send('Hospital not found');
//       } else {
//         res.send(hospital);
//       }
//     })
//     .catch((err) => {
//       res.status(400).send(err);
//     });
// });

// app.get('/api/hospitals', (req, res) => {
//   Hospital.find()
//     .then((hospitals) => {
//       res.send(hospitals);
//     })
//     .catch((err) => {
//       res.status(400).send(err);
//     });
// });

// // Start the server
// app.listen(3000, () => console.log('Server started on port 3000'));