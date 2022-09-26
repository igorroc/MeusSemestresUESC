class Pessoa {
	matricula = 0
	nome = ""
	endereco = ""
	dataNascimento = ""

	constructor(matricula, nome, endereco, dataNascimento) {
		this.matricula = matricula
		this.nome = nome
		this.endereco = endereco
		this.dataNascimento = dataNascimento
	}

	getMatricula() {
		return this.matricula
	}
	setMatricula(matricula) {
		this.matricula = matricula
	}
	getNome() {
		return this.nome
	}
	setNome(nome) {
		this.nome = nome
	}
	getEndereco() {
		return this.endereco
	}
	setEndereco(endereco) {
		this.endereco = endereco
	}
	getDataNascimento() {
		return this.dataNascimento
	}
	setDataNascimento(dataNascimento) {
		this.dataNascimento = dataNascimento
	}
}

module.exports = Pessoa
