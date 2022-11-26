// const mongoose = require("mongoose");

// const prescriptionSchema = new mongoose.Schema({
//     name:{
//         type:String,
//         required: true,
//         unique:true,
//     },
//   testname: String,
//   img: {
//     // data: Buffer,
//     // contentType: String,
//     type: String,
//     default:"",
//   },
  
// },{timestamps: true});
// const Prescription = mongoose.model('Prescription', prescriptionSchema);
// module.exports = Prescription;
const mongoose = require("mongoose");

const prescriptionSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
    trim: true,
  },
  description: {
    type: String,
    required: true,
    trim: true,
  },
  images: [
    {
      type: String,
      required: true,
    },
  ],
  age: {
    type: Number,
    required: true,
  },
  userId:{
    type:String,
    required:true
  }
  
},{timestamps: true});
const Prescription = mongoose.model('Prescription', prescriptionSchema);
module.exports = {Prescription, prescriptionSchema};