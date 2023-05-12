// const { addMessage, getMessages } = require("../middlewares/messages");
// // const admin = require("../middlewares/admin");

// const messagesrouter = require("express").Router();

// messagesrouter .post("/addmsg/", addMessage);
// messagesrouter .post("/getmsg/", getMessages);

// module.exports = messagesrouter ;








// lama

const express = require("express");
const Message = require("../models/messages");
const messageRouter = express.Router();
//add
messageRouter.post("/messages", async (req, res) => {

 try {
  const { type, message, time, sourceId, targetId } = req.body;
console.log("dlkjflskdjfs");
  let newMessage = new Message({ 
    type, message, time, sourceId, targetId,
   });
   console.log("dlkjflskdjfs");

   newMessage = await newMessage.save();
   console.log("dlkjflskdjfs");

   res.json(newMessage);
   console.log("dlkjflskdjfs");
  console.log(newMessage);
 } catch (e) {
  res.status(500).json({ error: e.message });
 }

});
messageRouter.post("/", async (req, res) => {
  const newMessage = new Message(req.body);

  try {
    const savedMessage = await newMessage.save();
    res.status(200).json(savedMessage);
  } catch (err) {
    res.status(500).json(err);
  }
});

//get

messageRouter.get("/:conversationId", async (req, res) => {
  try {
    const messages = await Message.find({
      conversationId: req.params.conversationId,
    });
    res.status(200).json(messages);
  } catch (err) {
    res.status(500).json(err);
  }
});

module.exports = messageRouter;