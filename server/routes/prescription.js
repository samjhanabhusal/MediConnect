// const express = require("express");
// const router = express.Router();
// const multer = require("multer");
// const path = require("path");
// const auth = require("../middlewares/auth");
// // const prescription = require("../models/prescription");
// const Prescription = require("../models/prescription");

// const prescriptionRouter = express.Router();

// const storage = multer.diskStorage({
//   destination: (req, file, cb) => {
//     cb(null, "./uploads");
//   },
  
//   filename: (req, file, cb) => {
//         //   cb(null,req.body.username)
//     cb(null, req.decoded.name + ".jpg");
//   },
// });
// // console.log("flajdlfakj");
// const fileFilter = (req, file, cb) => {
//   if (file.mimetype == "prescription/jpeg" || file.mimetype == "image/png") {
//     cb(null, true);
//   } else {
//     cb(null, false);
//   }
// };

// const upload = multer({
//   storage: storage,
//   limits: {
//     fileSize: 1024 * 1024 * 6,
//   },
//   // fileFilter: fileFilter,
// });

// //adding and update profile image
// prescriptionRouter.patch("/add/prescription",auth, upload.single("img"), (req,res)=>{
// // router
// //   .route("/add/prescription")
// //   .patch(middleware.checkToken, upload.single("img"), (req, res) => {
//     Prescription.findOneAndUpdate(
//       { name: req.decoded.name },
//     //   console.log{username};
//       {
//         $set: {
//           img: req.file.path,
//         },
//       },
      
//       { new: true },
//       (err, prescription) => {
//         // console.log("dfklsjljdlfjlsjlfjslli 12555")
//         if (err) return res.status(500).send(err);
//         const response = {
//           message: "image added successfully updated",
//           data: prescription,
//         };
//         return res.status(200).send(response);
//       }
//     );
//   });


//   prescriptionRouter.post("/add", auth, (req,res)=>{
//     const namedecoded = req.decoded.name;
//     console.log(name)

// //   router.route("/add").post(middleware.checkToken, (req, res) => {
//     const prescription = Prescription({
//         // name: req.decoded.name,
//         testname: req.body.testname,
//         name: req.decoded.name,

//     //   profession: req.body.profession,
//     //   DOB: req.body.DOB,
//     //   titleline: req.body.titleline,
//     //   about: req.body.about,
//     });
//     console.log("This is beautiful");
//     prescription
//       .save()
      
//       .then(() => {
//         console.log("This is beautiful");

//         return res.json({ msg: "prescription successfully stored" });
//       })
//       .catch((err) => {
//         console.log("This is beautiful");

//         return res.status(400).json({ err: err });
//       });
//   });
  
//   module.exports = prescriptionRouter;

