# frozen_string_literal: true

module ApplicationHelper
  def date_br(data_us = Date.today)
    data_us.strftime('%d/%m/%Y')
  end
end
