module FormHelper
  def setup_place(place)
    place.address ||= Address.new
    place
  end
end