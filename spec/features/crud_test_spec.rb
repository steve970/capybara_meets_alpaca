require "rails_helper"

describe "the user facing interactions with crud" do
  it "is complete" do
    visit "/alpacas"
    expect(page).to have_content "Alpacas for sale"

    click_on "New Alpaca"

    fill_in "Name", with: "Andy the Alpaca"
    fill_in "Hair color", with: "Blue as midnight"
    fill_in "Birthday", with: "11/11/11"
    fill_in "Number of friends", with: 1

    click_on "Create Alpaca"
    # Should redirect to show page

    expect(page).to have_content "Andy the Alpaca"
    expect(page).to have_content "Blue as midnight"
    expect(page).to have_content "11-11-11"
    expect(page).to have_content "1"

    click_on "Edit"

    fill_in "Name", with: "Andy the Alpaca!"
    fill_in "Hair color", with: "Blue as midnight!"
    fill_in "Birthday", with: "12-12-12"
    fill_in "Number of friends", with: 2

    click_on "Update Alpaca"
    # Should redirect to show page

    expect(page).to have_content "Andy the Alpaca!"
    expect(page).to have_content "Blue as midnight!"
    expect(page).to have_content "12-12-12"

    visit "/alpacas"

    click_on "Destroy"

    expect(page).to_not have_content "Andy the Alpaca"
    expect(page).to_not have_content "Blue as midnight"
    expect(page).to_not have_content "12-12-12"
    expect(page).to_not have_content "1"

    expect(page).to have_content "Alpacas for sale"
  end
end
