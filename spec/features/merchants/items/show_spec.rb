require "rails_helper"

RSpec.describe "Merchant items show page", type: :feature do
  before :each do
    load_test_data
  end

  # User Story 7
  it "When I click on the name I am taken to that merchant's item's show page " do
    visit "/merchants/#{@merchant_1.id}/items"
    click_link "Watch"
    expect(page).to have_current_path("/merchants/#{@merchant_1.id}/items/#{@item_1_m1.id}")
  end

  # User Story 7
  it "I see a list of the names of all of my items, And I do not see items for any other merchant" do
    visit "/merchants/#{@merchant_1.id}/items/#{@item_1_m1.id}"

    expect(page).to have_content(@item_1_m1.name)
    expect(page).to have_content(@item_1_m1.description)
    expect(page).to have_content(@item_1_m1.unit_price)
  end
  
    # User Story 8
  
    it "I see a link to update the item information that takes me to the edit page." do
      visit "/merchants/#{@merchant_1.id}/items/#{@item_1_m1.id}"

      click_link "Edit #{@item_1_m1.name}"
      expect(page).to have_current_path("/merchants/#{@merchant_1.id}/items/#{@item_1_m1.id}/edit")
      
    end
  
    it "I see a form filled in with the existing item attribute information." do
      visit "/merchants/#{@merchant_1.id}/items/#{@item_1_m1.id}/edit"
  
      expect(page).to have_field("Name", with: @item_1_m1.name)
      expect(page).to have_field("Description", with: @item_1_m1.description)
      expect(page).to have_field("Unit price", with: @item_1_m1.unit_price)
      
    end
  
    it "update infomation and click submit" do
      visit "/merchants/#{@merchant_1.id}/items/#{@item_1_m1.id}/edit"
      
      fill_in 'Name', with: 'Shirt'
      fill_in 'Description', with: 'For your body'
      fill_in 'Unit price', with: '100'

      click_button "Submit"
      expect(page).to have_current_path("/merchants/#{@merchant_1.id}/items/#{@item_1_m1.id}")

      expect(page).to have_content('Shirt')
      expect(page).to have_content('For your body')
      expect(page).to have_content(100)

      expect(page).to have_content('Item information was successfully updated.')
    
    end
end