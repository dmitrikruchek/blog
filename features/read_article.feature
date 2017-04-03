Feature: Read articles

Scenario: Read an existing article
        Given I am on articles page
        When I click "New article" link and log in with "dhh" "secret"
          And I create an article "test_title" "test_content"
        When I am on articles page
          And I click "Show" link
        Then Page should return "200" code
          And Page should have content "Comments"
          And Page should have content "Add a comment"
          And Page should have content "Commenter"
          And Page should have field "comment_commenter"
          And Page should have content "Body"
          And Page should have field "comment_body"
          And Element "/html/body/p[1]" should have value "Title: test_title"
          And Element "/html/body/p[2]" should have value "Text: test_content"
          And Page should have link "Edit"
          And Page should have link "Back"



