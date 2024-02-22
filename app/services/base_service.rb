class BaseService
  include ActiveModel::Validations

  def self.call(*args, &block)
    new(*args, &block).call
  end

end
