Feature: Get OAuth Token

  Background:
    * def clientID = 'client-id'
    * def clientSecret = 'clientSecret'
    # Endpoint untuk client tembak clientId dan clientSecret
    * def tokenUrl = 'https://server.endpoint.com/oauth/token'

  Scenario: Get OAuth Token using client credentials
    Given url tokenUrl
    And request {grant_type: 'client_credential', client_id: clientID, client_secret: clintSecret}
    And header Content-Type = 'application/x-www-from-urlencoded'
    When method POST
    Then status 200
    * def access_token = response.access_token

  #Store token globally
  karate.callSingle('classpath:store-token.feature', {access_token: access_token})