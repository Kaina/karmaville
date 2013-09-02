namespace :insert_sum_karma do
  desc "Adds total karma points to sum_karma field in users table"
  task :go => :environment do
    users = []
    User.all.each do |user|
      user.sum_karma = user.total_karma
      users << user
    end
    User.import users, :validate => false
  end
end
