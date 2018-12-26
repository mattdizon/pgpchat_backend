class RecievedMessage < ApplicationRecord
  belongs_to :user
  belongs_to :sender, :class_name => "User"
end
