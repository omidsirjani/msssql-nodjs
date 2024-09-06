const express = require('express');
const router = express.Router();
const coursesController = require('../Controllers/Courses-controller')




router.get('',coursesController.getCourses)

router.get('/:id', coursesController.getCourse)

router.post('', coursesController.insertCourse)

router.put('/:id',coursesController.updateCourse)

router.delete('/:id',coursesController.deleteCourse)

module.exports = router ;