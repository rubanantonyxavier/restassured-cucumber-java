@api
@fcra
@lsfm
@section
@third_party
@sara
Feature: LSFM FCRA - Third Party - SARA

  @MADLRVP-13255
  Scenario: [MADLRVP-13255] Verify LSFM FCRA - SARA service is working properly in FCRA line and High Risk rating returned
    Given the request XML filepath is /ript/fcra/lsfm/sections/third_party/MADLRVP-13255.xml
    When the LSFM FCRA request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ThirdPartySection/SettlementAgentRiskAssessment/SaraBusiness/SaraIndividual |
    And the response has xpath
      | XPath                                                | expected      |
      | //SaraIndividual/personalInformation/@recordName     | Marinay, Jose |
      | //SaraIndividual/registrationInformation/@riskRating | High Risk     |
      | //SaraIndividual/registrationInformation/@status     | Completed     |

  @MADLRVP-13561
  Scenario: [MADLRVP-13561] Verify LSFM FCRA - Verify Bank information section retrieves data from Secure Insight correctly (ABA# and accounts#)
    Given the request XML filepath is /ript/fcra/lsfm/sections/third_party/MADLRVP-13561.xml
    When the LSFM FCRA request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //bankAccountInformation/SaraBankAccounts[@accountNumber='0007165775'] |
      | //bankAccountInformation/SaraBankAccounts[@accountNumber='0007166274'] |
      | //bankAccountInformation/SaraBankAccounts[@accountNumber='0093548815'] |
      | //bankAccountInformation/SaraBankAccounts[@accountNumber='0090265518'] |
    And the response has xpath
      | XPath                                                               | expected  |
      | //SaraBankAccounts[@accountNumber='0007165775']/@beneficiaryNumber  | [empty]   |
      | //SaraBankAccounts[@accountNumber='0007165775']/@receivingAbaNumber | 031301422 |
      | //SaraBankAccounts[@accountNumber='0007166274']/@beneficiaryNumber  | [empty]   |
      | //SaraBankAccounts[@accountNumber='0007166274']/@receivingAbaNumber | 031301422 |
      | //SaraBankAccounts[@accountNumber='0093548815']/@beneficiaryNumber  | [empty]   |
      | //SaraBankAccounts[@accountNumber='0093548815']/@receivingAbaNumber | 031301422 |
      | //SaraBankAccounts[@accountNumber='0090265518']/@beneficiaryNumber  | [empty]   |
      | //SaraBankAccounts[@accountNumber='0090265518']/@receivingAbaNumber | 031301422 |

  @MADLRVP-14488
  Scenario: [MADLRVP-14488] Verify LSFM FCRA - Multiple spaces in company name allow the SARA search to be performed
    Given the request XML filepath is /ript/fcra/lsfm/sections/third_party/MADLRVP-14488.xml
    When the LSFM FCRA request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ThirdPartySection/SettlementAgentRiskAssessment[@individualFirstNameSearched='Sadie'] |
      | //ThirdPartySection/SettlementAgentRiskAssessment[@individualFirstNameSearched='Lee']   |
      | //ThirdPartySection/SettlementAgentRiskAssessment[@individualFirstNameSearched='Kevin'] |
    And the response has xpath
      | XPath                                                                                             | expected                   |
      | //SettlementAgentRiskAssessment[@individualFirstNameSearched='Sadie']/@individualLastNameSearched | Wright                     |
      | //SettlementAgentRiskAssessment[@individualFirstNameSearched='Sadie']/@busNameSearched            | Lee A Carmical , Esq LLC   |
      | //SettlementAgentRiskAssessment[@individualFirstNameSearched='Lee']/@individualLastNameSearched   | Carmical                   |
      | //SettlementAgentRiskAssessment[@individualFirstNameSearched='Lee']/@busNameSearched              | Lee A Carmical , Esq LLC   |
      | //SettlementAgentRiskAssessment[@individualFirstNameSearched='Kevin']/@individualLastNameSearched | Pietersen                  |
      | //SettlementAgentRiskAssessment[@individualFirstNameSearched='Kevin']/@busNameSearched            | Kevin A Pietersen, Esq LLC |
