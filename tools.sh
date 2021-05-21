#!/bin/zsh

function(){
  #Getting error because bucket name  Resource: 'arn:aws:s3:::swift-simple-lambda-bucket/*' is still in template
  s3Bucket="test5.gestrich.org"; sam build --parameter-overrides UploadBucketName="${s3Bucket}"; sam deploy --stack-name Test5 --parameter-overrides ParameterKey=UploadBucketName,ParameterValue="${s3Bucket}" --s3-bucket=$s3Bucket --capabilities CAPABILITY_IAM;
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
