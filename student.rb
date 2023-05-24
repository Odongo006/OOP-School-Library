require './person'

class Student < Person
  attr_reader :classroom

  def initialize(id, age, classroom, name = 'Unknown', parent_permission = true)
    super(id, age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end

student = Student.new(1, 18, 'Mathematics', 'John Doe')

puts student.id # Output: 1
puts student.name # Output: John Doe
puts student.age # Output: 18
puts student.classroom # Output: Mathematics

puts student.play_hooky # Output: ¯\(ツ)/¯
