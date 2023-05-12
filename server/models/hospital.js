const mongoose = require('mongoose');
const {Bed, bedSchema} = require("./bed");


const hospitalSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true
  },
  email: {
    // required: true,
    type: String,
    trim: true,
    validate: {
      validator: (value) => {
        const re =
          /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
        return value.match(re);
      },
      message: "Please enter a valid email address",
    },
  },
  password: {
    type: String,
    // required: true
  },
  confirmpassword: {
    type: String,
    // required: true
  },
  phone: {
    type: String,
    // required: true
  },
  check:{
    type:Boolean,
    default: false
  },
  // location: {
  //   type: String,
  //   required: true,
  // },
  // bedd: [bedSchema],

  bed: [
  {
    bed: bedSchema,
   
  //   quantity: {
  //     type: Number,
  //     required: true,
  //   },
  },
],
  
});
  // hospital_name: {
  //   type: String,
  //   required: true
  // },
  
  
const Hospital = mongoose.model('Hospital', hospitalSchema);

module.exports = Hospital;

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