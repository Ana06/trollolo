require 'spec_helper'

describe Trello do

  let(:trello) { t = Trello.new(dummy_settings); t.board_id = "myboard"; t }

  describe "lists" do
    it "returns a list of cards" do
      stub_request(:get, "https://trello.com/1/boards/myboard/lists?key=mykey&token=mytoken").
         to_return(:status => 200, :body => load_test_file('lists.json'))
      expect(trello.lists).to be_a(Array)
    end
  end
end
