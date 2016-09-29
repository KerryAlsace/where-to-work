class SharedPlace < ApplicationRecord
  belongs_to :place
  belongs_to :friend, class_name: 'User'

  def comment_list
    @friend = friend
    if comments != nil
      comments.each_with_index do |comment, i|
        "#{@friend} says '#{comment}'"
      end
    end
  end
end