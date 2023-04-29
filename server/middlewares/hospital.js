// const jwt = require("jsonwebtoken");
// const User = require("../models/user");
// const auth = require("./auth");

// const hospital = async (req, res, next) => {
//   try {
//     // const authHeader = req.header("x-auth-token");
//     // const token = authHeader.split(" ")[1];
//     const token = req.header("x-auth-token");
//     if (!token)
//       return res.status(401).json({ msg: "No auth token, access denied" });

//     const verified = jwt.verify(token, "passwordKey");
//     if (!verified)
//       return res
//         .status(401)
//         .json({ msg: "Token verification failed, authorization denied." });
//     const user = await User.findById(verified.id);
//     if (user.type == "user" || user.type == "admin" || user.type == "doctor") {
//       return res.status(401).json({ msg: "You are not an Hospital Admin!" });
//     }
//     req.user = verified.id;
//     req.token = token;
//     next();
//   } catch (err) {
//     res.status(500).json({ error: err.message });
//   }
// };



















const jwt = require('jsonwebtoken');
const User = require("../models/user");
// const User = require("../models/user");

const hospital = async(req,res,next)=>{
    try {
        const token = req.header("x-auth-token");
    
        if (!token)
          return res.status(401).json({ msg: "No auth token, access denied" });
    
        const verified = jwt.verify(token, "passwordKey");
        if (!verified)
          return res
            .status(401)
            .json({ msg: "Token verification failed, authorization denied." });
        
        const user = await User.findById(verified.id);
        if (user.role == "user" || user.role == "admin" || user.type == "doctor") {
            return res.status(401).json({ msg: "You are not an Hospital Admin!" });
        }  
        req.user = verified.id;
        req.token = token;
        next();
        
        } catch (err) {
             res.status(500).json({ error: err.message });
    }
};

module.exports= hospital;
