<div align=center>
    <h1>Docker Example</h1>
</div>

## Things that you need

- Visual Studio Code or any editor
- Docker installed on your system

## Guides to learn from first

- Learn how to setup docker on your operating system [here](https://docs.docker.com/engine/install/).
- Now clone [this](https://github.com/docker/getting-started/tree/master/app) and work in the app directory or maybe just create another personal folder with the contents of the `app` directory.

- Install dependencies with either `npm` or `yarn`.


## Running the docker image

- Now since we have docker installed on the system, it should be available to execute on the terminal. One thing to note here is that docker should be run with sudo priviledges. I have made `docker` as an alias for my shell for `sudo docker` so if you want to have it too, go ahead it really saves time while running any docker command.

- Now we have to create a docker file which will have configuration of our docker image. For this, create `Dockerfile` file in the project root folder and add the content given below.

```Dockerfile
FROM node:16-alpine
RUN apk add --no-cache python3 make g++
WORKDIR /app
COPY . .
RUN npm install --production
CMD ["node", "src/index.js"]
```

- We will go through every line here:
    - The first on defines the base image that will be used to create that docker image. Here we have used specific node image which is alpine linux.
    - The keyword `apk` is actually the package manager in alpine linux and with that we install our dependencies which are `python3 make g++`. We also have this `--no-cache` thing, this is a flag for apk package manager which will remove the cache after installing those packages.
    - The `WORKDIR` keyword defines the working directory in the docker image.
    - `COPY` keyword copies the current directory to the current directory in the docker image which is `/app` that we defined in the above line which was `WORKDIR /app`.
    - `RUN` is used to run the given command and here it is used to run `npm install --production` command to install node dependencies in production mode.
    - Then we give the command that needs to be executed when the docker container starts using `CMD`.