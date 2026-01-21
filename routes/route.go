package routes

import (
	"log" // Adicione este import
	"github.com/gin-gonic/gin"
	"github.com/guilhermeonrails/api-go-gin/controllers"
)

func HandleRequest() {
	r := gin.Default()
	r.LoadHTMLGlob("templates/*")
	r.Static("/assets", "./assets")
	r.GET("/:nome", controllers.Saudacoes)
	r.GET("/alunos", controllers.TodosAlunos)
	r.GET("/alunos/:id", controllers.BuscarAlunoPorID)
	r.POST("/alunos", controllers.CriarNovoAluno)
	r.DELETE("/alunos/:id", controllers.DeletarAluno)
	r.PATCH("/alunos/:id", controllers.EditarAluno)
	r.GET("/alunos/cpf/:cpf", controllers.BuscaAlunoPorCPF)
	r.GET("/alunos/", controllers.BuscaAlunoPorCPF)
	r.GET("/index", controllers.ExibePaginaIndex)
	r.NoRoute(controllers.RotaNaoEncontrada)
	
	// CORREÇÃO: Verificando se o servidor iniciou corretamente
	err := r.Run()
	if err != nil {
		log.Panic("Não foi possível iniciar o servidor Gin: ", err)
	}
}