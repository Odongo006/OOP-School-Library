module CreateRecords
  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]'
    option = gets.chomp

    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'That is not a valid input'
    end
  end

  def create_student
    id = @people.length + 1
    puts 'Name:'
    name = gets.chomp
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Has parent permission? [Y/N]?'
    permission = gets.chomp.downcase
    parent_permission = permission == 'y'
    student = Student.new(id, age, name, parent_permission)
    add_person(student)
    save_person(student)
    puts 'Student created successfully'
  end

  def create_teacher
    puts 'Name:'
    name = gets.chomp
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Specialization:'
    specialization = gets.chomp
    teacher = Teacher.new(name, age, specialization)
    add_person(teacher)
    save_person(teacher)
    puts 'Teacher created successfully'
  end

  def create_book
    puts 'Title:'
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp
    book = Book.new(title, author)
    add_book(book)
    save_book(book)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) #{book.title}" }
    book_index = gets.chomp.to_i

    if book_index.negative? || book_index >= @books.length
      puts 'Invalid book selection'
      return
    end

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index { |person, index| puts "#{index}) #{person.name}" }
    person_index = gets.chomp.to_i

    if person_index.negative? || person_index >= @people.length
      puts 'Invalid person selection'
      return
    end

    puts 'Date:'
    date = gets.chomp

    book = @books[book_index]
    puts "Selected book: #{book.title} by #{book.author}"

    rental = Rental.new(date, book, @people[person_index])
    add_rental(rental)
  end
end
