require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET #index' do
    # context 'When no API survivors are recovered' do
    #   it "the listing table will be empty" do
    #
    #   end
    # end
    context 'When at least one survivor is recovered' do
      let(:home_controller) { HomeController.new }

      it "listing survivors in table" do
        survivor = [{ id: 1, name: "Zezinho" }]
        allow(home_controller).to receive(:index).and_return(survivor)
        visit root_path
        byebug
        expect(page).to have_selector :css, 'tbody tr.link-to-survivor'
      end
      # it "when click in any survivors redirect to your page" do
      #
      # end
    end
  end
end
