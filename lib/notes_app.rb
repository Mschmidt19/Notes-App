require './note.rb'
require './notes_list.rb'

@notes_list = []

def print_menu
  puts "What would you like to do?"
  puts "1. View list of notes"
  puts "2. View contents of a note"
  puts "3. Add a note"
  puts "7. Load notes from notes.csv"
  puts "8. Save notes to notes.csv"
  puts "9. Exit"
end

def display_note_titles
  current_index = 1
  @notes_list.each do |note|
    puts "#{current_index}. #{note.title} - #{note.date}"
    current_index += 1
  end
end

def view_note_body
  puts "Please enter the index number of the note you would like to view"
  user_input = STDIN.gets.chomp
  while user_input.to_i.to_s != user_input || user_input.to_i < 0 || user_input.to_i > @notes_list.length
    puts "Please enter a valid integer between 0 and #{@notes_list.length}"
    user_input = STDIN.gets.chomp
  end
  puts @notes_list[user_input.to_i - 1].body
end

def new_note
  puts "Enter a title"
  user_title = STDIN.gets.chomp
  puts "Enter the contents of your new note"
  user_body = STDIN.gets.chomp
  @notes_list.push(Note.new(user_title, user_body))
  puts "Created a new note titled #{user_title}"
end

=begin
def display_sorted_notes
  puts "What would you like to sort by?"
  puts "Enter 'title' or 'date'"
  user_input = STDIN.gets.chomp
  if user_input == 'title'

  elsif user_input == 'date'

  end
end
=end

def save_notes
  #Open the file for writing
  file = File.open("notes.csv", "w")
  #Iterate over the array of students
  @notes_list.each do |note|
    note_data = [note.title, note.body, note.date]
    csv_line = note_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "Saved list to notes.csv"
end

def load_notes
  file = File.open("notes.csv", "r")
  file.readlines.each do |line|
    title, body, date = line.chomp.split(",")
    @notes_list.push(Note.new(title, body, date))
  end
  file.close
  puts "Loaded #{@notes_list.count} notes from notes.csv"
end

def process(selection)
  case selection
  when "1"
    display_note_titles
  when "2"
    view_note_body
  when "3"
    new_note
  when "7"
    load_notes
  when "8"
    save_notes
  when "9" #terminates the program
    puts "Goodbye!"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def run_notes_app
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

run_notes_app
