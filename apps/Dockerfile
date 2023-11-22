# Use a imagem oficial do Node.js
FROM node:14.19.3

WORKDIR /usr/src/build/

# Copie os arquivos necessários para o contêiner
COPY build/ .

WORKDIR /usr/src/build/bundle/programs/server
# Instale as dependências do Node.js
RUN npm install

# Exponha a porta na qual o aplicativo estará executando
EXPOSE 3000

# Defina as variáveis de ambiente necessárias
ENV PORT=3000
ENV MONGO_URL=mongodb://sua-url-de-conexao

WORKDIR /usr/src/build/bundle
# Execute o aplicativo Meteor
CMD ["node", "main.js"]
