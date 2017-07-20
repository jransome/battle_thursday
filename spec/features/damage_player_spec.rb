feature "FEATURE: attacks damage players" do
  scenario "player 1 attacks player 2" do
    sign_in_and_play
    click_button "Attack"
    expect(page).to have_content("James's HP: 90")
  end

  scenario "player 2 attacks player 1" do
    sign_in_and_play
    click_button "Attack"
    click_button "Attack"
    expect(page).to have_content("Antoine's HP: 90")
  end
end
