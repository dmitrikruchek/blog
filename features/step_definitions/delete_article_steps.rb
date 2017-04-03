When(/^I delete the article and confirm$/) do       
       page.accept_confirm { click_on ('Destroy') }
end

When(/^I delete the article and cancel$/) do
       page.dismiss_confirm { click_on ('Destroy') }
end

When(/^I change the credentials "(.*?)" "(.*?)"$/) do |user, pass|
      page.driver.authenticate(user, pass)
end




    
