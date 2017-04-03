Feature: Create an article

Scenario Outline: Create an article with an empty title
        Given I am on articles page
        When I click "New article" link and log in with "dhh" "secret"
          And I create an article <title> <text>
        Then Page should have content "Title can't be blank"
          And Page should not have content "Title is too short"
        When I am on articles page
        Then Page should not have element "/html/body/table/tbody/tr[2]/td[1]"
        Examples:
          |   title  |      text       |
          |     ""   |       ""        |
          |     ""   |  "test_content" |

Scenario Outline: Create an article with a short title
        Given I am on articles page
        When I click "New article" link and log in with "dhh" "secret"
          And I create an article <title> <text>
        Then Page should have content "Title is too short"
        When I am on articles page
        Then Page should not have element "/html/body/table/tbody/tr[2]/td[1]"

        Examples:
          |   title    |      text       |
          |   "1234"   |       ""        |
          |   "1"   |  "test_content" |


Scenario Outline: Create an article with valid fields
        Given I am on articles page
        When I click "New article" link and log in with "dhh" "secret"
          And I create an article <title> <text>
        Then Page should return "200" code
          And Page should have content "Comments"
          And Page should have content "Add a comment"
          And Page should have content "Commenter"
          And Page should have field "comment_commenter"
          And Field "comment_commenter" should have content ""
          And Page should have content "Body"
          And Page should have field "comment_body"
          And Field "comment_body" should have content ""
          And Element "/html/body/p[1]" should have value <title>
          And Element "/html/body/p[2]" should have value <text>
          And Page should have link "Edit"
          And Page should have link "Back"
        When I click "Back" link
        Then Element "/html/body/table/tbody/tr[2]/td[1]" should have value <title>
          And Element "/html/body/table/tbody/tr[2]/td[2]" should have value <text>
          And Page should have link "Show"
          And Page should have link "Edit"
          And Page should have link "Destroy"

        Examples:
          |   title                         |      text                     |
          |   "12345"                       |       ""                      |
          |   "test_title"                  |  "test_content"               |
          |   "вы говорите по французски?"  |  "вы говорите по французски?" |


Scenario: Create an article with an empty content
        Given I am on articles page
        When I click "New article" link and log in with "dhh" "secret"
          And I create an article "test_title" ""
        Then Page should return "200" code
          And Page should have content "test_title"

Scenario: Create articles with the same title
        Given I am on articles page
        When I click "New article" link and log in with "dhh" "secret"
          And I create an article "test_title" "test_content"
        When I am on articles page
          And I click "New article" link and log in with "dhh" "secret"
          And I create an article "test_title" "test_content"
        Then Page should return "200" code
        When I click "Back" link
        Then Page should have text "test_title" count "2"
          And Page should have text "test_content" count "2"


