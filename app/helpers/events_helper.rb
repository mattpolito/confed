module EventsHelper
  def displayed_date_for(event)
    return "" unless event.started_on? && event.ended_on?
    "#{event.started_on.strftime("%m.%d.%Y")} - #{event.ended_on.strftime("%m.%d.%Y")}"
  end
end
