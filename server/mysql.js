const mysql = require('mysql')

const sqlConfig = {
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'newdatabase'
}

let connection

(function getCon() {
    connection = mysql.createConnection(sqlConfig)
    connection.connect()
    connection.on('error', err => {
        connection = mysql.createConnection(sqlConfig)

    })
})()

const sqlFn = function (sql, arr, callback) {
    connection.query(sql, arr, callback)
}

module.exports = sqlFn