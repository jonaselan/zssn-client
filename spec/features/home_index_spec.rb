require 'rails_helper'

describe 'home page content' do
  before do
    allow(Requester).to receive(:get).with('survivors').and_return(survivors)
  end

  context 'when at least one survivor is recovered' do
    let(:survivors) { [{ id: 1, name: "Zezinho" }].as_json }
    let(:survivor_id) { survivors[0]['id'] }

    it "listing survivors in table" do
      visit root_path
      expect(page).to have_selector :css, 'tbody tr.link-to-survivor'
    end
    it "when click in any survivors redirect to your main page", js: true do
      visit root_path
      find('tr', id: "survivor-#{survivor_id}").click
      expect( page ).to have_current_path(survivor_path(survivor_id))
    end
  end

  context 'When no API survivors are recovered' do
    let(:survivors) {[]}
    it "the listing table will be empty" do
      visit root_path
      expect(page).to have_content 'No survivor exist. Are they all dead? :('
    end
  end

end
