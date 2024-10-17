Feature: Get User Hash and Uname

  Background:
    * url 'https://api.spoonacular.com'
    * def apiKey = 'cb14dc69d2264fa5b23c080fe82e9e7c'

  Scenario: Get username and hash from connect user
    Given path 'users/connect'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And request {"username": "mela", "firstName": "mela", "lastName": "nly", "email": "melati.nlyn@gmail.com"}
    When method post
    Then status 200
    And print response