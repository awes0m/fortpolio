const router = require("express").Router();
const bcryptjs = require("bcryptjs");

const User = require("../models/User");

// Update User
router.post("/:id", async (req, res) => {
  try {
    
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//Login

module.exports = router;
