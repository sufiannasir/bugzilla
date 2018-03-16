class Bug < ApplicationRecord
  belongs_to :createdby, :foreign_key  => "createdby_id", :class_name => "User"
  belongs_to :assignedto, :foreign_key => "assignedto_id", :class_name => "User"
  
  belongs_to :project

  mount_uploader :screenshot, ImageUploader

  #belongs_to :users
  validates :title, uniqueness: true
  validates_presence_of :title, :status
end