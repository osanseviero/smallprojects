require "./lib/tictactoe"

describe 'Tic Tac Toe' do 
	let(:game) { Game.new }
	before(:each) do 
		allow(game).to receive(:puts)
		allow(game).to receive(:print)
		@p1 = Player.new()
    @p2 = Player.new()
    @p1.name = 'osan'
    @p2.name = 'mike'
	end

	describe "Player" do

    context "#new" do

      it "returns a new player 1 object" do
          expect(@p1).to be_an_instance_of Player
      end

      it "returns a new player 2 object" do
          expect(@p2).to be_an_instance_of Player
      end
    end
  end
	
end