lambda_project_home="$(pwd)"

FILE=${lambda_project_home}/.env


if [[ $TRAVIS_BRANCH == 'dev' ]]; then
aws ssm get-parameters-by-path --path "/Dev" --region 'us-east-1'  |jq -r '.Parameters[]|.Value' > $FILE
    echo "=========== $TRAVIS_BRANCH ENV ==========="
    cat $FILE
elif [[ $TRAVIS_BRANCH == 'master' ]]; then
aws ssm get-parameters-by-path --path "/Prod" --region 'us-east-1'  |jq -r '.Parameters[]|.Value' > $FILE
    echo "=========== $TRAVIS_BRANCH ENV ==========="
    cat $FILE
else
    exit 0
fi