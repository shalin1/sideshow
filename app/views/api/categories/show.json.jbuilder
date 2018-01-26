json.partial! "api/categories/category", category: @category
@events.each do |event|
  json.set! event.id do
    json.partial! "api/events/event", event: event
  end
end
