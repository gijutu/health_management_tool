class Daiary < ApplicationRecord
  belongs_to :user
  # has_many :signs
  enum day_icon: { '普通': '普通', '元気': '元気', '憂うつ': '憂うつ', 'とても元気': 'とても元気', 'とても憂うつ': 'とても憂うつ' }
end
