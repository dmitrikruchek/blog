Feature: Delete an article

Scenario: Delete an article no confirmation
        Given I am on articles page
        When I click "New article" link and log in with "dhh" "secret"
          And I create an article "test_title" "test_content"
        When I am on articles page
          And I delete the article and cancel
        Then Page should have element "/html/body/table/tbody/tr[2]/td[1]"
          And Page should have content "test_title"
          And Page should have content "test_content"
          And Page should have link "Show"
          And Page should have link "Edit"
          And Page should have link "Destroy"

Scenario: Delete an article with confirmation
        Given I am on articles page
        When I click "New article" link and log in with "dhh" "secret"
          And I create an article "test_title" "test_content"
        When I am on articles page
          And I delete the article and confirm
        Then Page should not have element "/html/body/table/tbody/tr[2]/td[1]"
          And Page should not have content "test_title"
          And Page should not have content "test_content"
          And Page should not have link "Show"
          And Page should not have link "Edit"
          And Page should not have link "Destroy"

Scenario: Delete an article with wrong creds
        Given I am on articles page
        When I click "New article" link and log in with "dhh" "secret"
          And I create an article "test_title" "test_content"
        When I am on articles page
          And I change the credentials "user" "pass"
          And I am on articles page
          And I delete the article and confirm
        Then Page should have content "Access denied"
        When I am on articles page
        Then Page should have element "/html/body/table/tbody/tr[2]/td[1]"
          And Page should have content "test_title"
          And Page should have content "test_content"


