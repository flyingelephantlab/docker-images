## Creating images for multi-arch builds
To accommodate ARM processors (M1 apple chip), we need to make sure that the image is built for both platforms.
*The more important case*: in case we build this on an M1 device without configuring it correctly, we won't be able to use the image on our servers (amd based servers).

You can read the detailed guide [here](https://www.docker.com/blog/multi-arch-images/) (for more details, and configuring it using `manifest` instead of `buildx`: [docker multi arch images](https://www.docker.com/blog/multi-arch-build-and-images-the-simple-way/)).

The following is the TLDR version of the required commands:

### Initial setup
- Clone the repo (`git clone git@github.com:flyingelephantlab/docker-images.git`), and `cd` into it.
- Make any changes you would like to the image by editing the `Dockerfile`

#### 1: (_Skip this if already done_) Initialize a buildx instance
- Run the following to create an instance: ```docker buildx create --name my_multi_arch_builder```
- Activate/use the instance by running: ```docker buildx use my_multi_arch_builder```
- Run ```docker buildx inspect --bootstrap``` to initialize

#### 2: Login to docker
Make sure you are logged in to dockerhub using ```docker login```. Please ask for the credentials if you don't have access.

#### 3: Build, and push the image
This is combined in one command. You can split the build/push separately if you want.
Simply run: ```docker buildx build --platform linux/amd64,linux/arm64 -t flyingelephantlab/python:3.10-slim-buster --push .```
