FROM ubuntu:latest

EXPOSE 8000

WORKDIR /app

# Copiamos o executável e a pasta que estava a faltar
COPY ./main main
COPY ./templates ./templates

# NÃO colocamos o ENV USER=root PASSWORD=root aqui!
# Deixamos para passar isso apenas no comando "docker run"

ENTRYPOINT [ "./main" ]