Feature: Test Get ingredient Information

  Background:
    * url 'https://api.spoonacular.com'
    * def apiKey = 'cb14dc69d2264fa5b23c080fe82e9e7c'
    * def hash = '8ceba0afb241b5388cfd4ade499c4b492bf4b718'
    * def username = 'mela0'
    * def startDate = '2024-09-25'
    * def id = '9060'

  Scenario: Test Get ingredient Information
    Given path 'food/ingredients',id, '/information'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param hash = hash
    And param amount = '150'
    And param unit = 'grams'
    And param locale = 'en_US'
    When method get
    Then status 200
    And print response

  Scenario: Test Get Recipes Information
    Given path 'recipes',id,'/information'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param includeNutrition = 'false'
    And param addWinePairing = 'false'
    And param addTasteData = 'false'
    When method get
    Then status 200
    And print response