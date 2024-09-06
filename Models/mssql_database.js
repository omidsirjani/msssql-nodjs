const {sql , poolPromise} = require('./mssql_connection')

class CourseModel {
    
    static getCourses = async() => {
    const pool = await poolPromise
    const request = pool.request()
    const result = await request.query('select * from tblCourses')
    console.log(result)
    return result.recordset

}

static getCourse = async(id) => {
    const pool = await poolPromise
    const request = pool.request()
    request.input("Id" , sql.Int , id)
    const result = await request.query('select * from tblCourses where id = @Id')
    console.log(result)
    return result.recordset

}

static insertCourse = async(title) => {
    const pool = await poolPromise
    const request = pool.request()
    request.input("title" , sql.NVarChar , title)
    const result = await request.query('insert into tblCourses (Title) values (@title)')
    console.log(result)
    return true

}

static updateCourse = async(id,title) => {
    const pool = await poolPromise
    const request = pool.request()
    request.input("Id" , sql.Int , id)
    request.input("title" , sql.NVarChar , title)
    const result = await request.query('update tblCourses set Title=@title where Id=@id')
    console.log(result)
    return true

}

static deleteCourse = async(id) => {
    const pool = await poolPromise
    const request = pool.request()
    request.input("Id" , sql.Int , id)
    const result = await request.query('delete from tblCourses where Id=@id')
    console.log(result)
    return true

}


static callStoreProcdure = async(id) => {
    const pool = await poolPromise
    const request = pool.request()
    request.input("id" , sql.Int , id)
    const result = await request.execute('sp_select')
    console.log(result.recordset)
    return result.recordset

}

}

module.exports = CourseModel