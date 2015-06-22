require "./lib/tictactoe"

describe 'Game' do 
	let(:game) { Game.new }
	before(:each) do 
		allow(game).to receive(:puts)
		allow(game).to receive(:print)
	
	end
	before(:all) do
			@p1 = Game::Player.new()
    @p2 = Game::Player.new()

	end

	describe "Player" do

    context "#new" do

      it "returns a new player 1 object" do
          expect(@p1).to be_an_instance_of Game::Player
      end

      it "returns a new player 2 object" do
          expect(@p2).to be_an_instance_of Game::Player
      end
    end

    context 'player' do
    	it 'has a name' do
    		expect(@p1.data).to be_eq('Hi osan. Symbol: X')
    	end
  	end
  end

	
end