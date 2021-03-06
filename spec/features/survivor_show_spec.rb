require 'rails_helper'

describe 'survivor page content' do
  before do
    allow(Requester).to receive(:get).with('survivors/1').and_return(survivors)
  end

  context 'when try update your location' do
    let(:survivors) {
      {
        id: 1,
        name: "Zezinho",
        age: 10,
        gender: 'M',
        latitude: 222,
        longitude: 111,
        created_at: '2017-05-19T12:10:12.544Z'
      }.as_json
    }

    it "expect the page have the button for show edit modal" do
      visit '/survivors/1'
      expect(page).to have_content 'Edit your location'
    end
    it "modal should keep hidden until the button is clicked" do
      visit '/survivors/1'
      expect(page).to have_selector :css, 'div#edit-location-modal.fade'
    end
    it "click in the button 'edit your location' should open modal", js: true do
      visit '/survivors/1'
      click_on 'Edit your location'
      expect(page).to have_selector :css, 'div#edit-location-modal.fade.in'
    end
    context 'The location information must be in the modal' do
      it "latitude" do
        visit '/survivors/1'
        expect(find_field(id: 'latitude').value).to eq '222'
      end
      it "longitude" do
        visit '/survivors/1'
        expect(find_field(id: 'longitude').value).to eq '111'
      end
    end
  end
end
