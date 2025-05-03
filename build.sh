
echo -e "\033[0;32m[INFO]\033[0m Building Image ...."
start=$(date +%s)
docker build -f $1 -t image . > /dev/null 2>&1
# docker build -f $1 -t image .
end=$(date +%s)
duration=$((end - start))


docker images --format "{{.Repository}} {{.Size}}" | awk '$1 == "image" { print "\033[0;32m[INFO]\033[0m Image Size: " $2 }'
echo -e "\033[0;32m[INFO]\033[0m Build Time: ${duration}s"
trivy image --quiet --format json image | jq -r '[.Results[].Vulnerabilities? // [] | length] | add | "\u001b[0;32m[INFO]\u001b[0m Vulnerabilities: \(.)"'
echo ""