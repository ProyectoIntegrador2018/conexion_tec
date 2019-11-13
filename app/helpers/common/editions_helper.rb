module Common::EditionsHelper
  def parse_date(date)
    date.present? ? Date.strptime(date, '%d/%m/%Y') : ''
  end
end
