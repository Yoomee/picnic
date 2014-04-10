module TramlinesBannings::MemberExtensions

  def self.included(klass)
    klass.belongs_to(:banned_by, :class_name => 'Member')
  end

  def banned?
    !banned_at.nil?
  end

  def banning
    Banning.find(id)
  end

end