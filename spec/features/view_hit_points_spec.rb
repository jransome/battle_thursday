feature "can see the other player's hitpoints" do

  scenario "game start" do
    visit('/')
    fill_in :player_1_name, with: 'Antoine'
    fill_in :player_2_name, with: 'James'
    click_button 'Submit'

    expect(page).to have_content "Antoine's HP: 100", "James's HP: 100"

  end

end
