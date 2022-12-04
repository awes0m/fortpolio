const express = require('express');
const mongoose = require('mongoose');
const dotenv = require("dotenv");
const path = require('path')

//App Config
const app = express()
const port = process.env.PORT || 5000

//routes
const authRoute = require('./middleware/auth')
const postRoute = require('./middleware/post')

//DB Config
dotenv.config();

//Database Connection 
mongoose.connect(process.env.URL).then(console.log("Db Connected")).catch((err) =>console.log(err));

//Middleware
app.use(express.json());
app.use('/api/blog',authRoute);
app.use('api/blog/posts',postRoute);


//API Endpoints

//Listener
app.listen(port, () => console.log(`Listening on localhost: ${port}`))