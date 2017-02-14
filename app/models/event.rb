class Event < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :delete_all
  has_many :patrons, dependent: :delete_all
  has_many :users, :through => :patrons
  validate :future_date

  validates :name, :event_date, :city, :state, :user, presence: true

  def future_date
    if event_date.past?
      errors.add(:event_date, "can't be in the past")
    end
  end

end
