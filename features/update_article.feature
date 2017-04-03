Feature: Update an article

Scenario: Verify edit page
        Given I am on articles page
        When I click "New article" link and log in with "dhh" "secret"
          And I create an article "test_title" "test_content"
          And I click "Edit" link
        Then Page should return "200" code
          And Page should have title "Blog"
          And Page should have content "Edit article"
          And Page should have field "article_title"
          And Field "article_title" should have content "test_title"
          And Page should have field "article_text"
          And Field "article_text" should have content "test_content"
          And Page should have button "Update Article"
          And Page should have link "Back"

Scenario Outline: Update an article with an empty title
        Given I am on articles page
        When I click "New article" link and log in with "dhh" "secret"
          And I create an article "test_title" "test_content"
          And I click "Edit" link
        When I fill in the field "article_title" with <new_title>
          And I fill in the field "article_text" with <new_text>
          And I click "Update Article" button
        Then Page should have content "Title can't be blank"
          And Page should not have content "Title is too short"
        When I am on articles page
        Then Element "/html/body/table/tbody/tr[2]/td[1]" should have value "test_title"
          And Element "/html/body/table/tbody/tr[2]/td[2]" should have value "test_content"

        Examples:
          |   new_title  |    new_text     |
          |     ""       |       ""        |
          |     ""       |  "test_content" |

Scenario Outline: Update an article with a a short title
        Given I am on articles page
        When I click "New article" link and log in with "dhh" "secret"
          And I create an article "test_title" "test_content"
          And I click "Edit" link
        When I fill in the field "article_title" with <new_title>
          And I fill in the field "article_text" with <new_text>
          And I click "Update Article" button
        Then Page should have content "Title is too short"
        When I am on articles page
        Then Element "/html/body/table/tbody/tr[2]/td[1]" should have value "test_title"
          And Element "/html/body/table/tbody/tr[2]/td[2]" should have value "test_content"

        Examples:
          |   new_title      |    new_text     |
          |     "1234"       |       ""        |
          |     "1"       |  "test_content" |

Scenario Outline: Update an article with valid attributes
        Given I am on articles page
        When I click "New article" link and log in with "dhh" "secret"
          And I create an article "test_title" "test_content"
          And I click "Edit" link
        When I fill in the field "article_title" with <new_title>
          And I fill in the field "article_text" with <new_text>
          And I click "Update Article" button
        When I am on articles page
        Then Element "/html/body/table/tbody/tr[2]/td[1]" should have value <new_title>
          And Element "/html/body/table/tbody/tr[2]/td[2]" should have value <new_text>

        Examples:
          |     new_title                   |      new_text                 |
          |   "12345"                       |       ""                      |
          |   "new_test_title"              |  "new_test_content"           |
          |   "вы говорите по французски?"  |  "вы говорите по французски?" |






