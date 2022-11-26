const mongoose = require("mongoose");

const profileSchema = new mongoose.Schema(

// const Profile = profileSchema(
  {
    // name: {
    //   type: String,
    //   required: true,
    //   unique: true,
    // },
    firstname: String,
    lastname: String,
    // profession: String,
    age: Number,
    // image: String,
    gender: String,
    address:String,
    phoneno:Number,
    // status: {
    //   type:String,
    //   default:false
    // },
    userId:{
      type:String,
      required:true
    }
  },
  {
    timestamp: true,
  }
);
const Profile = mongoose.model('Profile', profileSchema);
module.exports = {Profile, profileSchema};
// module.exports = mongoose.model("Profile", Profile);




