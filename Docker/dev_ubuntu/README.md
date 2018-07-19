Este dockerfile genera una imagen Docker con herramientas de desarrollo y Docker siblings.

Para construir la imagen:

`docker build -t dev-ubuntu .`

Para crear un contendor con la imagen:

`docker run -ti -v /var/run/docker.sock:/var/run/docker.sock dev-ubuntu`

