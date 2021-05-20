# frozen_string_literal: true

class Coin < ApplicationRecord
  belongs_to :mining_type # , optional: true
end
