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
      subject.parse_n_build('testinput.txt')
      expect(subject.num_of_trips('A', 'C', :min_stops => 4, :max_stops => 4)).to eq (3)
    end
  end

  context 'distance tests' do
    it 'computes the distance given a path A-B-C' do
    subject.parse_n_build('testinput.txt')
    expect(subject.distance('ABC')).to eq (9)
    end

    it 'computes the distance given a path A-D' do
    subject.parse_n_build('testinput.txt')
    expect(subject.distance('AD')).to eq (5)
    end

    it 'computes the distance given a path A-D-C' do
    subject.parse_n_build('testinput.txt')
    expect(subject.distance('ADC')).to eq (13)
    end

    it 'computes the distance given a path A-E-B-C-D' do
    subject.parse_n_build('testinput.txt')
    expect(subject.distance('AEBCD')).to eq (22)
    end

    it 'computes the distance given a path A-E-D' do
    subject.parse_n_build('testinput.txt')
    expect(subject.distance('AED')).to eq ('NO SUCH ROUTE')
    end
  end



end
