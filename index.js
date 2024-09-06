const express = require("express");
const app = express();
const coursesRouter = require('./Router/Courses-routers')
const homeRouter = require('./Router/Home-routers')

app.use(express.json());




app.use('/', homeRouter);

app.use('/api/courses' , coursesRouter);




app.listen(3000,()=>{console.log("Poert 3000 is Lisiner")})
