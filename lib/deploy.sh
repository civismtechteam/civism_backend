RED="\033[0;31m"
NC="\033[0m"
# retrieve commit hashes
REMOTE_MASTER_COMMIT_HASH=$(git rev-parse origin/master)
MASTER_COMMIT_HASH=$(git rev-parse master)
# ensure hashes match
if [ $REMOTE_MASTER_COMMIT_HASH != $MASTER_COMMIT_HASH ]; then
  echo -e "${RED}Warning:${NC} The current master branch does not mach the remote master branch"
  exit 1
fi
# deploy
aws deploy create-deployment \
  --application-name CivismApi \
  --deployment-config-name CodeDeployDefault.AllAtOnce \
  --deployment-group-name civismbackendgithubdeployment \
  --description "Auto Deployment" \
  --github-location repository=civismtechteam/civism_backend,commitId=$MASTER_COMMIT_HASH
