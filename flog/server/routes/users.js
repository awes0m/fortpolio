const router = require("express").Router();

const User = require("../models/User");
const bcrypt = require("bcrypt");

// Update User
router.post("/:id", async (req, res) => {
   if (req.body.userId === req.params.id){
    if(req.body.password){
      const salt = await bcrypt.genSalt(10)
    }
    try {
     
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
  
}
else{
  res.status(401).json({ "msg": "You can only update your account" });

}
});

//Delete

module.exports = router;
