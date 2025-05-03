docker rmi -f image > /dev/null 2>&1
docker system prune -f > /dev/null 2>&1

echo -e "\033[0;32m[INFO]\033[0m Purged image and layers"
echo ""