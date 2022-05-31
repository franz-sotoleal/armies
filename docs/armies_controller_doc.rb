module ArmiesControllerDoc
  extend Apipie::DSL::Concern
  api :GET, 'armies', 'Lists all the armies'

  def index; end

  api :GET, 'armies/:id', 'Shows a specific army'

  def show; end

  api :POST, 'armies', 'Creates an army'

  param :army, Hash, required: true do
    param :type, %w[EnglishArmy ChineseArmy ByzantineArmy], required: true
  end

  def create; end
end
