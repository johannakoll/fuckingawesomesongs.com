Feature: Moderation
  In order collect mass amounts of awesome fucking songs
  As a user
  I want to be able to submit songs

  Scenario: User submits song
    Given I visit the home page
    And I submit an awesome fucking song
    Then I should see a thank you message

  Scenario: User submitted song not available on home page
    Given I visit the home page
    And I submit an awesome fucking song
    When I visit the home page
    Then I do not see that song

  Scenario: Moderator can view songs
    Given I visit the home page
    And I submit an awesome fucking song
    And I visit the moderation page
    Then I see the song artist, title and url


  Scenario: Approved song is visible on home page
    Given I visit the home page
    And I submit an awesome fucking song
    When I visit the moderation page
    And I approve that song
    When I visit the home page
    Then I see that song


#     And I approve that song
#     When I visit the home page
#     Then I see that song
