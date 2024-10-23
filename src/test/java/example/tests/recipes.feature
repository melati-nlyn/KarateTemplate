Feature: Test Recipes

  Background:
    * url 'https://api.spoonacular.com'
    * def apiKey = 'cb14dc69d2264fa5b23c080fe82e9e7c'
    * def hash = '8ceba0afb241b5388cfd4ade499c4b492bf4b718'
    * def username = 'mela0'
    * def startDate = '2024-09-25'
    * def ID = '9060'


  Scenario: Search Recipes
    Given path 'recipes/complexSearch'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param query = "noodles"
    And param type = "main course"
    When method get
    Then status 200
    And print response
    * def ID = response.results[0].id
    * print ID

  Scenario: Get Recipes Information
    Given path 'recipes',ID,'/information'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param includeNutrition = 'false'
    And param addWinePairing = 'false'
    And param addTasteData = 'true'
    When method get
    Then status 200
    And print response

  Scenario: Analyze Recipe
    Given path 'recipes/analyze'
    And param apiKey = apiKey
    And param language = "en"
    And param includeNutrition = true
    And request {"title": "Spaghetti Carbonara", "servings": 1, "ingredients": ["1 lb spaghetti", "3.5 oz pancetta", "2 Tbsps olive oil", "1  egg", "0.5 cup parmesan cheese"], "instructions": "Bring a large pot of water to a boil and season generously with salt. Add the pasta to the water once boiling and cook until al dente. Cook the ingredients then add spaghetti."}
    When method post
    Then status 200
    And print response

  Scenario: Taste By ID
    Given path 'recipes', ID, 'tasteWidget.json'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    When method get
    Then status 200
    And print response

  Scenario: Summarize Recipe
    Given path 'recipes', ID, 'summary'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    When method get
    Then status 200
    And print response
