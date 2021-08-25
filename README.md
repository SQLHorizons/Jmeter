# [Jmeter](https://hub.docker.com/r/justb4/jmeter)

Apache Jmeter™

## Reference

- [Apache JMeter™](https://jmeter.apache.org/index.html)
- [Download](https://www.apache.org/dist/jmeter/binaries/apache-jmeter-5.4.1.tgz.sha512)
- [k8s-jmeter](https://github.com/kaarolch/kubernetes-jmeter)
- [helm chart](https://github.com/helm/charts/tree/master/stable/distributed-jmeter)
- [Install jmeter](https://www.guru99.com/guide-to-install-jmeter.html)
- [Confluence](https://cwiki.apache.org/confluence/display/JMETER/Home)
- [dockerfile](https://github.com/justb4/docker-jmeter/blob/master/Dockerfile)

## Images

- [ustb4/jmeter](https://hub.docker.com/r/justb4/jmeter)
- [pedrocesarti/jmeter-docker](https://hub.docker.com/r/pedrocesarti/jmeter-docker)

## docker build

```powershell
##  build docker image.
clear; docker build . `
  --file .dockerfile `
  --no-cache=false `
  --build-arg VERSION=$(cat version.txt) `
  --tag ado.jmeter.agent:$(cat version.txt)

##  list docker image.
docker image ls ado.jmeter.agent:$(cat version.txt)

##  scan docker image.
docker scan ado.jmeter.agent:$(cat version.txt) --accept-license

##  deleate docker image.
docker rmi ado.jmeter.agent:$(cat version.txt)
```
