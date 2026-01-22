class Demo < ApplicationRecord

    before_create :greeting_message
    after_create do 
        puts "End..."
    end

    def greeting_message
        puts "Hello world"
    end
end
