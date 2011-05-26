Location.class_eval do
  
  class << self
    
    def picnic_hq
      Location.new(:address1 => "Haarlemmerweg 321 B", :city => "Amsterdam", :postcode => "1051 LG", :country => "The Netherlands", :lat => "52.385226", :lng => "4.86557")
    end
    
    def picnic_festival
      Location.new(:address1 => "Pazzanistraat 41", :city => "Amsterdam", :postcode => "1014 DB", :country => "The Netherlands", :lat => "52.385933", :lng => "4.872351")      
    end
    
  end
  
end