feature "FEATURE: can see the other player's hitpoints" do
  scenario "game start" do
    sign_in_and_play
    expect(page).to (have_content "Antoine's HP: 100") && (have_content "James's HP: 100")
  end
end
