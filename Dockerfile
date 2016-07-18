FROM java:7

RUN wget http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz \
 && tar xzvf dynamodb_local_latest.tar.gz \
 && rm dynamodb_local_latest.tar.gz \
 && mkdir -p /data/dynamo

EXPOSE 8000

VOLUME /data/dynamo /data/dynamo

CMD ["/usr/bin/java", "-Djava.library.path=./DynamoDBLocal_lib", "-jar", "DynamoDBLocal.jar", "-sharedDb", "-dbPath", "/data/dynamo"]
