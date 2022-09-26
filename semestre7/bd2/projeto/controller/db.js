const mysql = require("mysql")

const connection = mysql.createConnection({
	host: "localhost",
	database: "universidade",
	user: "root",
	password: "",
})

connection.connect((err) => {
	if (err) {
		console.log("Erro ao conectar no banco de dados")
		console.error(err)
	} else {
		console.log("Conectado no banco de dados")
	}
})

module.exports = connection
