

Running Testcases:

change the path to the application and run the rspec command to run the event service spec.
```
cd coffee_notif

$ rspec spec/services/event_service_spec.rb

```
The above command output should display like below image.

![Screenshot from 2024-02-23 15-07-30.png](..%2F..%2FPictures%2FScreenshots%2FScreenshot%20from%202024-02-23%2015-07-30.png)

* GET(200) Events:

```
http://localhost:4343/api/v1/events?user_id=1
```

* GET(400) Events:

```
http://localhost:4343/api/v1/events
```
Response:
```
{
success: false,
events: [ ],
errors: [
"User must be present"
]
}
```

* POST Events:

** Valid Request:

```
curl -X POST http://localhost:4343/api/v1/events.json -H 'Content-Type: application/json' -d '{"user_id":"1","type":"B"}'
```

** Response: 

```
{"success":true,
"event":{"id":20,"user_id":1,"created_at":"2024-02-12T07:58:01.218Z","updated_at":"2024-02-12T07:58:01.218Z"},
"message":"Event B created successfully!"}
```

** Invalid Request:

```
curl -X POST http://localhost:4343/api/v1/events.json -H 'Content-Type: application/json' -d '{"user_id":"","type":"BA"}'
```

** Response: 

```
{:success=>false, :event=>nil, :errors=>["User can't be blank", "Type is not included in the list", "User must be valid"]}
```
