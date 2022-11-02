@api
@non_fcra
@lsrm
@section
@third_party
@sara
Feature: LSRM - Third Party - SARA

  @MADLRVP-13560
  Scenario: [MADLRVP-13560] Verify LSRM - the suppression of names from Search Summary when no checks are done
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/third_party/MADLRVP-13560.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //bankAccountInformation/SaraBankAccounts[@accountNumber='2702429']      |
      | //bankAccountInformation/SaraBankAccounts[@accountNumber='2048823914']   |
      | //bankAccountInformation/SaraBankAccounts[@accountNumber='003250369289'] |
      | //bankAccountInformation/SaraBankAccounts[@accountNumber='01007070442']  |
    And the response has xpath
      | XPath                                                                 | expected  |
      | //SaraBankAccounts[@accountNumber='2702429']/@beneficiaryNumber       | [empty]   |
      | //SaraBankAccounts[@accountNumber='2702429']/@receivingAbaNumber      | 061201754 |
      | //SaraBankAccounts[@accountNumber='2048823914']/@beneficiaryNumber    | [empty]   |
      | //SaraBankAccounts[@accountNumber='2048823914']/@receivingAbaNumber   | 061201754 |
      | //SaraBankAccounts[@accountNumber='003250369289']/@beneficiaryNumber  | [empty]   |
      | //SaraBankAccounts[@accountNumber='003250369289']/@receivingAbaNumber | 026009593 |
      | //SaraBankAccounts[@accountNumber='01007070442']/@beneficiaryNumber   | [empty]   |
      | //SaraBankAccounts[@accountNumber='01007070442']/@receivingAbaNumber  | 061100606 |

  @MADLRVP-13597 @ignore
  Scenario: [MADLRVP-13597] Verify LSRM - wrong first and last name sent regression, state matching
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/third_party/MADLRVP-13597.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //ThirdPartySection/SettlementAgentRiskAssessment |
    And the response has xpath
      | XPath                                                        | expected                     |
      | //SettlementAgentRiskAssessment/@busNameSearched             | The Closing Department, Inc. |
      | //SettlementAgentRiskAssessment/@individualFirstNameSearched | justyna                      |
      | //SettlementAgentRiskAssessment/@individualLastNameSearched  | grycmacher                   |
      | //SettlementAgentRiskAssessment/@busCount                    | 1                            |
      | //SettlementAgentRiskAssessment/@individualCount             | 1                            |
