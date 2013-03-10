Feature: Merge Articles
  As a typo blog administrator
  So that I can consolidate blog content
  I want to be able to merge articles of similar content

Background: Users and articles in the database
  Given the blog is set up

  Given the following users exist:
    | login  | password   | email           | name | profile_id | state  |
    | bob    | bob_passwd | bob@nowhere.com | bob  | 1          | active |
    | ted    | ted_passwd | ted@nowhere.com | ted  | 2          | active |

  Given the following articles exist:
    | title          | author | user_id | body       | allow_comments | published | published_at        | state     | type    |
    | Midlife Crisis | bob    | 100     | It sucks   | true           | true      | 2013-03-03 12:00:00 | published | Article |
    | Getting Old    | ted    | 101     | Sucks hard | true           | true      | 2013-03-03 16:00:00 | published | Article |

Scenario: A non-admin cannot merge two articles
  Given I am logged in as "ted"
  And I am on the edit page of article "Getting Old"
  Then I should not see "Merge Articles"

Scenario: When articles are merged, the merged article should contain the text of both previous articles
  Given I am logged in as "bob"
  And I am on the edit page of article "Midlife Crisis"
  And I merge with "Getting Old"
  When I am on the edit page of article "Midlife Crisis"
  Then I should see "It sucks"
  And I should see "Sucks hard"
