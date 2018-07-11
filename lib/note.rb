require 'date'

class Note
  def initialize(title, body = "", date = Time.now)
    @title = title
    @body = body
    @date = date
  end
  attr_reader :title
  attr_reader :body
  attr_reader :date
end
