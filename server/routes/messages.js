const { addMessage, getMessages } = require("../middlewares/messages");
// const admin = require("../middlewares/admin");

const messagesrouter = require("express").Router();

messagesrouter .post("/addmsg/", addMessage);
messagesrouter .post("/getmsg/", getMessages);

module.exports = messagesrouter ;