@api
@non_fcra
@lsfm
@section
@third_party
@sara
Feature: LSFM  - Third Party - SARA

  @MADLRVP-13596
  Scenario: [MADLRVP-13596] Verify LSFM - No first and last name sent - null in DB too
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/third_party/MADLRVP-13596.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ThirdPartySection/SettlementAgentRiskAssessment                                                           |
      | //ThirdPartySection/SettlementAgentRiskAssessment[@busNameSearched='Germani Title & Closing Services, LLC'] |
    And the response has xpath
      | XPath                                                                                                              | expected |
      | //SettlementAgentRiskAssessment[@busNameSearched='Germani Title & Closing Services, LLC']/@individualNamesSearched | [empty]  |

  @MADLRVP-13559
  Scenario: [MADLRVP-13559] Verify LSFM - Verify Bank information section retrieves data from Secure Insight correctly (ABA# and accounts#)
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/third_party/MADLRVP-13559.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //bankAccountInformation/SaraBankAccounts       |
      | //SaraBankAccounts[@accountNumber='2040000012'] |
      | //SaraBankAccounts[@accountNumber='2040000483'] |
      | //SaraBankAccounts[@accountNumber='5570251699'] |
    And the response has xpath
      | XPath                                                               | expected  |
      | //SaraBankAccounts[@accountNumber='2040000012']/@beneficiaryNumber  | [empty]   |
      | //SaraBankAccounts[@accountNumber='2040000012']/@receivingAbaNumber | 051005106 |
      | //SaraBankAccounts[@accountNumber='2040000483']/@beneficiaryNumber  | 051409579 |
      | //SaraBankAccounts[@accountNumber='2040000483']/@receivingAbaNumber | 051005106 |
      | //SaraBankAccounts[@accountNumber='5570251699']/@beneficiaryNumber  | [empty]   |
      | //SaraBankAccounts[@accountNumber='5570251699']/@receivingAbaNumber | 031000053 |

  @MADLRVP-15969
  Scenario: [MADLRVP-15969] Verify LSFM - Multiple spaces in company name allow the SARA search to be performed
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/third_party/MADLRVP-15969.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ThirdPartySection/SettlementAgentRiskAssessment[@individualFirstNameSearched='Sadie'] |
      | //ThirdPartySection/SettlementAgentRiskAssessment[@individualFirstNameSearched='Lee']   |
    And the response has xpath
      | XPath                                                                                             | expected                |
      | //SettlementAgentRiskAssessment[@individualFirstNameSearched='Sadie']/@individualLastNameSearched | Wright                  |
      | //SettlementAgentRiskAssessment[@individualFirstNameSearched='Sadie']/@busNameSearched            | Lee A Carmical, Esq LLC |
      | //SettlementAgentRiskAssessment[@individualFirstNameSearched='Lee']/@individualLastNameSearched   | Carmical                |
      | //SettlementAgentRiskAssessment[@individualFirstNameSearched='Lee']/@busNameSearched              | Lee A Carmical, Esq LLC |

