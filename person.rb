class Person < Nameable
  attr_accessor :name, :age, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def add_rental(book, date)
    rentals << Rental.new(date, book, self)
  end

  private

  def of_age?
    @age >= 18
  end
end
