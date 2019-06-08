class EventJob < ApplicationJob
  depends_on :event
  sqs_event ref(:events)
  def dig
    puts "lol"
    puts "received event payload: #{JSON.dump(event)}"
  end
end
