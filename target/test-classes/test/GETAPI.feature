 Feature: GET Demo API

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'

  #Simple GET Request
  Scenario: GET Demo 1
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

  #GET with Background
  Scenario: GET Demo 2
    Given path '/users?page=2'
    When method GET
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

  #GET with Path, Params
  Scenario: GET Demo 3
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

    #GET with Assertions
    #get from https://jsonpathfinder.com/
  Scenario: GET Demo 4
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And match response.data[5].first_name != null 
    And assert response.data.length == 6
    And match response.data[4].id ==11
    