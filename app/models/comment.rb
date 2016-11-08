class Comment < ApplicationRecord
  belongs_to :place
  belongs_to :user

  def user_name
    self.user.username
  end
end
