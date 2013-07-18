class Pledge < ActiveRecord::Base
	
  belongs_to :user
  belongs_to :project

  validates_presence_of :user
  validates_presence_of :project

  validates_numericality_of :amount, :greater_than => 0

end
