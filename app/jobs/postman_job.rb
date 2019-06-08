class PostmanJob < ApplicationJob
  include Jets::AwsServices

  iam_policy "sqs"
  def deliver
    queue_url = Event.lookup(:events_url)
    message_body = JSON.dump({"test": "hello world"})
    sqs.send_message(
      queue_url: queue_url,
      message_body: message_body,
    )
  end
end