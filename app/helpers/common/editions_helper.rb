module Common::EditionsHelper
  def current_edition
    Edition.last
  end

  def parse_date(date)
    date.present? ? Date.strptime(date, '%d/%m/%Y') : ''
  end
end
