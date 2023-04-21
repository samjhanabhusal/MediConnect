// // const mongoose = require("mongoose");

// // const doctorSchema = mongoose.Schema ({
// //     name: {
// //         required: true,
// //         type: String,
// //         trim: true,
// //       },
// //       email: {
// //         required: true,
// //         type: String,
// //         trim: true,
// //         validate: {
// //           validator: (value) => {
// //             const re =
// //               /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
// //             return value.match(re);
// //           },
// //           message: "Please enter a valid email address",
// //         },
// //       },
// //       password: {
// //         required: true,
// //         type: String,
// //       },
// //       address: {
// //         type: String,
// //         default: "",
// //       },
// //       contactno: {
// //         type: String,
// //         default: "",
// //       },
// //       type: {
// //         type: String,
// //         default: "doctor",
// //       },
      
// //       profiles:[
// //         {
// //           profile: profileSchema
// //         }
// //       ]
// //     });
    
// // const Doctor = mongoose.model("Doctor", doctorSchema);
// // module.exports =  Doctor;


const mongoose = require('mongoose');

const doctorSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true
  },
  email: {
    required: true,
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
    required: true
  },
  contactno: {
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
    type: String,
    required: true
  },
  nmc_no:{
    type: Number,
    required: true
    
  },
//   hospital: {
//     type: mongoose.Schema.Types.ObjectId,
//     ref: 'Hospital',
//     required: true
//   },
  availableDays: {
    type: [String]
    // required: true,
  },
  availableTimeSlots: {
    type: [[String]]
    // required: true,
  },
//   consultationMode: {
//     type: String,
//     enum: ['in-person', 'online', 'both'],
//     default: 'both',
//     required: true,
//   },
//   rating: {
//     type: Number,
//     default: 0,
//   },
//   reviews: {
//     type: [
//       {
//         patient: {
//           type: mongoose.Schema.Types.ObjectId,
//           ref: 'Patient',
//         },
//         rating: {
//           type: Number,
//           required: true,
//         },
//         reviewText: {
//           type: String,
//           required: true,
//         },
//         date: {
//           type: Date,
//           default: Date.now,
//         },
//       },
//     ],
//     default: [],
//   },
//   consultations: {
//     type: [
//       {
//         patient: {
//           type: mongoose.Schema.Types.ObjectId,
//           ref: 'Patient',
//         },
//         date: {
//           type: Date,
//           default: Date.now,
//         },
//         duration: {
//           type: Number,
//           required: true,
//         },
//         mode: {
//           type: String,
//           enum: ['in-person', 'online'],
//           required: true,
//         },
//         fee: {
//           type: Number,
//           required: true,
//         },
//         prescription: {
//           type: String,
//           default: '',
//         },
//       },
//     ],
//     default: [],
//   },
});

// module.exports = mongoose.model('Doctor', doctorSchema);

// module.exports = mongoose.model('Doctor', doctorSchema);
const Doctor = mongoose.model('Doctor', doctorSchema);
module.exports = {Doctor, doctorSchema};

















// const mongoose = require('mongoose');

// const doctorSchema = new mongoose.Schema({
//   name: String,
//   email: String,
//   password: String,
//   contactno: String,
//   address: String,
//   qualification: String,
//   specialization: String,
//   experience: String,
//   nmc_no: String
// });

// const Doctor = mongoose.model('Doctor', doctorSchema);

// module.exports = Doctor;





