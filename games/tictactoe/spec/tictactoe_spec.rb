require "./lib/tictactoe"

describe 'Game' do 
	let(:game) { Game.new }
	before(:each) do 
		allow(game).to receive(:puts)
		allow(game).to receive(:print)
		@p1 = Game::Player.new()
    @p2 = Game::Player.new()
    @p1.name = 'osan'
    @p2.name = 'mike'
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
    		expect(@p1.name).to be_eq 'osan'
    	end
  	end
  end

	
end