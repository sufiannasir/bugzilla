class User < ApplicationRecord
	 
  has_many :project_users
  has_many :projects, through: :project_users

  # has_many :bugs

  has_many :createdby, :class_name => 'Bug', :foreign_key => 'createdby_id'
  has_many :assignedto, :class_name => 'Bug', :foreign_key => 'assignedto_id'

  # validates :user_type: inclusion:{ in:[:developer, :manager, :qa]}
end