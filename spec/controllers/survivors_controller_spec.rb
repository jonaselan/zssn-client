require 'rails_helper'

RSpec.describe SurvivorsController, type: :controller do
  describe 'GET #show' do
    it "sim" do
      visit '/survivors/1'
      byebug
    end
  end
end
