When(/^I create a comment "(.*?)" "(.*?)"$/) do |commenter, text|
       fill_in "comment_commenter", :with => commenter
       fill_in "comment_body", :with => text
       click_on("Create Comment")
end

When(/^I delete the comment and confirm$/) do
       page.accept_confirm { click_on ('Destroy Comment') }
end

When(/^I delete the comment and cancel$/) do
       page.dismiss_confirm { click_on ('Destroy Comment') }
end

