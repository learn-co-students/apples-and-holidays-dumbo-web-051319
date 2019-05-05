require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  holiday_supplies[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter][:christmas] << supply
  holiday_hash[:winter][:new_years] << supply
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  new_hash = {season => {holiday_name => supply_array}}
  holiday_hash[season] = holiday_hash[season].merge(new_hash[season])
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  new_arr = []
    holiday_hash.each do |layer1, layer2|
      if layer1 == :winter
        new_arr = layer2.collect { |layer2, layer3| layer3 }
      end
    end
    new_arr.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, holidays|
      puts "#{season.to_s.capitalize}:"

      holidays.each do |holiday, items|
        holiday_string_split = holiday.to_s.split("_").collect do |word|
          words = word.capitalize!

        end.join(" ")

        puts "  #{holiday_string_split}: #{items.join(", ")}"

      end
    end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  holidayArray = []
  holiday_hash.each do |season, holidayType|
    holidayType.each do |holiday, itemType|
      itemType.each do |item|
        if item == "BBQ"
          holidayArray << holiday
        end
      end
    end
  end
  holidayArray
end
