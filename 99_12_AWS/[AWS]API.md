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
      ":val1": {"S": "$input.path('$.value')"}
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


## References

https://labs.brandi.co.kr/2018/07/31/kwakjs.html