class PlacePolicy < ApplicationPolicy

  def create?
    # user.admin? or params[:user_id] == user.id
    user.admin? or record.creator == user
  end

  def update?
    user.admin? or record.creator == user
  end

  def destroy?
    user.admin? or record.creator == user
  end

  def permitted_attributes
    if user.admin? || record.creator == user
      [:name, :neighborhood, :address, :comments, :wifi, :wifi_quality, :public_restroom, :restroom_cleanliness, :costs_money, :user_id, :friend_ids, :neighborhood_id, :creator_id]
    else
      []
    end
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      elsif user.user?
        scope.where(creator: user)
      else
        scope.none
      end
    end
  end
end