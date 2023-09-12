# Use uma imagem de base, por exemplo, uma imagem base do Ubuntu
FROM ubuntu:latest

# Instale o Docker dentro do contêiner (se necessário)
RUN apt-get update && apt-get install -y docker.io

# Crie a rede Docker com as configurações especificadas
RUN docker network create --driver bridge --subnet 192.168.36.0/24 --gateway=192.168.36.1 paulo

# Defina a rede criada como a rede padrão para os contêineres
RUN echo 'network="paulo"' >> /etc/docker/daemon.json

# Reinicie o serviço Docker para aplicar as alterações
RUN systemctl restart docker

# Comando de entrada padrão para manter o contêiner em execução
CMD ["bash"]
