namespace :dev do
  desc 'sets up the development environment'
  task setup: :environment do
    # %x(rails db:drop db:create db:migrate db:seed)
    `rails db:drop db:create db:migrate db:seed`
  end
end
