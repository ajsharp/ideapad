
module Ideapad
  class IdeaList
    DB_NAME = '~/.ideas.db'

    attr_reader :ideas
    def initialize(ideas = [])
      @ideas = Array(ideas)
    end

    # Add an idea to the list
    #
    # @param [String] text the text of an idea
    def add_idea(text)
      idea = ideas.push(Idea.new(text))
      save
      idea
    end

    # Marshal the array of ideas to disk
    def save
      File.write(db, Marshal.dump(ideas))
    end

    def size
      ideas.size
    end

    def first_idea_ts
      ideas.first.timestamp if ideas.first
    end

    def pop
      ideas.pop
      save
    end

    def pretty
      msg = ["#{size} ideas recorded since #{first_idea_ts}"]
      msg << ""
      ideas.each_with_index do |idea, i|
        msg << "[#{i+1}] => [#{idea.timestamp}] #{idea.text}"
      end
      puts msg.join("\n")
    end

    def db
      self.class.db
    end

    def self.db
      @db ||= File.expand_path(DB_NAME)
    end

    # Read the DB file from disk, deserialize it and initialize an
    # IdeaList instance
    def self.load!
      if File.exist?(db)
        save
        new Marshal.load(File.read(db))
      else
        new
      end
    end
  end
end
