class Ride < ActiveRecord::Base

  belongs_to :user
  belongs_to :attraction

  def take_ride
    if not_enough_tickets && too_short
      "Sorry, you need #{self.attraction.tickets - self.user.tickets} more tickets to ride,\n
      and you also need to be #{self.attraction.min_height - self.user.height} inches taller to ride."
    elsif not_enough_tickets
      "Sorry, you need #{self.attraction.tickets - self.user.tickets} more tickets to ride."
    elsif too_short
      "Sorry, you need to be #{self.attraction.min_height - self.user.height} inches taller to ride."
    else
      ride_this_ride
    end
  end

  def not_enough_tickets
    self.user.tickets < self.attraction.tickets
  end

  def too_short
    self.user.height < self.attraction.min_height
  end

  def ride_this_ride
     # binding.pry
     ticket_change = self.user.tickets - self.attraction.tickets
     nausea_change = self.user.nausea + self.attraction.nausea_rating
     happiness_change = self.user.happiness + self.attraction.happiness_rating
     self.user.update(tickets: ticket_change, nausea: nausea_change, happiness: happiness_change)
     "Thanks for riding #{self.attraction.name}!"
   end

end
