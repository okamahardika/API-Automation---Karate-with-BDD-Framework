Feature: Post test API

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedOutput = read('response1.json')

  #Simple POST Scenario
  Scenario: POST Demo 1
    Given url 'https://reqres.in/api/users'
    And request {"name": "Dika","job": "QA"}
    When method POST
    Then status 201
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

  #POST with background
  Scenario: POST Demo 2
    Given path '/users'
    And request {"name": "Dika","job": "QA"}
    When method POST
    Then status 201
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

  #POST with response assertion
  Scenario: POST Demo 3
    Given path '/users'
    And request {"name": "Dika","job": "QA"}
    When method POST
    Then status 201
    And match response == {"createdAt": "#ignore","name": "Dika","id": "#string","job": "QA"}
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

  #POST with read response from json
  Scenario: POST Demo 4
    Given path '/users'
    And request {"name": "Dika","job": "QA"}
    When method POST
    Then status 201
    And match response == expectedOutput
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

  #POST with read request body from json
  Scenario: POST Demo 5
    Given path '/users'
    And def requestBody =  read ("request1.json")
    And request requestBody
    When method POST
    Then status 201
    And match response == expectedOutput
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies
    
    
    #POST with read request body from json in other folder
  Scenario: POST Demo 6
    Given path '/users'
    And def projectPath = karate.properties['user.dir']
    And print projectPath
    And def filePath = projectPath+ '/Users/officemacmini/eclipse-workspace/Karate/src/test/java/data/request1.json'
    And print filePath
    And def requestBody1 =  filePath
    And request requestBody1
    When method POST
    Then status 201
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies
    
    
    #POST with read request body from json
  Scenario: POST Demo 7
    Given path '/users'
    And def reqBody = read ("request1.json")
    And set reqBody.job = 'QA'
    And request reqBody
    When method POST
    Then status 201
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies
