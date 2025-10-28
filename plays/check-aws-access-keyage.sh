for user in $(aws iam list-users --query 'Users[].UserName' --output text); do
  keys=$(aws iam list-access-keys --user-name "$user" --query 'AccessKeyMetadata[].AccessKeyId' --output text)
  for key in $keys; do
    create_date=$(aws iam list-access-keys --user-name "$user" --query "AccessKeyMetadata[?AccessKeyId=='$key'].CreateDate" --output text)
    days_old=$(( ( $(date +%s) - $(date -d "$create_date" +%s) ) / 86400 ))
    if [ $days_old -gt 90 ]; then
      echo "User: $user | Access Key: $key | Age: $days_old days"
    fi
  done
done
