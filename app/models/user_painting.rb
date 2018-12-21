class UserPainting < ApplicationRecord
    belongs_to :painting 
    belongs_to :user
end
