

* GET Events

```
curl http://localhost:4343/api/v1/events.json

```

* POST Events

** Request:

```
curl -X POST http://localhost:4343/api/v1/events.json -H 'Content-Type: application/json' -d '{"user_id":"1","type":"B"}'
```

** Response: 

```
{"success":true,
"event":{"id":20,"user_id":1,"created_at":"2024-02-12T07:58:01.218Z","updated_at":"2024-02-12T07:58:01.218Z"},
"message":"Event B created successfully!"}
```