class NoteList
  def initialize
    @list = []
  end
  attr_reader :list
  def add(note)
    @list.push(note)
  end
  def notes
    @list
  end
end
