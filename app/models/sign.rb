class Sign < ApplicationRecord
  belongs_to :user
  belongs_to :attention
  belongs_to :better_condition
  belongs_to :worse_condition
end
