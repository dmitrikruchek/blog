Feature: Base pages verification 

Scenario: Visit the home page
	Given I am on the home page
        Then Page should return "200" code
	  And Page should have content "Hello, Rails!"	
          And Page should have title "Blog"
          And Page should have link "My Blog"
        When I click "My Blog" link
        Then Page should have content "Listing Articles"

Scenario: Visit non-existing page
        Given I am on non-existing page
        Then Page should return "404" code
          And Page should not have content "Routing Error No route matches"
          And Page should have content "The page you're looking for does not exist"

Scenario: Visit articles page
        Given I am on articles page
        Then Page should return "200" code
          And Page should have title "Blog"
          And Page should have content "Listing Articles"
          And Page should have content "Title"
          And Page should have content "Text"
          And Page should have link "New article"

Scenario Outline: Visit New article page with invalid creds
        Given I am on articles page
        When I click "New article" link and log in with <user> <pass>
        Then Page should have content "Access denied"

        Examples:
          |   user  |    pass    |
          |  ""     |     ""     |
          |  "dhh"  |     ""     |
          |  ""     |  "secret"  |
          |  "user" |  "pass"    |
          |  "dhh"  |  "pass"    |
          |  "user" |  "secret"  |

Scenario: Visit New article page with valid creds
        Given I am on articles page
        When I click "New article" link and log in with "dhh" "secret"
        Then Page should return "200" code
          And Page should have content "New article"
          And Page should have title "Blog"
          And Page should have content "Title"
          And Page should have field "article_title"
          And Field "article_title" should have content ""
          And Page should have content "Text"
          And Page should have field "article_text"
          And Field "article_text" should have content ""
          And Page should have link "Back"
          And Page should have button "Create Article"
        When I click "Back" link
        Then Page should have content "Listing Articles"

