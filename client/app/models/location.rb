Location.class_eval do
  
  class << self
    
    def picnic_hq
      Location.new(:address1 => "Piet Heinkade 181 A", :city => "Amsterdam", :postcode => "1019 HC", :country => "The Netherlands", :lat => "52.376942", :lng => "4.921891")
    end
    
    def picnic_festival
      Location.new(:address1 => "Neveritaweg 15", :city => "Amsterdam", :postcode => "1033 WB", :country => "The Netherlands", :lat => "52.403375", :lng => "4.88971")      
    end
    
  end
  
end