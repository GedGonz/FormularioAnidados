class Persona < ActiveRecord::Base
	has_many :usuarios
	accepts_nested_attributes_for :usuarios
end
