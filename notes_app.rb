require 'date'

#array to hold all notes.
@my_notes = Array.new

class note(title, body = "")
  @title = title
  @body = body
  @date =
  def body
    puts @body
  end
end
