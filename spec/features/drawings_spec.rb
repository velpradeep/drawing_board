require 'rails_helper'

RSpec.feature "Drawings", type: :feature do

  scenario 'navigates to the drawings page' do
    visit '/'
    expect(page).to have_css("div.flex-container")
    expect(page).to have_css("div.drawing_box_container")
  end

  scenario 'checks the color palatte section' do
    visit '/'
    expect(page).to have_content("Color Pallate")
    expect(page).to have_css("div.color_pallate_section")
    find_field(id: 'colorinput').visible?
  end

  scenario 'checks the leader board section' do
    visit '/'
    expect(page).to have_content("Leader Board")
    expect(page).to have_css("div.leader_board_section")
    expect(page.has_selector?('table tr')).to be true
  end

  scenario 'checks the drawing board section' do
    visit '/'
    expect(page).to have_css("div.flex-container")
  end

  scenario 'click the color input pallatte' do
    visit '/'
    find('#colorinput').click
    find('#colorinput').set('#00000')
  end

  scenario 'click the square boxes without choosing the color' do
    visit '/'
    first('.square_box').click
    find('#colorinput').click
  end






























end
