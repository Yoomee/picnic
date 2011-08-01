module MobileHelper
  
  def is_mobile_device?
    request.user_agent.to_s.downcase =~ Regexp.new(MobileHelper::MOBILE_USER_AGENTS) && !(request.user_agent.to_s.downcase =~ /ipad/)
  end
  
end
MobileHelper::MOBILE_USER_AGENTS =  'palm|blackberry|nokia|phone|midp|mobi|symbian|chtml|ericsson|minimo|' +
                      'audiovox|motorola|samsung|telit|upg1|windows ce|ucweb|astel|plucker|' +
                      'x320|x240|j2me|sgh|portable|sprint|docomo|kddi|softbank|android|mmp|' +
                      'pdxgw|netfront|xiino|vodafone|portalmmm|sagem|mot-|sie-|ipod|up\\.b|' +
                      'webos|amoi|novarra|cdm|alcatel|pocket|iphone|mobileexplorer|' +
                      'mobile'

