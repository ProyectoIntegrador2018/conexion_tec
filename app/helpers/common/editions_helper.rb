module Common::EditionsHelper
  def current_edition
    Edition.last
  end
end
