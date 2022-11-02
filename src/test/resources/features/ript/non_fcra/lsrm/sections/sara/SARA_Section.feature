@api
@non_fcra
@lsrm
@section
@sara
Feature: LSRM - SARA Section

  @MADLRVP-10789
  Scenario: [MADLRVP-10789] Verify LSRM - SARA business names
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/sara/MADLRVP-10789.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //ReportResults/LSRM/LSFMResults/ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness  |
      | //SaraBusiness[@busName='First American Title Co']                                             |
      | //SaraBusiness[@busName='First American Title Insurance Company National Commercial Services'] |

  @MADLRVP-10790
  Scenario: [MADLRVP-10790] Verify LSRM - SARA returned High Risk rating in response
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/sara/MADLRVP-10790.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //ReportResults/LSRM/LSFMResults/ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness/SaraIndividual |
    And the response has xpath
      | XPath                                                | expected      |
      | //SaraIndividual/personalInformation/@recordName     | Marinay, Jose |
      | //SaraIndividual/registrationInformation/@riskRating | High Risk     |
      | //SaraIndividual/registrationInformation/@status     | Completed     |

  @MADLRVP-10791
  Scenario: [MADLRVP-10791] Verify LSRM - SARA returned Not Rating and suspended status in response
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/sara/MADLRVP-10791.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //ReportResults/LSRM/LSFMResults/ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness/SaraIndividual |
    And the response has xpath
      | XPath                                                    | expected         |
      | //SaraIndividual/personalInformation/@role               | Funding and Docs |
      | //SaraIndividual/personalInformation/@registrationNumber | 53634            |
      | //SaraIndividual/personalInformation/@recordName         | Welch, Jaime     |
      | //SaraIndividual/registrationInformation/@riskRating     | Not Rated        |
      | //SaraIndividual/registrationInformation/@status         | Suspended        |

  @MADLRVP-10792
  Scenario: [MADLRVP-10792] Verify LSRM - SARA returned Low Risk rating in response
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/sara/MADLRVP-10792.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //ReportResults/LSRM/LSFMResults/ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness/SaraIndividual |
    And the response has xpath
      | XPath                                                    | expected          |
      | //SaraIndividual/personalInformation/@role               | Authorized Signer |
      | //SaraIndividual/personalInformation/@registrationNumber | 935226            |
      | //SaraIndividual/personalInformation/@recordName         | Chilcoat, Cindy   |
      | //SaraIndividual/registrationInformation/@riskRating     | Low Risk          |

  @MADLRVP-10793
  Scenario: [MADLRVP-10793] Verify LSRM - SARA returned no business and individual found
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/sara/MADLRVP-10793.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //ReportResults/LSRM/LSFMResults/ThirdPartySection/SettlementAgentRiskAssessment |
    And the response has xpath
      | XPath                                                        | expected                        |
      | //SettlementAgentRiskAssessment/@busNameSearched             | Title Agency of America1        |
      | //SettlementAgentRiskAssessment/@individualFirstNameSearched | Don                             |
      | //SettlementAgentRiskAssessment/@individualLastNameSearched  | Malo                            |
      | //SettlementAgentRiskAssessment/@busNamesSearched            | [empty]                         |
      | //SettlementAgentRiskAssessment/@individualNamesSearched     | Malo, Don                       |
      | //SettlementAgentRiskAssessment/@busCount                    | 0                               |
      | //SettlementAgentRiskAssessment/@message                     | 0 Company Found, N/A Individual |
      | //SettlementAgentRiskAssessment/@individualCount             | 0                               |

  @MADLRVP-10794
  Scenario: [MADLRVP-10794] Verify LSRM - SARA returned TBD rating in response
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/sara/MADLRVP-10794.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //ReportResults/LSRM/LSFMResults/ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness/SaraIndividual |
    And the response has xpath
      | XPath                                                | expected               |
      | //SaraIndividual/personalInformation/@recordName     | Barenfeld-Engel, Adam  |
      | //SaraIndividual/registrationInformation/@riskRating | TBD                    |
      | //SaraIndividual/registrationInformation/@status     | Verification In Process|
