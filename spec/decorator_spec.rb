require_relative '../decorator'
require_relative '../person'
require_relative '../nameable'

describe Decorator do
  before :each do
    @person = Person.new(1, 27, 'chukwuemekaaa')
    @person2 = Person.new(2, 27, 'John')
  end

  context 'CapitalizeDecorator' do
    it 'capitalizes the name' do
      capitalize = CapitalizeDecorator.new(@person)
      expect(capitalize.correct_name).to eq('Chukwuemekaaa')
    end
    it 'capitalizes the name' do
      capitalize = CapitalizeDecorator.new(@person2)
      expect(capitalize.correct_name).to eq('John')
    end
  end

  context 'TrimmerDecorator' do
    it 'trims name with more than 10 characters' do
      trimmer = TrimmerDecorator.new(@person)
      expect(trimmer.correct_name).to eq('chukwuemek')
      expect(trimmer.correct_name.length).to be <= 10
    end

    it 'trims name with more than 10 characters' do
      trimmer = TrimmerDecorator.new(@person2)
      expect(trimmer.correct_name).to eq('John')
      expect(trimmer.correct_name.length).to be <= 10
    end
  end
end
