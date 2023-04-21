const jwt = require("jsonwebtoken");
const User = require("../models/user");
const auth = require("./auth");

const doctor = async (req, res, next) => {
  try {
    // const authHeader = req.header("x-auth-token");
    // const token = authHeader.split(" ")[1];
    const token = req.header("x-auth-token");
    if (!token)
      return res.status(401).json({ msg: "No auth token, access denied" });

    const verified = jwt.verify(token, "passwordKey");
    if (!verified)
      return res
        .status(401)
        .json({ msg: "Token verification failed, authorization denied." });
    const user = await User.findById(verified.id);
    if (user.type == "user" || user.type == "admin" || user.type == "hospital") {
      return res.status(401).json({ msg: "You are not an doctor!" });
    }
    req.user = verified.id;
    req.token = token;
    next();
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

authRouter.post("/api/check-npc", async (req, res) => {
  try {
    const { npc_no } = req.body;
    const response = await fetch(`https://nmc.org.np/api/doctor/${npc_no}`);
    const data = await response.json();
    if (!data || data.length === 0) {
      return res.status(400).json({ msg: "Invalid NPC number." });
    }
    // If the response contains valid data, return it to the client
    res.json(data);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

const axios = require('axios');
const cheerio = require('cheerio');

const checkNMC = async (name) => {
  try {
    const url = `https://www.nmc.org.np/deregistration`;
    const response = await axios.get(url);
    const html = response.data;
    const $ = cheerio.load(html);
    const json = $('script[type="application/json"]').html();
    const data = JSON.parse(json);
    const deregisteredDoctors = data.deregisteredDoctors;
    for (let i = 0; i < deregisteredDoctors.length; i++) {
      const doctor = deregisteredDoctors[i];
      if (doctor.name === name) {
        return doctor.nmc_no;
      }
    }
    return 'Doctor not found';
  } catch (error) {
    console.error(error);
    return 'Error occurred';
  }
};

// Usage
checkNMC('Doctor Name')
  .then(nmc_no => console.log(nmc_no))
  .catch(error => console.log(error));

module.exports = doctor;
