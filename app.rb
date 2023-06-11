require './book'
require './person'
require './decorator'
require './rental'
require './student'
require './teacher'
require './classroom'
require './data/load'
require './modules/list_records'
require './modules/create_records'
require 'json'

class App
  include ListItem
  include CreateItem

  def initialize
    @load = Load.new
    @books = []
    @people = []
    @rentals = []
  end

  def run
    puts 'Welcome to the School Library App!'
    loop do
      interface_menu
      option = gets.chomp
      if option == '7'
        puts 'Thank you for using the Library App!'
        break
      end
      option_selector(option)
    end
  end

  private

  def add_person(person)
    @people << person
  end

  def add_book(book)
    @books << book
  end

  def add_rental(rental)
    @rentals << rental
  end

  def option_selector(option)
    case option
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rentals_person
    else
      puts 'That is not a valid input'
    end
  end

  def interface_menu
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def save_person(person)
    people_data = []

    if File.exist?('./data/people.json')
      file = File.read('./data/people.json')
      people_data = JSON.parse(file) unless file.empty?
    end

<<<<<<< HEAD
    if person.is_a?(Teacher)
      people_data << { id: person.id, name: person.name, age: person.age, specialization: person.specialization }
    else
      people_data << { id: person.id, name: person.name, age: person.age }
    end
=======
    people_data << if person.is_a?(Teacher)
                     { id: person.id, name: person.name, age: person.age, specialization: person.specialization }
                   else
                     { id: person.id, name: person.name, age: person.age }
                   end
>>>>>>> 551b7a14f7f713cba9c48f80744b20540bdda69e

    File.write('./data/people.json', JSON.generate(people_data))
  end

  def save_book(book)
    books_data = []

    if File.exist?('./data/books.json')
      file = File.read('./data/books.json')
      books_data = JSON.parse(file)
    end

    books_data << { title: book.title, author: book.author }

    File.write('./data/books.json', JSON.pretty_generate(books_data))
  end
end
