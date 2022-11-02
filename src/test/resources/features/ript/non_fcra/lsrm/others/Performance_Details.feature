@api
@non_fcra
@lsrm
@performance_details
Feature: LSRM - Performance Details

  @MADLRVP-15985
  Scenario: [MADLRVP-15985] Verify LSRM - No user (not existing one) - Proper Error message returned for PerformanceDetails
    Given the request XML filepath is /ript/non_fcra/lsrm/others/MADLRVP-15985.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Performance/PerformanceDetails[@name='LSC Alert Summary Call'][1] |
      | //Performance/PerformanceDetails[@name='LSC Alert Summary Call'][2] |
    And the response has xpath
      | XPath                                                            | expected                         |
      | //PerformanceDetails[@name='LSC Alert Summary Call'][1]/@message | Unable to find user teletubby555 |
      | //PerformanceDetails[@name='LSC Alert Summary Call'][2]/@message | Unable to find user teletubby555 |

  @MADLRVP-15986
  Scenario: [MADLRVP-15986] Verify LSRM - No loan number for user (sent empty) - Proper Error message returned for PerformanceDetails
    Given the request XML filepath is /ript/non_fcra/lsrm/others/MADLRVP-15986.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Performance/PerformanceDetails[@name='LSC Alert Summary Call'] |
    And the response has xpath
      | XPath                                                         | expected                         |
      | //PerformanceDetails[@name='LSC Alert Summary Call']/@message | Unable to find user teletubby555 |
