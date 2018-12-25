
class Painting < ApplicationRecord

    has_many :user_paintings
    has_many :users, through: :user_paintings

    validates :img_url, presence: true, uniqueness: true 

    def colors
        colorsObj = Miro::DominantColors.new(self.img_url)
        colorsObj.to_rgb
    end
end
