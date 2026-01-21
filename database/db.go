package database

import (
	"log"
    "os"
	"github.com/guilhermeonrails/api-go-gin/models"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

var (
	DB  *gorm.DB
	err error
)

func ConectaComBancoDeDados() {
	// Pega o host das variáveis de ambiente
	host := os.Getenv("HOST") 
	stringDeConexao := "host="+host+" user="+os.Getenv("USER")+" password="+os.Getenv("PASSWORD")+" dbname="+os.Getenv("DBNAME")+" port="+os.Getenv("PORT")+" sslmode=disable"
	
	DB, err = gorm.Open(postgres.Open(stringDeConexao), &gorm.Config{})
	if err != nil {
		log.Panic("Erro ao conectar com banco de dados")
	}

	// CORREÇÃO AQUI: Capturamos o erro do AutoMigrate
	err = DB.AutoMigrate(&models.Aluno{})
	if err != nil {
		log.Panic("Erro ao rodar as migrações no banco: " + err.Error())
	}
}