Given /^I visit the home page$/ do
  visit "/"
end

Given /^I submit an awesome fucking song$/ do
  puts page.body
  click_link "Submit an awesome fucking song"
  fill_in "Artist", :with => "the artist name"
  fill_in "Track", :with => "the track name"
  fill_in "Url", :with => "http://www.song.com"
  click_button "Submit"
end

Then /^I should see a thank you message$/ do
  page.should have_content "Thanks for submitting your song! It will be available once we have concluded that it is indeed a fucking awesome song."
end

Then /^I do not see that song$/ do
  page.should_not have_content "the artist name"
end

Given /^I visit the moderation page$/ do
  visit "/moderate"
end

Given /^I approve that song$/ do
  puts page.body
  click_button "Approve"
end

Then /^I see that song$/ do
  page.should have_content "the artist name"
end

Then /^I see the song artist, title and url$/ do
  page.should have_link "the artist name - the track name", :href => "http://www.song.com"
end
