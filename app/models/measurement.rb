class Measurement < ApplicationRecord
  belongs_to :course

  validates_presence_of :unit, :quantity, :name
end
