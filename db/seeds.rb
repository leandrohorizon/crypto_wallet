# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
spinners = TTY::Spinner::Multi.new('[:spinner] including coins', format: :pulse_2)

coins = [{ description: 'Bitcoin', acronym: 'BTC',
           url_image: 'https://s2.coinmarketcap.com/static/img/coins/64x64/1.png' },
         { description: 'Etherium', acronym: 'ETH',
           url_image: 'https://s2.coinmarketcap.com/static/img/coins/64x64/1027.png' }]

coins.each do |coin|
  spinner = spinners.register "[:spinner] registering #{coin[:description]}"
  spinner.auto_spin
  Coin.find_or_create_by!(coin)
  spinner.success
end
# rails -T db
