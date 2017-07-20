feature 'attack player' do
  scenario 'player 1s attack' do
    sign_in_and_play
    click_button('Attack')
    expect(page).to have_content "Antoine has attacked James"
  end

  scenario 'player 2s attack' do
    sign_in_and_play
    click_button('Attack')
    click_button('Attack')
    expect(page).to have_content "James has attacked Antoine"
  end
end
