#!/bin/sh
echo "Install curl"
apk --no-cache add curl

echo "Available environment variables:"
env

echo "Trivy version"
trivy -v

echo "Docker images:"
docker image list

DOCKER_REPO_NO_REG=$(echo $IMAGE_NAME | awk -F"/" '{print $2 "/" $3}')
echo "Temp. docker image name is: ${DOCKER_REPO_NO_REG}"
echo "Temp. docker image name is: this:latest"
echo "Official docker image name is: ${DOCKER_REPO}:${DOCKER_TAG}"

echo "Generate vulnerability report..."
trivy --no-progress --format json --output /projectroot/report.json this:latest
echo "Show vulnerabilities summary: "
trivy --quiet this:latest

echo "Current directory contents:"
ls -al /projectroot

echo "Content of Trivy Report"
cat /projectroot/report.json
echo ""

echo "Send report to Trivy Report Registry..."
curl -X POST -H "Content-Type: application/json" --silent --data-binary "@/projectroot/report.json" https://trivy-report-registry.ff-hamm.de/incoming-report
echo "done."

# fails if vulnerabilities of a notable severity are detected:
trivy --quiet --severity CRITICAL,HIGH --exit-code 1 this:latest > /dev/null 2>&1
exitCode=$?
if [ $exitCode -gt 0 ]; then
  echo "Tests failed! Notable vulnerabilities are detected!"
  exit 1
fi

echo "Tests successful."
exit 0
