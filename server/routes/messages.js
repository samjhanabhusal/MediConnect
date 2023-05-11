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
  const { type, message, time } = req.body;
  const newMessage = new Message({ type, message, time });
  await newMessage.save();
  res.status(201).json(newMessage);
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