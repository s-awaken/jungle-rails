require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "clicking on detail button show  products_detail" do
    # ACT
    visit root_path
    first('.product .pull-right').click
    expect(page).to have_css '.product-detail'
    # # DEBUG
    # save_screenshot

    # VERIFY
   
  end


  scenario "clicking on image show products_detail" do
    # ACT
    visit root_path
    first('.product header img').click
    expect(page).to have_css '.product-detail'
    # # DEBUG
    # save_screenshot

    # VERIFY
   
  end




end
