#!/bin/zsh

function(){
  s3Bucket="TestBucket5"; sam build --parameter-overrides UploadBucketName="${s3Bucket}"; sam deploy --stack-name Test5 --s3-bucket="${s3Bucket}";
}



# Check if the function exists
  if [ $# -gt 0 ]; then 
#if declare -f "$1" > /dev/null
  # call arguments verbatim
  "$@"
else
  # Show a helpful error
  echo "Functions Available:"
  typeset -f | awk '!/^main[ (]/ && /^[^ {}]+ *\(\)/ { gsub(/[()]/, "", $1); print $1}'
  exit 1
fi
