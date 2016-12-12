require 'graph'

describe Graph do

  context '#building a graph' do
    it 'reads a text file and creates edges' do
      expect{subject.parse_n_build('testinput.txt')}.to change{subject.edges.count}.from(0).to(9)
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

  context 'number of trips tests' do
    it 'counts the number of possible journeys for route C-C with max 3 stops' do
      Infinity = 1.0 / 0
      subject.parse_n_build('testinput.txt')
      expect(subject.num_of_trips('C', 'C', :min_stops => 1, :max_stops => 2)).to eq (2)
    end

    it 'counts the number of possible journeys for route A-C with exactly 4 stops' do
      Infinity = 1.0 / 0
      subject.parse_n_build('testinput.txt')
      expect(subject.num_of_trips('A', 'C', :min_stops => 4, :max_stops => 4)).to eq (3)
    end

    it 'counts the number of possible journeys for route C-C with distance >30' do
      Infinity = 1.0 / 0
      subject.parse_n_build('testinput.txt')
      expect(subject.num_of_trips('A', 'C', :min_stops => 1, :max_stops => Infinity, :max_distance => 30)).to eq (7)
    end
  end

  context 'shortest distance tests' do
    it 'finds the shortest distance possible for route A-C' do
      subject.parse_n_build('testinput.txt')
      expect(subject.shortest_dis('AC')). to eq (9)
    end

    it 'finds the shortest distance possible for route B-B' do
      subject.parse_n_build('testinput.txt')
      expect(subject.shortest_dis('BB')). to eq (9)
    end
  end
end
