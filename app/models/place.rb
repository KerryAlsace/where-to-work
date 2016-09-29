class Place < ApplicationRecord
  belongs_to :neighborhood
  # belongs_to :creator, class_name: 'User'
  belongs_to :user, foreign_key: 'creator_id'
  has_many :shared_places
  has_many :friends, through: :shared_places, class_name: 'User'

  def comments
    if !shared_places
      return []
    elsif shared_places
      shared_places.collect do |shared_place|
        shared_place.comment
      end
    end
  end

  def current_user_shared_place(current_user)
    if friends.include?(current_user)
      s = shared_places.where(friend_id: current_user.id)
      s.first
    end
  end

  def add_comment_to_place(comment)
    comments << comment
  end

  def creator
    User.where(id: creator_id).first
  end

end

# p.current_user_shared_place(current_user).first.comment

# <br>
# <% if @place.friends.include?(current_user) %>
#   <%= form_for @place do |f| %>
#     <%= f.label :comments %>:<br>
#     <%= f.text_field :comments %><br><br>
#     <%= f.submit "Add Comment", add_comment_path(current_user, @place) %>
#   <% end %>
# <% end %>
# <br>

# <%= form_for(@place) do |f| %>

#   <%= f.fields_for :comments do |comment| %>
#         <%= comment.label :comment %>
#         <%= comment.text_area :comment %>
#   <% end %>

#   <%= link_to "Add Comment", add_comment_path(current_user, @place) %>
#   <%= f.submit %>
# <% end %>
