@api
@non_fcra
@lsfm
@section
@sara
Feature: LSFM - SARA Section

  @MADLRVP-10780
  Scenario: [MADLRVP-10780] Verify LSFM - SARA service returned business and individuals in response
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/sara/MADLRVP-10780.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ReportResults/LSFM/ThirdPartySection/SettlementAgentRiskAssessment |
    And the response has xpath
      | XPath                                                        | expected                                                        |
      | //SettlementAgentRiskAssessment/@busNameSearched             | MBH Settlement Group                                            |
      | //SettlementAgentRiskAssessment/@individualFirstNameSearched | Kathleen                                                        |
      | //SettlementAgentRiskAssessment/@individualLastNameSearched  | Tate                                                            |
      | //SettlementAgentRiskAssessment/@busNamesSearched            | MBH Settlement Group, L.C.                                      |
      | //SettlementAgentRiskAssessment/@individualNamesSearched     | Tate, Kathleen                                                  |
      | //SettlementAgentRiskAssessment/@busCount                    | 1                                                               |
      | //SettlementAgentRiskAssessment/@message                     | [MATCH --> \\d{1,2} Company Found, \\d{1,2} Individual Found..] |
      | //SettlementAgentRiskAssessment/@individualCount             | [MATCH --> \\d{1,2}]                                            |

  @MADLRVP-10783
  Scenario: [MADLRVP-10783] Verify LSFM - SARA name and detail data of 1 Business returned
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/sara/MADLRVP-10783.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness/@busName             |
      | //ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness/@eoLimit             |
      | //ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness/@fidelityLimit       |
      | //ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness/@cbLimit             |
      | //ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness/@secureInsightNumber |
      | //ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness/@expirationEO        |
      | //ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness/@expirationFB        |
      | //ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness/@expirationCB        |
      | //ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness/@expiredEO           |
      | //ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness/@expiredFB           |
      | //ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness/@expiredCB           |
    And the response has xpath
      | XPath                   | expected                   |
      | //SaraBusiness/@busName | MBH Settlement Group, L.C. |

  @MADLRVP-10784
  Scenario: [MADLRVP-10784] Verify LSFM - SARA some individuals detail such as name, rating and status in xml response
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/sara/MADLRVP-10784.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness/SaraIndividual/personalInformation[@recordName='Tate, Kathleen']  |
      | //ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness/SaraIndividual/personalInformation[@recordName='Grace, Arthur']   |
      | //ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness/SaraIndividual/personalInformation[@recordName='Welch, Jaime']    |
      | //ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness/SaraIndividual/personalInformation[@recordName='Tsang, Wing Yan'] |
    And the response has xpath
      | XPath                                                                                                      | expected        |
      | //SaraIndividual/personalInformation[@recordName='Tate, Kathleen']/../registrationInformation/@riskRating  | Low Risk        |
      | //SaraIndividual/personalInformation[@recordName='Tate, Kathleen']/../registrationInformation/@status      | Failed to Renew |
      | //SaraIndividual/personalInformation[@recordName='Grace, Arthur']/../registrationInformation/@riskRating   | Low Risk        |
      | //SaraIndividual/personalInformation[@recordName='Grace, Arthur']/../registrationInformation/@status       | Failed to Renew |
      | //SaraIndividual/personalInformation[@recordName='Welch, Jaime']/../registrationInformation/@riskRating    | Not Rated       |
      | //SaraIndividual/personalInformation[@recordName='Welch, Jaime']/../registrationInformation/@status        | Suspended       |
      | //SaraIndividual/personalInformation[@recordName='Tsang, Wing Yan']/../registrationInformation/@riskRating | Low Risk        |
      | //SaraIndividual/personalInformation[@recordName='Tsang, Wing Yan']/../registrationInformation/@status     | Failed to Renew |

  @MADLRVP-10785
  Scenario: [MADLRVP-10785] Verify LSFM - SARA returned High Risk rating and other details
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/sara/MADLRVP-10785.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness/SaraIndividual |
    And the response has xpath
      | XPath                                                | expected      |
      | //SaraIndividual/personalInformation/@recordName     | Marinay, Jose |
      | //SaraIndividual/registrationInformation/@riskRating | High Risk     |
      | //SaraIndividual/registrationInformation/@status     | Completed     |

  @MADLRVP-10786
  Scenario: [MADLRVP-10786] Verify LSFM - SARA attributes exist under SARA Business section
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/sara/MADLRVP-10786.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness[1]/@individualCount     |
      | //ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness[1]/@busName             |
      | //ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness[1]/@eoLimit             |
      | //ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness[1]/@fidelityLimit       |
      | //ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness[1]/@cbLimit             |
      | //ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness[1]/@secureInsightNumber |
      | //ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness[1]/@expirationEO        |
      | //ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness[1]/@expirationFB        |
      | //ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness[1]/@expirationCB        |
      | //ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness[1]/@expiredEO           |
      | //ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness[1]/@expiredFB           |
      | //ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness[1]/@expiredCB           |

  @MADLRVP-10787
  Scenario: [MADLRVP-10787] Verify LSFM - SARA multiple loan actors with Settlement Agent Risk Assessment can be submitted and returned data correctly
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/sara/MADLRVP-10787.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ThirdPartySection/SettlementAgentRiskAssessment[@busNameSearched='Stewart Title']        |
      | //ThirdPartySection/SettlementAgentRiskAssessment[@busNameSearched='MBH Settlement Group'] |
      | //ThirdPartySection/SettlementAgentRiskAssessment[@busNameSearched='First American Title'] |

  @MADLRVP-10788
  Scenario: [MADLRVP-10788] Verify LSFM - SARA attributes exist under Individual section in response
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/sara/MADLRVP-10788.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness[1]/SaraIndividual[1]/personalInformation     |
      | //ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness[1]/SaraIndividual[1]/registrationInformation |
      | //ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness[1]/SaraIndividual[1]/businessInformation     |
      | //ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness[1]/SaraIndividual[1]/bankAccountInformation  |
      | //ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness[1]/SaraIndividual[1]/insuranceCoverage       |
      | //ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness[1]/SaraIndividual[1]/licenseInformation      |

  @MADLRVP-12824
  Scenario: [MADLRVP-12824] Verify LSFM - SARA returned Low Risk rating
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/sara/MADLRVP-12824.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness/SaraIndividual |
    And the response has xpath
      | XPath                                                    | expected          |
      | //SaraIndividual/personalInformation/@role               | Authorized Signer |
      | //SaraIndividual/personalInformation/@registrationNumber | 935226            |
      | //SaraIndividual/personalInformation/@recordName         | Chilcoat, Cindy   |
      | //SaraIndividual/registrationInformation/@riskRating     | Low Risk          |

  @MADLRVP-12825
  Scenario: [MADLRVP-12825] Verify LSFM - SARA returned Not Rate in response
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/sara/MADLRVP-12825.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness/SaraIndividual |
    And the response has xpath
      | XPath                                                    | expected         |
      | //SaraIndividual/personalInformation/@role               | Funding and Docs |
      | //SaraIndividual/personalInformation/@registrationNumber | 53634            |
      | //SaraIndividual/personalInformation/@recordName         | Welch, Jaime     |
      | //SaraIndividual/registrationInformation/@riskRating     | Not Rated        |
      | //SaraIndividual/registrationInformation/@status         | Suspended        |

  @MADLRVP-12826
  Scenario: [MADLRVP-12826] Verify LSFM - SARA returned TBD rating in response
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/sara/MADLRVP-12826.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness/SaraIndividual |
    And the response has xpath
      | XPath                                                | expected                |
      | //SaraIndividual/personalInformation/@recordName     | Barenfeld-Engel, Adam   |
      | //SaraIndividual/registrationInformation/@riskRating | TBD                     |
      | //SaraIndividual/registrationInformation/@status     | Verification In Process |
