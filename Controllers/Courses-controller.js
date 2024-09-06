const CourseModel = require('../Models/mssql_database')

const getCourses = (req,res)=>{
    CourseModel.getCourses().then(
        (result) =>{

           res.send(result)
        }
       )
}

const getCourse = (req,res)=>{

    CourseModel.getCourse(Number(req.params.id)).then(
     (result) =>{
        if(!result || result.length===0) return res.status(404).send("any thing not found !")
        res.send(result)
     }
    )
    
}

const insertCourse = (req,res)=>{
    if(!req.body.name || req.body.name.length <3)
       return res.status(400).send("name is required and more than 2 characters !")

       CourseModel.insertCourse(req.body.name).then(
        (result) =>{
            res.send(result)
        }
       )

}

const updateCourse = (req,res)=>{

    CourseModel.getCourse(Number(req.params.id)).then(
        (result) =>{
           if(!result || result.length===0) return res.status(404).send("any thing not found !")
           if(!req.body.name || req.body.name.length <3)
           return res.status(400).send("name is required and more than 2 characters !")
    
        CourseModel.updateCourse(Number(req.params.id),req.body.name).then(
            (result) =>{
                res.send(result)
            }
           )
        }
       )

}

const deleteCourse = (req,res)=>{
    CourseModel.getCourse(Number(req.params.id)).then(
        (result) =>{
           if(!result || result.length===0) return res.status(404).send("any thing not found !")
    
        CourseModel.deleteCourse(Number(req.params.id)).then(
            (result) =>{
                res.send(result)
            }
           )
        }
       )

}

module.exports = {
    getCourses,
    getCourse,
    insertCourse,
    updateCourse,
    deleteCourse
}