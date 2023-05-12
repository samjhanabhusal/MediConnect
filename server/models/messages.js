// // const mongoose = require("mongoose");

// // const MessageSchema = mongoose.Schema(
// //   {
// //     message: {
// //       text: { type: String, required: true },
// //     },
// //     users: Array,
// //     sender: {
// //       type: mongoose.Schema.Types.ObjectId,
// //       ref: "User",
// //       required: true,
// //     },
// //     recipient: {
// //       type: mongoose.Schema.Types.ObjectId,
// //       ref: 'User',
// //       required: true
// //     },
// //     createdAt: {
// //       type: Date,
// //       default: Date.now
// //     }
// //   },
// //   {
// //     timestamps: true,
// //   }
// // );

// // module.exports = mongoose.model("Messages", MessageSchema);
















// // lama
// const mongoose = require("mongoose");

// const MessageSchema = new mongoose.Schema(
//   {
//     conversationId: {
//       type: String,
//     },
//     sender: {
//       type: String,
//     },
//     text: {
//       type: String,
//     },
//   },
//   { timestamps: true }
// );

// module.exports = mongoose.model("Message", MessageSchema);




const mongoose = require("mongoose");

const messageSchema = new mongoose.Schema({
  type: String,
  message: String,
  time: String,
  sourceId: String,
  targetId: String,
});

const Message = mongoose.model("Message", messageSchema);

module.exports = Message;
