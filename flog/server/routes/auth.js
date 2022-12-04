const router = require("express").Router();
const bcryptjs = require("bcryptjs");

const User = require("../models/User");

// Register User
router.post("/register", async (req, res) => {
  try {
    const { username, email, password } = req.body;
    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res
        .status(400)
        .json({ msg: "User with same email already exists!" });
    }
    const salt = await bcryptjs.genSalt(8);
    const hashedPassword = await bcryptjs.hash(password, salt);
    let newUser = new User({
      username,
      email,
      password: hashedPassword,
    });
    newUser = await newUser.save();
    res.status(200).json(newUser);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//Login
router.post("/login", async (req, res) => {
  try {

    const user = await User.findOne({ username:req.body.username });
    if(!user ){
        return res.status(400).json({ msg: "Username dosent exits" });
    }

    const validate = await bcryptjs.compare(req.body.password, user.password);
    if(!validate){
       return res.status(400).json({ msg: "Wrong Credentials" });
    }

    const {password, ...others} = user._doc;
    res.status(200).json(others);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = router;
