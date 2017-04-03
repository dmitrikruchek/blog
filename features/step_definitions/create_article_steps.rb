Given(/^I am on articles page$/) do
	visit "/articles"
end

When(/^I click "(.*?)" link and log in with "(.*?)" "(.*?)"$/) do |link, user, pass|
        page.driver.authenticate(user, pass)
        click_link(link)
end

Then(/^Page should have field "(.*?)"$/) do |text|
        expect(page).to have_field text
end

Then(/^Page should return "(.*?)" code$/) do |code|
        expect(page.driver.status_code).to eq(code.to_i)
end

When(/^I create an article "(.*?)" "(.*?)"$/) do |title, text|
       fill_in "article_title", :with => title
       fill_in "article_text", :with => text
       click_on("Create Article")
end

When (/^I fill in the field "(.*?)" with "(.*?)"$/) do |field, text|
       fill_in field, :with => text
end

Then(/^Page should not have element "(.*?)"$/) do |element|
       expect(page).to have_no_xpath(element)
end

Then(/^Page should have element "(.*?)"$/) do |element|
       expect(page).to have_xpath(element)
end

Then(/^Element "(.*?)" should have value "(.*?)"$/) do |element, value|
       within(:xpath, element) do
         expect(page).to have_content value
       end 
end

Then(/^Page should have text "(.*?)" count "(.*?)"$/) do |text, count|
       expect(page).to have_text text, count: count.to_i
end

