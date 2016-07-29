class Question < ApplicationRecord
  belongs_to :user
  belongs_to :expert, class_name: "User"
end
