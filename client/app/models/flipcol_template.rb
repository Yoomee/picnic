class FlipcolTemplate
  attr_reader :template
  
  class << self
    alias_method :find, :new
    
    def can_display_item?(item, template)
      case item.class.to_s
      when "Member" then true
      when "Struct::Tweet"
        [[2,1],[1,2],[2,2]].include?(template)
      when "Page","Section"
        if item.is_sponsor?
          [[1,1],[1,2]].include?(template)
        else
          [[1,2],[2,2],[2,3]].include?(template)
        end
      else
        true
      end
    end
  end
  
  def initialize(template_id = nil)
    template_id ||= rand(FlipcolTemplate::TEMPLATES.size)
    @template = FlipcolTemplate::TEMPLATES[template_id]
  end
  
  def has_subcols?
    template.any?{|flip_or_sub| flip_or_sub.flatten != flip_or_sub}
  end
  
  def flipitems
    items = []
    template.each do |flip_or_sub|
      if flip_or_sub.flatten != flip_or_sub
        items += flip_or_sub
      else
        items << flip_or_sub
      end
    end
    items
  end
  
  def size
    template.flatten.size / 2
  end

end

FlipcolTemplate::X1 = 230
FlipcolTemplate::Y1 = 140
FlipcolTemplate::MARGIN = 10

FlipcolTemplate::TEMPLATES = [
  [
    [2,3],[1,1],[1,1]
  ],
  [
    [[1,2],[1,2]],[[1,1],[1,2],[1,1]]
  ],
  [
    [2,2],[[1,1],[1,1]],[[1,2]]
  ],
  [
    [2,1],[2,2],[1,1],[1,1]
  ]
]