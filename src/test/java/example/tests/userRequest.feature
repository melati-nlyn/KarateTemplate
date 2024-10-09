Feature: User API Tests

  Background:
    Given url "https://petstore.swagger.io/"
    And print "--opening prtstore API--"

  Scenario: Create User
    * def reqBody = { "id": 1375, "username": "HarvelG", "firstName": "Harvelya", "lastName": "Sastana", "email": "harvelya@email.com", "password": "abC.12", "phone": "0812340987", "userStatus": 0 }
    When url "https://petstore.swagger.io/v2/user"
    And request reqBody
    And method post
    Then print response
    And status 200

  Scenario: Logs user into the system
    When url "https://petstore.swagger.io/v2/user/login"
    And params {username:HarvelG}
    And params {password:abC.12}
    When method get
    Then print response
    And status 200

  Scenario: Get user by user name
    When url "https://petstore.swagger.io/v2/user/HarvelG"
    When method get
    Then print response
    And status 200

  Scenario: Update User
    * def reqBody = { "id": 1375, "username": "HarvelG", "firstName": "Harvelya", "lastName": "Sastana", "email": "harvelya@email.com", "password": "abC.12", "phone": "0812340977", "userStatus": 0 }
    When url "https://petstore.swagger.io/v2/user/HarvelG"
    And request reqBody
    And method put
    Then print response
    And status 200

  Scenario: Delete User
    * def reqHeader = { 'Username': 'HarvelG' }
    When url "https://petstore.swagger.io/v2/user/HarvelG"
    And headers reqHeader
    And method delete
    Then print response
    And status 200

  Scenario: Logs out current logged in user session
    When url "https://petstore.swagger.io/v2/user/logout"
    When method get
    Then print response
    And status 200

  Scenario: Creates list of users with given input array
    * def reqBody = [{ "id": 1375, "username": "HarvelG", "firstName": "Harvelya", "lastName": "Sastana", "email": "harvelya@email.com", "password": "abC.12", "phone": "0812340977", "userStatus": 1 }]
    When url "https://petstore.swagger.io/v2/user/createWithList"
    And request reqBody
    When method post
    Then print response
    And status 200

  Scenario: Creates list of users with given input array
    * def reqBody = [{ "id": 1375, "username": "HarvelG", "firstName": "Harvelya", "lastName": "Sastana", "email": "harvelya@email.com", "password": "abC.12", "phone": "0812340977", "userStatus": 1 }]
    When url "https://petstore.swagger.io/v2/user/createWithArray"
    And request reqBody
    When method post
    Then print response
    And status 200