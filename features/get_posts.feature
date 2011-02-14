Feature: getting posts for the news section of the website
  As a user of the code and coffee webiste
  I want the articles available to me
  So that I can read them and get more smarter

  Scenario: Default listing will be the intros of five articles
    Given the user is on the news tab of the index page
    Then there should be five article intros listed
    And there should be five links to those articles

  Scenario: News tab on the index page will have an archive link
    Given the user is on the news tab of the index page
    Then there should be an archive link

  Scenario: the Archive page will list links by month
    Given the user is on the news archive page
    Then there should be a list of months that news was posted

  Scenario: an Archive month will open to a list of links
    Given the user has clicked on a month
    Then there should be a list of article links
