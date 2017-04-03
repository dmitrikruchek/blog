Given(/^I am on the home page$/) do
	visit "/"
end

Given(/^I am on non-existing page$/) do
        visit "/idonotexist"
end

Then(/^Page should have content "(.*?)"$/) do |text|
        expect(page).to have_content text
end

Then(/^Page should not have content "(.*?)"$/) do |text|
        expect(page).not_to have_content text
end

Then(/^Page should have title "(.*?)"$/) do |text|
        expect(page).to have_title text
end

Then(/^Page should have link "(.*?)"$/) do |text|
        expect(page).to have_link text
end

Then(/^Page should not have link "(.*?)"$/) do |text|
        expect(page).not_to have_link text
end

Then(/^Page should have button "(.*?)"$/) do |text|
        expect(page).to have_button text
end

When (/^I click "(.*?)" link$/) do |link|
	click_link(link)
end

When (/^I click "(.*?)" button$/) do |button|
        click_on(button)
end

Then(/^Field "(.*?)" should have content "(.*?)"$/) do |field, content|
        expect(find_field(field).value).to eq content
end


