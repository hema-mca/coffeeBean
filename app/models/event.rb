class Event < ApplicationRecord
  belongs_to :user

  def self.search(search)
    if(search)
      @events = self.where(type: search)
    else
      @events = Event.all
    end
  end

end
