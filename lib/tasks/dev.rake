namespace :dev do
  desc 'sets up the development environment'
  task setup: :environment do
    # %x(rails db:drop db:create db:migrate db:seed)
    return unless Rails.env.development?

    spinners = TTY::Spinner::Multi.new('[:spinner] loading', format: :pulse_2)

    show_spinner('dropping database', spinners) { `rails db:drop` }
    show_spinner('creating database', spinners) { `rails db:create` }
    show_spinner('migrating database', spinners) { `rails db:migrate` }
    show_spinner('seeding database', spinners) { `rails db:seed` }
  end

  private

  def show_spinner(message, spinners)
    spinner = spinners.register "[:spinner] #{message}"
    spinner.auto_spin
    yield
    spinner.success
  end
end
