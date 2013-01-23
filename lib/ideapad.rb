
$:.push(File.dirname(File.expand_path(__FILE__)))

module Ideapad
  autoload :IdeaList, 'ideapad/idea_list'
  autoload :Idea, 'ideapad/idea'

  def self.load_list!
    IdeaList.load!
  end
end
