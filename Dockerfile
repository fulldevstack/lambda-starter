FROM lambci/lambda:build-nodejs12.x

ARG FUNCTION_NAME

COPY dist/* .

RUN zip -9qyr lambda.zip node_modules index.js

CMD aws --region ${AWS_REGION} lambda update-function-code --function-name ${FUNCTION_NAME} --publish --zip-file fileb://lambda.zip
