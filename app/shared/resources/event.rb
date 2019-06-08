class Event < Jets::Stack
  sqs_queue(:events,
    visibility_timeout: 60
  )
end
