class Users::RegistrationsController < Devise::RegistrationsController
  before_action :load_card_information, only: [:edit]

  private

  def load_card_information
    @card = Card.find_by(user_id: current_user.id)
  end
end
