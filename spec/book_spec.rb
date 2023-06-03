require_relative '../book'

describe Book do
  context 'create a book' do
    book = Book.new 'Social Media Marketing', 'Henry'

    it 'show the title' do
      expect(book.title).to eq 'Social Media Marketing'
    end

    it 'show the author' do
      expect(book.author).to eq 'Henry'
    end
  end
end
