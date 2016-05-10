class Invitation < ActiveRecord::Base
  belongs_to :user
  belongs_to :colleague, :class_name => "User"
end
