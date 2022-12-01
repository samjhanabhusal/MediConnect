const mongoose = require("mongoose");
const { productSchema } = require("./product");
const  {prescriptionSchema}  = require("./prescription");
const { profileSchema } = require("./profile");

const userSchema = mongoose.Schema({
  name: {
    required: true,
    type: String,
    trim: true,
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
    required: true,
    type: String,
  },
  address: {
    type: String,
    default: "",
  },
  contactno: {
    type: String,
    default: "",
  },
  type: {
    type: String,
    default: "user",
  },
  is_verified:{
    type:Number,
    default: 0,
  },
  cart: [
    {
      product: productSchema,
      quantity: {
        type: Number,
        required: true,
      },
    },
  ],
  // prescription: [
  //   {
  //     product: prescriptionSchema,
  //     quantity: {
  //       type: Number,
  //       required: true,
  //     },
  //   },
  // ],
  prescription: [
    {
      prescription: prescriptionSchema,
     
    //   quantity: {
    //     type: Number,
    //     required: true,
    //   },
    },
  ],
  profiles:[
    {
      profile: profileSchema
    }
  ]
});

const User = mongoose.model("User", userSchema);
module.exports = User;
