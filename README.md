# docker-images
## How to push a new image with a new tage
- clone the repository
  ```git clone git@github.com:flyingelephantlab/docker-images.git```
- Do the changes that you want to add
- Bulid the images locally
 ``` docker build -t flyingelephantlab/python:<THE NEW TAG> . ```
- Ask for Docker Hub cardinals
- Login into docker hub
  ``` docker login ```
- Push the new image
- ``` docker push flyingelephantlab/python:<THE NEW TAG>```
