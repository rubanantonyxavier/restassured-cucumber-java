@api
@fcra
@lsrm
@section
@third_party
@sara
Feature: LSRM FCRA - Third Party - SARA

  @MADLRVP-13256
  Scenario: [MADLRVP-13256] Verify LSRM FCRA - SARA returned business names and individual names
    Given the request XML filepath is /ript/fcra/lsrm/sections/third_party/MADLRVP-13256.xml
    When the LSRM FCRA request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //ReportResults/LSRM/LSFMResults/ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness                                |
      | //SettlementAgentRiskAssessment/SaraBusiness[@busName='First American Title Co']                                             |
      | //SettlementAgentRiskAssessment/SaraBusiness[@busName='First American Title Insurance Company National Commercial Services'] |
      | //SaraBusiness[@busName='First American Title Co']/SaraIndividual/personalInformation/@recordName='WoodBury, Marlene'        |

  @MADLRVP-13562
  Scenario: [MADLRVP-13562] Verify LSRM FCRA - Bank information section retrieves data from Secure Insight correctly (ABA# and accounts#)
    Given the request XML filepath is /ript/fcra/lsrm/sections/third_party/MADLRVP-13562.xml
    When the LSRM FCRA request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //bankAccountInformation/SaraBankAccounts[@accountNumber='2040000012'] |
      | //bankAccountInformation/SaraBankAccounts[@accountNumber='2040000483'] |
      | //bankAccountInformation/SaraBankAccounts[@accountNumber='5570251699'] |
    And the response has xpath
      | XPath                                                               | expected  |
      | //SaraBankAccounts[@accountNumber='2040000012']/@beneficiaryNumber  | [empty]   |
      | //SaraBankAccounts[@accountNumber='2040000012']/@receivingAbaNumber | 051005106 |
      | //SaraBankAccounts[@accountNumber='2040000483']/@beneficiaryNumber  | 051409579 |
      | //SaraBankAccounts[@accountNumber='2040000483']/@receivingAbaNumber | 051005106 |
      | //SaraBankAccounts[@accountNumber='5570251699']/@beneficiaryNumber  | [empty]   |
      | //SaraBankAccounts[@accountNumber='5570251699']/@receivingAbaNumber | 031000053 |

  @MADLRVP-14489
  Scenario: [MADLRVP-14489] Verify LSRM FCRA - Multiple spaces in company name allow the SARA search to be performed
    Given the request XML filepath is /ript/fcra/lsrm/sections/third_party/MADLRVP-14489.xml
    When the LSRM FCRA request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //ThirdPartySection/SettlementAgentRiskAssessment[@individualFirstNameSearched='Sadie'] |
      | //ThirdPartySection/SettlementAgentRiskAssessment[@individualFirstNameSearched='Lee']   |
      | //ThirdPartySection/SettlementAgentRiskAssessment[@individualFirstNameSearched='Kevin'] |
    And the response has xpath
      | XPath                                                                                             | expected                   |
      | //SettlementAgentRiskAssessment[@individualFirstNameSearched='Sadie']/@individualLastNameSearched | Wright                     |
      | //SettlementAgentRiskAssessment[@individualFirstNameSearched='Sadie']/@busNameSearched            | Lee A Carmical, Esq LLC    |
      | //SettlementAgentRiskAssessment[@individualFirstNameSearched='Lee']/@individualLastNameSearched   | Carmical                   |
      | //SettlementAgentRiskAssessment[@individualFirstNameSearched='Lee']/@busNameSearched              | Lee A Carmical, Esq LLC    |
      | //SettlementAgentRiskAssessment[@individualFirstNameSearched='Kevin']/@individualLastNameSearched | Pietersen                  |
      | //SettlementAgentRiskAssessment[@individualFirstNameSearched='Kevin']/@busNameSearched            | Kevin A Pietersen, Esq LLC |
