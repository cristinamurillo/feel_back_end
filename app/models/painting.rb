
class Painting < ApplicationRecord

    has_many :user_paintings
    has_many :users, through: :user_paintings

    validates :img_url, presence: true, uniqueness: true 

    def addColors
        colorsObj = Miro::DominantColors.new(self.img_url)
        colorsArray = colorsObj.to_hex 
        colorsArray.each_with_index { |color, index| 
            self.update_attribute("color#{index+1}", color)
        }
    end
end
