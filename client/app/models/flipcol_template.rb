class FlipcolTemplate
  attr_reader :template
  
  class << self
    alias_method :find, :new
  end
  
  def initialize(template_id = nil)
    template_id ||= rand(FlipcolTemplate::TEMPLATES.size - 1) + 1
    @template = FlipcolTemplate::TEMPLATES[template_id]
  end
  
  def has_subcols?
    template.any?{|flip_or_sub| flip_or_sub.flatten != flip_or_sub}
  end
  
  def size
    template.flatten.size / 2
  end

end

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