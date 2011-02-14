Feature: creating a new post for the news section
  As a site owner
  I want to add news articles
  So that news can get posted to the code and coffee website

  Scenario: create a slug with no special characters
    Given a new post is created
    And the post title is "A New Post"
    When the post is saved
    Then the slug should be "a_new_post"

  Scenario: create a slug from a title with numbers
    Given a new post is created
    And that post title is "Numbers Post 1"
    When the post is saved
    Then the slug should be "numbers_post_1"

  Scenario: create a slug from a title with an apostrophe
    Given a new post is created
    And that post title is "Spongebob's Post"
    When the post is saved
    Then the slug should be "spongebobs_post"
