const Pessoa = require("../model/Pessoa")
let db = require("./db")
let pessoa

async function mostraPessoa() {
	let listaPessoa = new Array()

	return new Promise((resolve, reject) => {
		db.query("SELECT * FROM pessoa", (err, rows) => {
			if (err) {
				reject(err)
			} else {
				rows.forEach((row) => {
					pessoa = new Pessoa(
						row.matricula,
						row.nome,
						row.endereco,
						row.dataNascimento
					)
					listaPessoa.push(pessoa)
				})
				resolve(listaPessoa)
			}
		})
	})
}

function inserePessoa(pessoa) {
	const params = [
		pessoa.getNome(),
		pessoa.getEndereco(),
		pessoa.getDataNascimento(),
	]
	let sql =
		"INSERT INTO pessoa (nome, endereco, dataNascimento) VALUES (?, ?, ?)"

	db.query(sql, params, (err, rows) => {})
}

module.exports = { mostraPessoa, inserePessoa }
