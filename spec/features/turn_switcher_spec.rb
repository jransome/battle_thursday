feature 'FEATURE: switch turn' do
  scenario "game starts on player 1's turn" do
    sign_in_and_play
    expect(page).to have_content "It's Antoine's turn"
  end

  scenario 'After player 1 attacks, player 2 has a turn' do
    sign_in_and_play
    click_button "Attack"
    expect(page).to have_content "It's James's turn"
  end
end
