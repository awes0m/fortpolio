const express = require('express');
const dotenv = require('dotenv')
const mongoose = require('mongoose')

const app = express();
app.use(express.json());
dotenv.config();
const port = process.env.PORT || 5000


//routers
const authRoute = require('./routes/auth');


//DB Config
mongoose.connect(process.env.URL).then(()=>console.log("Db Connected")).catch((e)=>console.log(e));

//Middleware
app.use("/api/auth",authRoute);


//API Endpoints

//Listener
app.listen(port, () => console.log(`Listening on localhost:${port}`));