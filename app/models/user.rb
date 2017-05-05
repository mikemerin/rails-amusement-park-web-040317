class User < ActiveRecord::Base

  has_many :rides
  has_many :attractions, through: :rides

  validates :name, presence: { scope: true, message: "must be entered" }

  if has_secure_password
    validates_confirmation_of :password
  end

  validates :height, presence: { scope: true, message: "must be entered" }

  validates :nausea, inclusion: { in: 1..5, message: "must be between 1 and 5" }
  validates :happiness, inclusion: { in: 1..5, message: "must be between 1 and 5" }


  validates :tickets, numericality: { greater_than_or_equal_to: 0, message: "(money) must be at least 0" }

  def mood
    self.happiness - self.nausea > 0 ? "happy" : "sad"
  end

  def number_of_rides
    self.attractions.count
  end

  def field_class(resource, field_name)
    if resource.errors[field_name]
      return "error".html_safe
    else
      return "".html_safe
    end
  end

end
