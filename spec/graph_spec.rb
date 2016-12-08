require 'graph'

describe Graph do

  context '#building a graph' do
    it 'reads a text file and creates edges' do
      expect{subject.parse_n_build('testinput.txt')}.to change{subject.edges.count}.from(0).to(9)
    end
  end

  context '#route planning' do
    it 'computes the distance given a path' do
      subject.parse_n_build('testinput.txt')
      expect(subject.distance('ABC')).to eq (9)
    end

    it 'counts the number of possible journeys' do
      
    end

  end
end
