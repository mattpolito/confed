module EventsHelper
  def displayed_date_for(event)
    return "" if event.started_on.blank? || event.ended_on.blank?
    "#{event.started_on.strftime("%m.%d.%Y")} - #{event.ended_on.strftime("%m.%d.%Y")}"
  end
end
