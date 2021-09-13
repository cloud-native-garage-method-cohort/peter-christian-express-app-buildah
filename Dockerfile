# Use node Docker image, version 16-alpine
FROM quay.io/repository/ibmgaragecloud/node:dfb4bb1a240a1be3cd75c36ad3d812a52161b141ed6d7cbe8550910ce8bb2067

# From the documentation, "The WORKDIR instruction sets the working directory for any
# RUN, CMD, ENTRYPOINT, COPY and ADD instructions that follow it in the Dockerfile"
WORKDIR /usr/src/app

# COPY package.json and package-lock.json into root of WORKDIR
COPY package*.json ./

# Executes commands
RUN npm install

# Copies files from source to destination, in this case the root of the build context
# into the root of the WORKDIR
COPY . .

# Exposes port 3000 on the container to the outside world
EXPOSE 3000

# Command to use for starting the application
CMD ["npm", "start"]

