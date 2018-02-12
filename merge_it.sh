
sh "curl -X PUT -H \"Authorization: token ${TOKEN}\" -d '{\"commit_title\": \"Merge pull request\"}' ${URL}""

if curl ${URL}; then
    exit 0
else
    exit 1
fi
