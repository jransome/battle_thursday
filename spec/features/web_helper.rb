def sign_in_and_play
  visit('/')
  fill_in :player_1_name, with: 'Antoine'
  fill_in :player_2_name, with: 'James'
  click_button 'Submit'
end