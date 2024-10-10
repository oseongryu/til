## API Gateway

## Lambda

### ARN

arn:aws:iam::{계정명}:role/apigateway-dynamodb-role

### GetItem

```json
{
  "TableName": "table1",
  "Key": {
    "test_id": {
      "S": "$input.params('test_id')"
    }
  }
}
```

### PutItem

```json
{
  "TableName": "table1",
  "Item": {
    "test_id": {
      "S": "$input.params('test_id')"
    }
  }
}
```

### UpdateItem

```json
{
  "TableName": "table1",
  "Key": {
    "test_id": {
      "S": "$input.params('test_id')"
    }
  },
  "UpdateExpression": "set value = :val1",
  "ExpressionAttributeValues": {
    ":val1": { "S": "$input.path('$.value')" }
  },
  "ReturnValues": "ALL_NEW"
}
```

### DeleteItem

```json
{
  "TableName": "table1",
  "Key": {
    "test_id": {
      "S": "$input.params('test_id')"
    }
  }
}
```

### PutItem

    date=date1&epoch_uuid=epoch_uuid1

```json
{
  "TableName": "tb_dev",
  "Item": {
    "date": {
      "S": "$input.params('date')"
    },
    "epoch_uuid": {
      "S": "$input.params('epoch_uuid')"
    }
  }
}
```

### PutItem

    date=date1&epoch_uuid=epoch_uuid1&details=details1&epoch=epoch1

```json
{
  "TableName": "tb_dev",
  "Item": {
    "date": {
      "S": "$input.params('date')"
    },
    "epoch_uuid": {
      "S": "$input.params('epoch_uuid')"
    },
    "details": {
      "S": "$input.params('details')"
    },
    "epoch": {
      "S": "$input.params('epoch')"
    }
  }
}
```

### PutItem

```json
{
  "TableName": "tb_dev",
  "Item": {
    "date": {
      "S": "$context.requestTime.substring(0,11)"
    },
    "epoch_uuid": {
      "S": "$context.requestTimeEpoch,$context.requestId"
    },
    "details": {
        "S": "$util.base64Encode("$input.body")"
    },
    "epoch": {
        "S": "$context.requestTimeEpoch"
    }
  }
}
```

### AWS API, DynamoDB create

<img width="700" src="https://oseongryu.github.io/img/aws_api/001.png"/>
<img width="700" src="https://oseongryu.github.io/img/aws_api/002.png"/>
<img width="700" src="https://oseongryu.github.io/img/aws_api/003.png"/>
<img width="700" src="https://oseongryu.github.io/img/aws_api/004.png"/>
<img width="700" src="https://oseongryu.github.io/img/aws_api/005.png"/>
<img width="700" src="https://oseongryu.github.io/img/aws_api/006.png"/>

## References

    https://labs.brandi.co.kr/2018/07/31/kwakjs.html
