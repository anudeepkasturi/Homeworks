module Toyable
  extend ActiveSupport::Concern

  included do
    has_many :toys, as: :toyable
  end

  def receive(toy_name)
    self.toys.find_or_create_by(name: toy_name)
  end
end
