class RandomConnection < Connection

  attr_reader :reason

  class << self
    
    private
    def args_for_initialize(member, options = {})
      reasons = RandomConnection::REASONS.dup
      Member.not_including(member).without_friend_request_with(member).random.limit(options[:limit]).map {|member| [member, reasons.remove_one_at_random!]}
    end
    
  end

  def initialize(member, reason)
    @member, @reason = member, reason
  end
  
end

RandomConnection::REASONS = [
  'could be your soulmate',
  'might like to get to know you',
  'is lost',
  'wears nice shoes',
  'has some tasty sandwiches',
  'has forgotten their hamper',
  "stole your pork pie while you weren't looking",
  'admires you'
]