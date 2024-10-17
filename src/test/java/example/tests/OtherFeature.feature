Feature: Other feature that use bearer token

  Background:
    * def token = karate.get('bearerToken)
    * def authHeader = {Authrization: 'Bearer' , token}

  Scenario:
    Given url 'https://blaba,com'
    And headers authHeader