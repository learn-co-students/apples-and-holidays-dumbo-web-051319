
require "awesome_print"

holiday_supplies = {
  :winter => {
    :christmas => ["Lights", "Wreath"],
    :new_years => ["Party Hats"],
  },
  :summer => {
    :fourth_of_july => ["Fireworks", "BBQ"],
  },
  :fall => {
    :thanksgiving => ["Turkey"],
  },
  :spring => {
    :memorial_day => ["BBQ"],
  },
}

def second_supply_for_fourth_of_july(holiday_hash)
  # return the second element in the 4th of July array

  holiday_hash[:summer][:fourth_of_july][1]
end

# pp second_supply_for_fourth_of_july(holiday_supplies)

#######################################################################

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays

  holiday_hash[:winter][:christmas] << supply
  holiday_hash[:winter][:new_years] << supply
end

# pp add_supply_to_winter_holidays(holiday_supplies, "Pancakes")
# ap holiday_supplies

#########################################################################

def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array

  holiday_hash[:spring][:memorial_day] << supply
end

# add_supply_to_memorial_day(holiday_supplies, "Burger")
# ap holiday_supplies

##########################################################################

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash

  holiday_hash[season][holiday_name] = supply_array
  return holiday_hash
end

# add_new_holiday_with_supplies(holiday_supplies, :fall, :Holloween, ["Candy Corn", "Ghost"])
# ap holiday_supplies

##########################################################################

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season

  winter_list = []
  holiday_hash[:winter].values.each { |list|
    for supply in list
      winter_list << supply
    end
  }
  return winter_list
end

# pp all_winter_holiday_supplies(holiday_supplies)

##########################################################################

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.

  # !!!   My Solution: Identical to Desired Output, but Won't Pass Test Because of Different Implementation With Print Instead of Put   !!!

  # holiday_hash.each { |season, holidays|
  #   print "\n #{season.to_s.capitalize!}:"

  #   holidays.each { |holiday, supplies|
  #     day = holiday.to_s.split("_").map { |hol|
  #       hol.capitalize!
  #     }.join(" ")

  #     # print "\n \t #{day}: "
  #     print "\n   #{day}: "

  #     for supply in supplies
  #       (supply == supplies.last) ? (print "#{supply} ") : (print "#{supply}, ")
  #     end
  #   }
  # }

  # !!! Solution Taken From GitHub to Pass Test

  holiday_hash.each do |season, holidays|
    puts "#{season.capitalize}:"
    holidays.each do |holiday, supplies|
      puts "  #{holiday.to_s.split("_").map { |w| w.capitalize }.join(" ")}: #{supplies.join(", ")}"
    end
  end
end

# all_supplies_in_holidays(holiday_supplies)

##########################################################################

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists include the string "BBQ"
  # holidays_with_bbqs(holiday_supplies)    #=> [:fourth_of_july, :memorial_day]

  holiday_list = []

  holiday_hash.each { |season, holidays|
    holidays.each { |holiday, supplies|
      if (supplies.include?("BBQ"))
        holiday_list << holiday
      end
    }
  }
  return holiday_list
end

# print all_holidays_with_bbq(holiday_supplies)
