docker build -t app-simple --file docker/Dockerfile.simple .
docker build -t app-multistage --file docker/Dockerfile.multistage .

echo '-- Image sizes simple image vs multistage build'
docker image ls \
    --format='image:{{.Repository}} size:{{.Size}}' \
    | grep -E "app-multistage|app-simple"

# if you wanna run it
docker run -p 3000:80 app-multistage
docker run -p 4000:80 app-simple
