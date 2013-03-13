Feature: Create Category
  As a blog administrator
  I want to be able to create categories

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Successfully create category
    Given I am on the new category page
    And I fill in "category_name" with "Category #1"
    And I fill in "category_keywords" with "keyword1"
    And I fill in "category_description" with "description1"
    And I press "Save"
    Then I should see the following categories:
      | Title       | Description  | Permalink | Keywords |
      | Category #1 | description1 |           | keyword1 |

