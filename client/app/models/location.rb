Location.class_eval do
  
  class << self
    
    def picnic_hq
      Location.new(:address1 => "Haarlemmerweg 321 B", :city => "Amsterdam", :postcode => "1051 LG", :country => "The Netherlands", :lat => "52.385226", :lng => "4.86557")
    end
    
    def picnic_festival
      Location.new(:address1 => "Neveritaweg 15", :city => "Amsterdam", :postcode => "1033 WB", :country => "The Netherlands", :lat => "52.403375", :lng => "4.88971")      
    end
    
  end
  
end