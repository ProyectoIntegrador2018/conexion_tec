module Common::EditionsHelper
  def current_edition
    Edition.last
  end

  def parse_date(date)
    Date.strptime(date, '%d-%m-%Y')
  end
end
