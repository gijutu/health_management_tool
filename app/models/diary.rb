class Diary < ApplicationRecord
  belongs_to :user
  # has_many :signs
  enum day_icon: { '普通': '普通', '元気': '元気', '憂うつ': '憂うつ',
                  'とても元気': 'とても元気', 'とても憂うつ': 'とても憂うつ' }
  enum sleep_label: { 'とても早い': 'とても早い', '早い': '早い', 'ふつう': 'ふつう',
                    '遅い': '遅い', 'とても遅い': 'とても遅い' }
  has_one :feeling
  accepts_nested_attributes_for :feeling

  before_save :sleep_save

  def sleep_save
    if (self.getup_at - self.sleep_at).negative?
      self.sleep_hour = 24 - (self.sleep_at - self.getup_at ) / 3600
    else
      self.sleep_hour = (self.getup_at - self.sleep_at) / 3600
    end
  end

end
