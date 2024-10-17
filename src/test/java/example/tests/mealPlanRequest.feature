Feature: Test Get Meal Plan

  Background:
    * url 'https://api.spoonacular.com'
    * def apiKey = 'cb14dc69d2264fa5b23c080fe82e9e7c'
    * def hash = '8ceba0afb241b5388cfd4ade499c4b492bf4b718'
    * def username = 'mela0'
    * def startDate = '2024-09-25'

  Scenario: Test Generate MealPlan
    Given path 'mealplanner/generate'
    And param apiKey = apiKey
    And param timeFrame = 'day'
    And param targetCalories = '100'
    When method get
    Then status 200
    And print response

    Scenario: Adding items to meal plan
      Given path 'mealplanner', username, 'items'
      And header Content-Type = 'application/json'
      And param apiKey = apiKey
      And param hash = hash
      And request { "date": 1719500800, "slot": 1, "position": 0, "type": "INGREDIENTS", "value": { "ingredients": [{ "name": "1 banana"}]}}
      When method post
      Then status 200
      And match response.status == 'success'
      And print response

    Scenario: Adding items shopping list
      Given path 'mealplanner', username, 'shopping-list', 'items'
      And header Content-Type = 'application/json'
      And param apiKey = apiKey
      And param hash = hash
      And request {"item": 1 package baking powder", "aisle": "Baking","parse": true}
      When method post
      Then status 200
      And print response

    Scenario: Get Shopping list
      Given path 'mealplanner', username, 'shopping-list'
      And header Content-Type = 'application/json'
      And param apiKey = apiKey
      And param hash = hash
      When method get
      Then status 200
      And print response

    Scenario: ML model Image classification
      Given path 'food/images/classify'
      And header Content-Type = 'application/json'
      And param apiKey = apiKey
      And param imageUrl = 'https://pacificpotluck.com/wp-content/uploads/2021/02/indonesian-fried-rice-nasi-goreng-1536x1244.jpg'
      When method get
      Then status 200
      And print response





