require './lib/note.rb'

describe Note do

  before(:each) do
    @my_note = Note.new('Day3')
  end

  it 'should initialize title to contents of first argument' do
    expect(@my_note.title).to eq 'Day3'
  end

  it 'should initialize body to contents of second argument, if provided' do
    my_note = Note.new('Day3', 'Today was great!')
    expect(my_note.body).to eq 'Today was great!'
  end

  it 'should initialize body to empty string, if second argument not provided' do
    expect(@my_note.body).to eq ''
  end

end
