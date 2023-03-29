class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        auditions.map do |audition|
            audition.actor
        end
    end

    def locations
        auditions.map do |audition|
            audition.location
        end
    end

    def lead 
        auditions.find_by_hired(true)
    end

    def understudy
        auditions.where(hired: true).second
    end
  
end