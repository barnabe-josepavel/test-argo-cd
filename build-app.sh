APP_VERSION=1.0.4
APP_IMAGE_NAME=rg.fr-par.scw.cloud/test-custom-image-argo-cd/app:$APP_VERSION

cd app/ && docker build -t $APP_IMAGE_NAME . 

docker push $APP_IMAGE_NAME