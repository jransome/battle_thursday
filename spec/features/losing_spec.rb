feature 'FEATURE: losing the game' do
  scenario 'player 2 has 0 hp' do
    sign_in_and_play
    19.times do
      click_button('Attack')
    end
    expect(page).to have_content "Player 2 loses!"
  end
end
