class User < ApplicationRecord
    has_many :posts

    def self.user_count
        puts "User count at #{Time.now} is : #{User.count}"
    end
    
    def self.user_name
        puts "User count at #{Time.now} is : #{User.last.name}"
    end
end
