namespace :sample do
  desc "create a rake task"
  task create: :environment do
    User.user_count
  end

  desc "create user name"
  task create_user: :environment do
    User.user_name
  end
end
