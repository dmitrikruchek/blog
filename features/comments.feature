Feature: Articles comments

Scenario Outline: Add a comment with an empty commenter
        Given I am on articles page
        When I click "New article" link and log in with "dhh" "secret"
          And I create an article "test_title" "test_content"
          And I create a comment <commenter> <body>
        Then Page should have content "Commenter can't be blank"
          And Page should not have element "/html/body/p[3]/strong"
          And Page should not have element "/html/body/p[4]/strong"
          And Page should not have link "Destroy Comment"

        Examples:
          |   commenter  |      body       |
          |     ""       |       ""        |
          |     ""       |  "test_comment" |

Scenario: Add a comment with an empty body
        Given I am on articles page
        When I click "New article" link and log in with "dhh" "secret"
          And I create an article "test_title" "test_content"
          And I create a comment "test_commenter" ""
        Then Page should have content "Body can't be blank"
          And Page should not have element "/html/body/p[3]/strong"
          And Page should not have element "/html/body/p[4]/strong"
          And Page should not have link "Destroy Comment"

Scenario: Create a comment
        Given I am on articles page
        When I click "New article" link and log in with "dhh" "secret"
          And I create an article "test_title" "test_content"
          And I create a comment "test_commenter" "test_body"
        Then Element "/html/body/p[3]" should have value "test_commenter"
          And Element "/html/body/p[4]" should have value "test_body"
          And Page should have link "Destroy Comment"

Scenario: Create multiple comments
        Given I am on articles page
        When I click "New article" link and log in with "dhh" "secret"
          And I create an article "test_title" "test_content"
          And I create a comment "test_commenter" "test_body"
          And I create a comment "test_commenter" "test_body2"
        Then Element "/html/body/p[3]" should have value "test_commenter"
          And Element "/html/body/p[4]" should have value "test_body"
        Then Element "/html/body/p[6]" should have value "test_commenter"
          And Element "/html/body/p[7]" should have value "test_body2"
          And Page should have text "Destroy Comment" count "2"

Scenario: Destroy a comment confirmed
        Given I am on articles page
        When I click "New article" link and log in with "dhh" "secret"
          And I create an article "test_title" "test_content"
          And I create a comment "test_commenter" "test_body"
        When I delete the comment and confirm
        Then Page should not have element "/html/body/p[3]/strong"
          And Page should not have element "/html/body/p[4]/strong"
          And Page should not have link "Destroy Comment"

Scenario: Destroy a comment canceled
        Given I am on articles page
        When I click "New article" link and log in with "dhh" "secret"
          And I create an article "test_title" "test_content"
          And I create a comment "test_commenter" "test_body"
        When I delete the comment and cancel
        Then Page should have element "/html/body/p[3]/strong"
          And Page should have element "/html/body/p[4]/strong"
          And Page should have link "Destroy Comment"


