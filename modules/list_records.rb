module ListItem
  def list_books
    @load.load_books
    if @load.books.empty?
      puts 'There are no books in the library'
    else
      @load.books.each do |book|
        puts "Title: #{book.title}, Author: #{book.author}".capitalize
      end
    end
  end

  def list_people
    @load.load_people
    if @load.people.empty?
      puts 'There are no people in the library'
    else
      @load.people.each do |person|
        if person.is_a?(Teacher) && person.specialization
          print "[Teacher] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}, "
          puts "Specialization: #{person.specialization}"
        else
          puts "[Student] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
        end
      end
    end
  end

  def list_rentals_person
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index { |person, index| puts "#{index}) #{person.name}" }
    person_index = gets.chomp.to_i
    show_rentals_person(person_index)
  end

  def show_rentals_person(person_index)
    person = @people[person_index]
    puts "#{person.name} has rented the following books:"
    person.rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
    end
  end
end
