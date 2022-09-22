const mysql = require("mysql")

const connection = mysql.createConnection({
	host: "localhost",
	user: "root",
	password: "",
	database: "universidade",
})

connection.connect((err) => {
	if (err) {
		console.log("Erro ao conectar no banco de dados")
	} else {
		console.log("Conectado no banco de dados")
	}
})

module.exports = connection
