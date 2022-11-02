@api
@non_fcra
@lsfm
@performance_details
Feature: LSFM - Performance Details

  @MADLRVP-15979
  Scenario: [MADLRVP-15979] Verify LSFM - No user (not existing one) - Proper Error message returned for PerformanceDetails
    Given the request XML filepath is /ript/non_fcra/lsfm/others/MADLRVP-15979.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Performance/PerformanceDetails[@name='LSC Alert Summary Call'][1] |
      | //Performance/PerformanceDetails[@name='LSC Alert Summary Call'][2] |
    And the response has xpath
      | XPath                                                            | expected                       |
      | //PerformanceDetails[@name='LSC Alert Summary Call'][1]/@message | Unable to find user trololo123 |
      | //PerformanceDetails[@name='LSC Alert Summary Call'][2]/@message | Unable to find user trololo123 |

  @MADLRVP-15980
  Scenario: [MADLRVP-15980] Verify LSFM - No user (sent empty) - Proper Error message returned for PerformanceDetails
    Given the request XML filepath is /ript/non_fcra/lsfm/others/MADLRVP-15980.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Performance/PerformanceDetails[@name='LSC Alert Summary Call'] |
    And the response has xpath
      | XPath                                                         | expected                       |
      | //PerformanceDetails[@name='LSC Alert Summary Call']/@message | Unable to find user trololo123 |

  @MADLRVP-15981
  Scenario: [MADLRVP-15981] Verify LSFM - No user (param&value totally removed from request) - Proper Error message returned for PerformanceDetails
    Given the request XML filepath is /ript/non_fcra/lsfm/others/MADLRVP-15981.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Performance/PerformanceDetails[@name='LSC Alert Summary Call'] |
    And the response has xpath
      | XPath                                                         | expected                         |
      | //PerformanceDetails[@name='LSC Alert Summary Call']/@message | Unable to find user ghostUser666 |

  @MADLRVP-15982
  Scenario Outline: [MADLRVP-15982] Verify LSFM - No loan number for user (not existing one) - Proper Error message returned for PerformanceDetails
    Given the request XML filepath is /ript/non_fcra/lsfm/others/MADLRVP-15982.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Performance/PerformanceDetails[@name='LSC Alert Summary Call'][1] |
      | //Performance/PerformanceDetails[@name='LSC Alert Summary Call'][2] |
    And the response has xpath
      | XPath                                                            | expected  |
      | //PerformanceDetails[@name='LSC Alert Summary Call'][1]/@message | <message> |
      | //PerformanceDetails[@name='LSC Alert Summary Call'][2]/@message | <message> |

    @qa_only
    Examples:
      | message                                                        |
      | Unable to find loan number transylwania with userId JGRY000001 |

    @uat_only
    Examples:
      | message                        |
      | Unable to find user JGRY000001 |

  @MADLRVP-15983
  Scenario Outline: [MADLRVP-15983] Verify LSFM - No loan number for user (sent empty) - Proper Error message returned for PerformanceDetails
    Given the request XML filepath is /ript/non_fcra/lsfm/others/MADLRVP-15983.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Performance/PerformanceDetails[@name='LSC Alert Summary Call'] |
    And the response has xpath
      | XPath                                                         | expected  |
      | //PerformanceDetails[@name='LSC Alert Summary Call']/@message | <message> |

    @qa_only
    Examples:
      | message                                                        |
      | Unable to find loan number transylwania with userId JGRY000001 |

    @uat_only
    Examples:
      | message                        |
      | Unable to find user JGRY000001 |

  @MADLRVP-15984
  Scenario Outline: [MADLRVP-15984] Verify LSFM - No loan number for user (param&value totally removed from request) - Proper Error message returned for PerformanceDetails
    Given the request XML filepath is /ript/non_fcra/lsfm/others/MADLRVP-15984.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Performance/PerformanceDetails[@name='LSC Alert Summary Call'] |
    And the response has xpath
      | XPath                                                         | expected  |
      | //PerformanceDetails[@name='LSC Alert Summary Call']/@message | <message> |

    @qa_only
    Examples:
      | message                                                        |
      | Unable to find loan number transylwania with userId JGRY000001 |

    @uat_only
    Examples:
      | message                        |
      | Unable to find user JGRY000001 |
