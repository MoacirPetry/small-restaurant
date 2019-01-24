module ControlPanel::UsersHelper
  def select_positions
    User.positions.map { |key, value| [key.humanize, key] }
  end
end
