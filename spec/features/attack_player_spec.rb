feature 'attack player' do
  scenario 'game in progress' do
    sign_in_and_play
    click_button('Attack')
    expect(page).to have_content "Antoine has attacked James"
  end
end
