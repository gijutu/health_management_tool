class BetterCondition < ApplicationRecord
  has_many :signs
  has_many :daiaries

  enum category: { '五感や体のリズムに関すること': 0, '思考特性やモチベーション等に関するもの': 1, '行動特性に関するもの': 2 }
end
