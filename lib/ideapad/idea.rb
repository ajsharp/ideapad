
module Ideapad
  class Idea
    attr_accessor :text
    attr_reader :timestamp

    def initialize(idea_text)
      @text = idea_text.strip
      @timestamp = Time.now
    end
  end
end
