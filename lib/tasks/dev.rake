# frozen_string_literal: true

namespace :dev do
  desc 'sets up the development environment'
  task setup: :environment do
    # %x(rails db:drop db:create db:migrate db:seed)
    return unless Rails.env.development?

    spinners = TTY::Spinner::Multi.new('[:spinner] loading', format: :pulse_2)

    show_spinner('dropping database', spinners) { `rails db:drop` }
    show_spinner('creating database', spinners) { `rails db:create` }
    show_spinner('migrating database', spinners) { `rails db:migrate` }
    `rails dev:add_coins`
    `rails dev:add_mine_types`
  end

  desc 'including coins'
  task add_coins: :environment do
    spinners = TTY::Spinner::Multi.new('[:spinner] including coins', format: :pulse_2)

    coins = [
      { description: 'Bitcoin', acronym: 'BTC',
        url_image: 'https://s2.coinmarketcap.com/static/img/coins/64x64/1.png' },
      { description: 'Etherium', acronym: 'ETH',
        url_image: 'https://s2.coinmarketcap.com/static/img/coins/64x64/1027.png' }
    ]

    coins.each do |coin|
      show_spinner("registering #{coin[:description]}", spinners) do
        Coin.find_or_create_by!(coin)
      end
    end
  end

  desc 'including mine types'
  task add_mine_types: :environment do
    spinners = TTY::Spinner::Multi.new('[:spinner] including mining types', format: :pulse_2)

    mining_types = [
      { description: 'Proof of Work', acronym: 'PoW' },
      { description: 'Proof of Stake', acronym: 'PoS' },
      { description: 'Proof of Capacity', acronym: 'PoC' }
    ]

    mining_types.each do |mining_type|
      show_spinner("registering #{mining_type[:description]}", spinners) do
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end

  private

  def show_spinner(message, spinners)
    spinner = spinners.register "[:spinner] #{message}"
    spinner.auto_spin
    yield
    spinner.success
  end
end
