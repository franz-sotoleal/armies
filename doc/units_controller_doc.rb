module UnitsControllerDoc
  extend Apipie::DSL::Concern
  api :GET, 'units', 'Lists all the units for an army'

  def index; end

  api :GET, 'units/:id', 'Shows a specific unit for an army'

  def show; end

  api :POST, ':id/train', 'Trains a Unit'

  def train; end

  api :POST, ':id/transform', 'Transforms a Unit'

  def transform; end
end
