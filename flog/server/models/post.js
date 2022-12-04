const mongoose = require("mongoose");

const PostSchema = new mongoose.Schema(
  {
    description: {
      type: String,
      required: true,
    },
    title: {
      type: String,
      required: true,
    },
    image: {
      type: String,
    },
    date:{
      type:Date,
      default:Date.now,
    }
  },
  { timestamps: true }
);

module.exports = mongoose.model("Post", PostSchema);
