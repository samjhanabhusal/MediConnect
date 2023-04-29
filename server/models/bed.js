// const mongoose = require('mongoose');

// const BedSchema = mongoose.Schema({
// 	hospitalId: {
// 		type: mongoose.Schema.Types.ObjectId,
// 		ref: 'Hospital',
// 		required: true,
// 	},
// 	// icuBeds: {
// 	// 	type: Number,
// 	// 	required: true,
// 	// 	default: 0,
// 	//   },
// 	//   ventilatorBeds: {
// 	// 	type: Number,
// 	// 	required: true,
// 	// 	default: 0,
// 	//   },
// 	//   normalBeds: {
// 	// 	type: Number,
// 	// 	required: true,
// 	// 	default: 0,
// 	//   },
// 	status: {
// 		type: Number,
// 		required: true, 
// 	},
// 	type: {
// 		type: Number,
// 		required: true, 
// 	},
	
// });


const mongoose = require('mongoose');

const bedSchema = mongoose.Schema({
  
  hospital_picture: [{
    type: String,
    required: true
  },],
  beds_available: {
    type: Number,
    required: true
  },
  hospital_location: {
    type: String,
    required: true
  },
  location: {
    type: String,
    required: true
  },
  general_ward_total: {
    type: Number,
    required: true
  },
  general_ward_available: {
    type: Number,
    required: true
  },
  VIP_ward_total: {
    type: Number,
    required: true
  },
  VIP_ward_available: {
    type: Number,
    required: true
  },
  ICU_total: {
    type: Number,
    required: true
  },
  ICU_available: {
    type: Number,
    required: true
  },
  ventilators_total: {
    type: Number,
    required: true
  },
  ventilators_available: {
    type: Number,
    required: true
  }
});


// const mongoose = require('mongoose');

// const HospitalSchema = mongoose.Schema({
// 	name: {
// 		type: String,
// 		required: true,
// 	},
// 	location: {
// 		type: String,
// 		required: true,
// 		// unique: true,
// 	},
// 	images: [
// 		{
// 		  type: String,
// 		  required: true,
// 		},
// 	  ],
// 	totalBeds: {
// 		type: Number,
// 		required: true,
// 	},
// 	freeBeds: {
// 		type: Number,
// 		required: true,
// 	},
// 	contact:{
// 		type: number,
// 		required: true,
// 	}
// });

// module.exports = mongoose.model('Hospital', HospitalSchema);
const Bed = mongoose.model('Bed', bedSchema);

module.exports = {Bed, bedSchema};