require './lib/notes_list.rb'

describe NoteList do

  before(:each) do
    @my_list = NoteList.new
  end

  it 'should respond to method "add"' do
    expect(@my_list).to respond_to(:add)
  end

  it 'should respond to method "notes"' do
    expect(@my_list).to respond_to(:notes)
  end

  it 'should return an array when "notes" is called' do
    expect(@my_list.notes).to be_a(Array)
  end

  it 'should store added notes to be viewed later' do
    new_note = Note.new("Day3", "Progress so far:")
    @my_list.add(new_note)
    expect(@my_list.notes[0]).to eq new_note
  end
end
