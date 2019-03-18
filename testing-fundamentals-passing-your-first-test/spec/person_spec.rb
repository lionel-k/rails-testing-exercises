require_relative '../lib/person'

describe Person do
  describe '#full_name' do
    it 'returns the first and last names concatenated' do
      person = Person.new(first_name: 'Barack', last_name: 'Obama')
      expect(person.full_name).to eq('Barack Obama')
    end
  end
end
