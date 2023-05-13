// const mongoose = require('mongoose');

// const BedSchema = mongoose.Schema({
// 	hospitalId: {
// 		type: mongoose.Schema.Types.ObjectId,
// 		ref: 'Hospital',
// 		required: true,
// 	},
// 	// icuBeds: {
// 	// 	type: String,
// 	// 	required: true,
// 	// 	default: 0,
// 	//   },
// 	//   ventilatorBeds: {
// 	// 	type: String,
// 	// 	required: true,
// 	// 	default: 0,
// 	//   },
// 	//   normalBeds: {
// 	// 	type: String,
// 	// 	required: true,
// 	// 	default: 0,
// 	//   },
// 	status: {
// 		type: String,
// 		required: true, 
// 	},
// 	type: {
// 		type: String,
// 		required: true, 
// 	},
	
// });


const mongoose = require('mongoose');
// const {hospitalSchema} = require('./hospital');

const bedSchema = mongoose.Schema({
  // hospital: {
  //   type: mongoose.Schema.Types.ObjectId,
  //   ref: 'Hospital',
  //   required: true,
  // },
  hospitalId: {
    type: String,
    required:true,
    },
  //   bedType: {
  //   type: String,
  //   enum: ['General', 'ICU', 'Ventilator'],
  //   required: true,
  // },
  // bedCount: {
  //   type: Number,
  //   default: 0,
  //   required: true,
  // },
  hospital_picture: [{
    type: String,
    // required: true
  },],

  beds_available: {
    type: String,
    // required: true
  },
  hospital_location: {
    type: String,
    // required: true
  },
  location: {
    type: String,
    // required: true
  },
  general_ward_total: {
    type: String,
    // required: true
  },
  general_ward_available: {
    type: String,
    // required: true
  },
  VIP_ward_total: {
    type: String,
    // required: true
  },
  VIP_ward_available: {
    type: String,
    // required: true
  },
  ICU_total: {
    type: String,
    // required: true
  },
  ICU_available: {
    type: String,
    // required: true
  },
  ventilators_total: {
    type: String,
    // required: true
  },
  ventilators_available: {
    type: String,
    // required: true
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
// 		type: String,
// 		required: true,
// 	},
// 	freeBeds: {
// 		type: String,
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