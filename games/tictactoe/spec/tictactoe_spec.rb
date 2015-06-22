require "../lib/tictactoe"

describe 'Tic Tac Toe' do 
	let(:game) { Game.new }
	before(:each) do 
		allow(game).to receive(:puts)
		allow(game).to receive(:print)
	end

	it 'returns 2' do
		expect(example).to eq 2
	end
	
end