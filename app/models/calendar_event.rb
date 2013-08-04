class CalendarEvent < ActiveRecord::Base
  attr_accessible :name, :start, :finish

end
