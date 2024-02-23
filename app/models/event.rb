class Event < ApplicationRecord
  belongs_to :user

  validates :type, presence: true

  self.per_page = 10

  def self.search(search)
    if(search)
      @events = self.where(type: search)
    else
      @events = Event.all
    end
  end

end
