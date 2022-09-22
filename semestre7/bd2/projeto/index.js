const express = require("express")
const app = express()
const port = 3000

app.set("engine ejs", "ejs")

app.get("/", (req, res) => {
	let nome = "Universidade Estadual de Santa Cruz"

	res.render("index.ejs", { nome })
})

app.listen(port, () => {
	console.log(`Servidor rodando em http://localhost:${port}`)
})
