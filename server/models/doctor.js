// const mongoose = require("mongoose");

// const doctorSchema = mongoose.Schema ({
//     name: {
//         required: true,
//         type: String,
//         trim: true,
//       },
//       email: {
//         required: true,
//         type: String,
//         trim: true,
//         validate: {
//           validator: (value) => {
//             const re =
//               /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
//             return value.match(re);
//           },
//           message: "Please enter a valid email address",
//         },
//       },
//       password: {
//         required: true,
//         type: String,
//       },
//       address: {
//         type: String,
//         default: "",
//       },
//       contactno: {
//         type: String,
//         default: "",
//       },
//       type: {
//         type: String,
//         default: "doctor",
//       },
      
//       profiles:[
//         {
//           profile: profileSchema
//         }
//       ]
//     });
    
// const Doctor = mongoose.model("Doctor", doctorSchema);
// module.exports =  Doctor;


const mongoose = require('mongoose');

const doctorSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true
  },
  email: {
    type: String,
    required: true,
    unique: true
  },
  password: {
    type: String,
    required: true
  },
  phone: {
    type: String,
    required: true
  },
  address: {
    type: String,
    required: true
  },
  qualification: {
    type: String,
    required: true
  },
  specialization: {
    type: String,
    required: true
  },
  experience: {
    type: Number,
    required: true
  },
  hospital: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Hospital',
    required: true
  }
}, {
  timestamps: true
});

module.exports = mongoose.model('Doctor', doctorSchema);
