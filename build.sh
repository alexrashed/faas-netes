#!/bin/sh
make build
docker tag openfaas/faas-netes:latest alexrashed/faas-netes-skippy:0.1-amd64
docker push alexrashed/faas-netes-skippy:0.1-amd64
make build-arm64
docker tag openfaas/faas-netes:latest-arm64 alexrashed/faas-netes-skippy:0.1-arm64
docker push alexrashed/faas-netes-skippy:0.1-arm64
make build-armhf
docker tag openfaas/faas-netes:latest-armhf alexrashed/faas-netes-skippy:0.1-armhf
docker push alexrashed/faas-netes-skippy:0.1-armhf
docker manifest create --amend alexrashed/faas-netes-skippy:0.1 alexrashed/faas-netes-skippy:0.1-amd64 alexrashed/faas-netes-skippy:0.1-arm64 alexrashed/faas-netes-skippy:0.1-armhf
docker manifest push alexrashed/faas-netes-skippy:0.1

# os="$(uname -s)"

# if [ "$os" = "Linux" ] ; then
# 	cd openfaas
# 	if ! [ -x "$(command -v helm)" ]; then
# 		curl -SL https://storage.googleapis.com/kubernetes-helm/helm-v2.6.1-linux-amd64.tar.gz > /tmp/helm.tgz && \
# 		mkdir -p /tmp/helm/ && \
#                 tar -xvf helm.tgz --strip-components=1 -C /tmp/helm
# 		/tmp/helm/helm lint
# 	else
# 		helm lint	
# 	fi
# else
# 	echo "Only checking helm lint on Linux"
# fi

