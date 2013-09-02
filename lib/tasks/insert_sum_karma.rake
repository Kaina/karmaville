namespace :insert_sum_karma do
  desc "Adds total karma points to sum_karma field in users table"
  task :go => :environment do
    ActiveRecord::Base.transaction do
      User.all.each do |user|
        user.update_attribute(:sum_karma, user.total_karma)
      end
    end
  end
end
