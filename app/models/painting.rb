class Painting < ApplicationRecord

    validates :img_url, presence: true, uniqueness: true 

    def colors
        colorsObj = Miro::DominantColors.new(self.img_url)
        return colorsObj.to_rgba
    end
end
