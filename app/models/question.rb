class Question < ApplicationRecord
  belongs_to :user
  belongs_to :answerer, class_name: "User"
end
