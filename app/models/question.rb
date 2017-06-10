class Question < ApplicationRecord
  belongs_to :user
  belongs_to :expert, class_name: "User"

  before_save :change_user_free_question_used

  validate :user_subscription
  validates_presence_of :user

  private

  def change_user_free_question_used
    unless self.user.subscribed
      self.user.free_question_used = true
      self.user.save
    end
  end

  def user_subscription
    if !user.subscribed && user.free_question_used
      errors.add(:user_subscription, "unsubscribed user, free question used")
    end
  end
end
