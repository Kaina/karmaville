class User < ActiveRecord::Base
  has_many :karma_points

  attr_accessible :first_name, :last_name, :email, :username

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  validates :username,
            :presence => true,
            :length => {:minimum => 2, :maximum => 32},
            :format => {:with => /^\w+$/},
            :uniqueness => {:case_sensitive => false}

  validates :email,
            :presence => true,
            :format => {:with => /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i},
            :uniqueness => {:case_sensitive => false}

  def total_karma_model_save
    self.karma_points.sum(:value)
  end

  def total_karma
    self.sum_karma
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  scope :by_karma, -> { order("sum_karma DESC").limit(100) }
end
