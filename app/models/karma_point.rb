class KarmaPoint < ActiveRecord::Base
  attr_accessible :user_id, :label, :value
  belongs_to :user

  validates :user, :presence => true
  validates :value, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  validates :label, :presence => true

  after_save :set_sum_karma

  def set_sum_karma
    self.user.update_attribute(:sum_karma, self.user.total_karma_model_save)
  end
end
