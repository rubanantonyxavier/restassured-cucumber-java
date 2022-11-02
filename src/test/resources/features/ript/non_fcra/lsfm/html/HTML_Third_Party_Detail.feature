@api
@non_fcra
@lsfm
@html
@third_party
@detail
Feature: LSFM HTML Third Party Detail Section

  @nmls_consumer_access
  @nmls_state_license_search
  @MADLRVP-9158
  Scenario: [MADLRVP-9158] Verify LSFM HTML - THIRD PARTY DETAIL - NMLS Consumer Access - NMLS State License Search
    Given the request XML filepath is /ript/non_fcra/lsfm/html/MADLRVP-9158.xml
    When the request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                                           | expected                                    |
      | //div[@id='NMLS_REGISTRY']/div/span/b                           | NMLS Consumer Access℠                       |
      | //div[@id='NMLS_REGISTRY']/div[2]/div[1]//table[1]//tr[1]/td/b  | NMLS State License Search                   |
      | //div[@id='NMLS_REGISTRY']/div[2]/div[1]//table[1]//tr[2]/td/b  | Results filtered by subject property state: |
      | //div[@id='NMLS_REGISTRY']/div[2]/div[1]//table[1]//tr[2]/td    | [NOT EMPTY]                                 |
      | //div[@id='NMLS_REGISTRY']/div[2]/div[1]//table[2]//tr[2]/td[1] | SEARCHED BY                                 |
      | //div[@id='NMLS_REGISTRY']/div[2]/div[1]//table[2]//tr[2]/td[2] | NAME / ADDRESS                              |
      | //div[@id='NMLS_REGISTRY']/div[2]/div[1]//table[2]//tr[2]/td[3] | NMLS ID / LICENSE(S)#                       |
      | //div[@id='NMLS_REGISTRY']/div[2]/div[1]//table[2]//tr[2]/td[4] | REG. STATE                                  |
      | //div[@id='NMLS_REGISTRY']/div[2]/div[1]//table[2]//tr[2]/td[5] | STATUS / DATE                               |
      | //div[@id='NMLS_REGISTRY']/div[2]/div[1]//table[2]//tr[2]/td[6] | MESSAGE                                     |

  @nmls_consumer_access
  @nmls_federal_registration_search
  @MADLRVP-9159
  Scenario: [MADLRVP-9159] Verify LSFM HTML - THIRD PARTY DETAIL - NMLS Consumer Access - NMLS Federal Registration Search
    Given the request XML filepath is /ript/non_fcra/lsfm/html/MADLRVP-9159.xml
    When the request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                                              | expected                         |
      | //div[@id='NMLS_REGISTRY']/div[2]/div[2]/div/table[1]//b           | NMLS Federal Registration Search |
      | //div[@id='NMLS_REGISTRY']/div[2]/div[2]/div/table[2]//tr[2]/td[1] | SEARCHED BY                      |
      | //div[@id='NMLS_REGISTRY']/div[2]/div[2]/div/table[2]//tr[2]/td[2] | NAME / ADDRESS                   |
      | //div[@id='NMLS_REGISTRY']/div[2]/div[2]/div/table[2]//tr[2]/td[3] | NMLS ID                          |
      | //div[@id='NMLS_REGISTRY']/div[2]/div[2]/div/table[2]//tr[2]/td[4] | REG.                             |
      | //div[@id='NMLS_REGISTRY']/div[2]/div[2]/div/table[2]//tr[2]/td[5] | STATUS / DATE                    |
      | //div[@id='NMLS_REGISTRY']/div[2]/div[2]/div/table[2]//tr[2]/td[6] | MESSAGE/ EMPLOYER                |

  @derogatory_lists
  @MADLRVP-9160
  Scenario: [MADLRVP-9160] Verify LSFM HTML - THIRD PARTY DETAIL - DEROGATORY LISTS
    Given the request XML filepath is /ript/non_fcra/lsfm/html/MADLRVP-9160.xml
    When the request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                                                     | expected              |
      | //div[@id='thirdPartyWatchListDetails']/div/span/b                        | DEROGATORY LISTS      |
      | //div[@id='WAT_3RD_PARTY_GOV_DETAILS']//table[1]//b                       | Government Watch List |
#Government_Watch_List-Table1
      | //div[@id='WAT_3RD_PARTY_GOV_DETAILS']//table[2]/tbody/tr[2]/td[1]        | Actor                 |
      | //div[@id='WAT_3RD_PARTY_GOV_DETAILS']//table[2]/tbody/tr[4]/td[1]        | [NOT EMPTY]           |
      | //div[@id='WAT_3RD_PARTY_GOV_DETAILS']//table[2]/tbody/tr[2]/td[2]        | Source                |
      | //div[@id='WAT_3RD_PARTY_GOV_DETAILS']//table[2]/tbody/tr[4]/td[2]        | [NOT EMPTY]           |
      | //div[@id='WAT_3RD_PARTY_GOV_DETAILS']//table[2]/tbody/tr[2]/td[3]        | Category              |
      | //div[@id='WAT_3RD_PARTY_GOV_DETAILS']//table[2]/tbody/tr[4]/td[3]        | [NOT EMPTY]           |
      | //div[@id='WAT_3RD_PARTY_GOV_DETAILS']//table[2]/tbody/tr[2]/td[4]        | Match Type            |
      | //div[@id='WAT_3RD_PARTY_GOV_DETAILS']//table[2]/tbody/tr[4]/td[4]        | [NOT EMPTY]           |
      | //div[@id='WAT_3RD_PARTY_GOV_DETAILS']//table[2]/tbody/tr[2]/td[5]        | Reversed              |
      | //div[@id='WAT_3RD_PARTY_GOV_DETAILS']//table[2]/tbody/tr[4]/td[5]        | [NOT EMPTY]           |
      | //div[@id='WAT_3RD_PARTY_GOV_DETAILS']//table[2]/tbody/tr[2]/td[6]        | Address Matched       |
      | //div[@id='WAT_3RD_PARTY_GOV_DETAILS']//table[2]/tbody/tr[4]/td[6]        | [NOT EMPTY]           |
      | //div[@id='WAT_3RD_PARTY_GOV_DETAILS']//table[2]/tbody/tr[2]/td[7]        | Nickname Matched      |
      | //div[@id='WAT_3RD_PARTY_GOV_DETAILS']//table[2]/tbody/tr[4]/td[7]        | [NOT EMPTY]           |
#Government_Watch_List-Table1_Sub-Section
      | //div[@id='WAT_3RD_PARTY_GOV_DETAILS']//table[2]/tbody/tr[5]//tr[1]/td[2] | LENDER REPORTED DATA  |
      | //div[@id='WAT_3RD_PARTY_GOV_DETAILS']//table[2]/tbody/tr[5]//tr[1]/td[3] | WATCH LIST RESULTS    |
      | //div[@id='WAT_3RD_PARTY_GOV_DETAILS']//table[2]/tbody/tr[5]//tr[2]/td[1] | First Name            |
      | //div[@id='WAT_3RD_PARTY_GOV_DETAILS']//table[2]/tbody/tr[5]//tr[2]/td[2] | [NOT EMPTY]           |
      | //div[@id='WAT_3RD_PARTY_GOV_DETAILS']//table[2]/tbody/tr[5]//tr[2]/td[3] | [NOT EMPTY]           |
      | //div[@id='WAT_3RD_PARTY_GOV_DETAILS']//table[2]/tbody/tr[5]//tr[3]/td[1] | Middle Name           |
      | //div[@id='WAT_3RD_PARTY_GOV_DETAILS']//table[2]/tbody/tr[5]//tr[3]/td[2] | [NOT EMPTY]           |
      | //div[@id='WAT_3RD_PARTY_GOV_DETAILS']//table[2]/tbody/tr[5]//tr[3]/td[3] | [NOT EMPTY]           |
      | //div[@id='WAT_3RD_PARTY_GOV_DETAILS']//table[2]/tbody/tr[5]//tr[4]/td[1] | Last Name             |
      | //div[@id='WAT_3RD_PARTY_GOV_DETAILS']//table[2]/tbody/tr[5]//tr[4]/td[2] | [NOT EMPTY]           |
      | //div[@id='WAT_3RD_PARTY_GOV_DETAILS']//table[2]/tbody/tr[5]//tr[4]/td[3] | [NOT EMPTY]           |
      | //div[@id='WAT_3RD_PARTY_GOV_DETAILS']//table[2]/tbody/tr[5]//tr[5]/td[1] | Suffix                |
      | //div[@id='WAT_3RD_PARTY_GOV_DETAILS']//table[2]/tbody/tr[5]//tr[5]/td[2] | [NOT EMPTY]           |
      | //div[@id='WAT_3RD_PARTY_GOV_DETAILS']//table[2]/tbody/tr[5]//tr[5]/td[3] | [NOT EMPTY]           |
      | //div[@id='WAT_3RD_PARTY_GOV_DETAILS']//table[2]/tbody/tr[5]//tr[6]/td[1] | Street                |
      | //div[@id='WAT_3RD_PARTY_GOV_DETAILS']//table[2]/tbody/tr[5]//tr[6]/td[2] | [NOT EMPTY]           |
      | //div[@id='WAT_3RD_PARTY_GOV_DETAILS']//table[2]/tbody/tr[5]//tr[6]/td[3] | [NOT EMPTY]           |
      | //div[@id='WAT_3RD_PARTY_GOV_DETAILS']//table[2]/tbody/tr[5]//tr[7]/td[1] | City, State, Zip      |
      | //div[@id='WAT_3RD_PARTY_GOV_DETAILS']//table[2]/tbody/tr[5]//tr[7]/td[2] | [NOT EMPTY]           |
      | //div[@id='WAT_3RD_PARTY_GOV_DETAILS']//table[2]/tbody/tr[5]//tr[7]/td[3] | [NOT EMPTY]           |
    And the HTML response has xpath //div[@id='WAT_3RD_PARTY_GOV_DETAILS']//div[@class='buffer_left'] with value (ignoring newline and spaces)
    """
    LoanSafe's SAM.gov Exclusion Section does not include OFAC records.
    For OFAC screening results, see the corresponding LoanSafe OFAC section.
    """

  @ofac
  @MADLRVP-9161
  Scenario: [MADLRVP-9161] Verify LSFM HTML - THIRD PARTY DETAIL - OFAC
    Given the request XML filepath is /ript/non_fcra/lsfm/html/MADLRVP-9161.xml
    When the request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                                                 | expected               |
      | //div[@id='thirdPartyOfacDetails']/div/span/b                         | OFAC                   |
      | //div[@id='OFAC_3RD_PARTY_CUST_DETAILS']/div/div                      | OFAC Record for Review |
      | //div[@id='OFAC_3RD_PARTY_CUST_DETAILS']//thead/tr[1]/th[1]/text()[1] | Input Name             |
      | //div[@id='OFAC_3RD_PARTY_CUST_DETAILS']//thead/tr[1]/th[1]/span      | [NOT EMPTY]            |
      | //div[@id='OFAC_3RD_PARTY_CUST_DETAILS']//thead/tr[1]/th[2]/text()[1] | Comparison Type        |
      | //div[@id='OFAC_3RD_PARTY_CUST_DETAILS']//thead/tr[1]/th[2]/span      | [NOT EMPTY]            |
      | //div[@id='OFAC_3RD_PARTY_CUST_DETAILS']//thead/tr[2]/th[1]/text()[1] | Reversed               |
      | //div[@id='OFAC_3RD_PARTY_CUST_DETAILS']//thead/tr[2]/th[1]/span      | [NOT EMPTY]            |
      | //div[@id='OFAC_3RD_PARTY_CUST_DETAILS']//thead/tr[2]/th[2]/text()[1] | Nickname               |
      | //div[@id='OFAC_3RD_PARTY_CUST_DETAILS']//thead/tr[2]/th[2]/span      | [NOT EMPTY]            |
      | //div[@id='OFAC_3RD_PARTY_CUST_DETAILS']//tbody/tr[1]/td[1]           | List/Program           |
      | //div[@id='OFAC_3RD_PARTY_CUST_DETAILS']//tbody/tr[1]/td[2]           | [NOT EMPTY]            |
      | //div[@id='OFAC_3RD_PARTY_CUST_DETAILS']//tbody/tr[1]/td[3]           | OFAC Entity #          |
      | //div[@id='OFAC_3RD_PARTY_CUST_DETAILS']//tbody/tr[1]/td[4]           | [NOT EMPTY]            |
      | //div[@id='OFAC_3RD_PARTY_CUST_DETAILS']//tbody/tr[2]/td[1]           | Match Company Name     |
      | //div[@id='OFAC_3RD_PARTY_CUST_DETAILS']//tbody/tr[2]/td[2]           | [NOT EMPTY]            |
      | //div[@id='OFAC_3RD_PARTY_CUST_DETAILS']//tbody/tr[2]/td[3]           | Date of Birth          |
      | //div[@id='OFAC_3RD_PARTY_CUST_DETAILS']//tbody/tr[2]/td[4]           | [NOT EMPTY]            |
      | //div[@id='OFAC_3RD_PARTY_CUST_DETAILS']//tbody/tr[3]/td[2]           | Place of Birth         |
      | //div[@id='OFAC_3RD_PARTY_CUST_DETAILS']//tbody/tr[3]/td[3]           | [NOT EMPTY]            |
      | //div[@id='OFAC_3RD_PARTY_CUST_DETAILS']//tbody/tr[5]/td[1]           | OFAC AKA               |
      | //div[@id='OFAC_3RD_PARTY_CUST_DETAILS']//tbody/tr[5]/td[2]           | [NOT EMPTY]            |

  @settlement_agent_risk_assessment
  @MADLRVP-9169
  Scenario: [MADLRVP-9169] Verify LSFM HTML - THIRD PARTY DETAIL - SETTLEMENT AGENT RISK ASSESSMENT
    Given the request XML filepath is /ript/non_fcra/lsfm/html/MADLRVP-9169.xml
    When the request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                                                  | expected                         |
      | //div[@id='saraSummary0']/div/span/b                                   | SETTLEMENT AGENT RISK ASSESSMENT |
      | //div[@id='saraSummary0']/div[2]/div/table//tr[1]/td[1]/b              | Business(es) Searched:           |
      | //div[@id='saraSummary0']/div[2]/div/table//tr[2]/td[1]                | [NOT EMPTY]                      |
      | //div[@id='saraSummary0']/div[2]/div/table//tr[1]/td[2]/b              | Individual(s) Searched:          |
      | //div[@id='saraSummary0']/div[2]/div/table//tr[2]/td[2]                | [NOT EMPTY]                      |
      | //div[@id='saraSummary0']/div[2]/div/table//tr[3]/td[1]/b              | Business(es) Found:              |
      | //div[@id='saraSummary0']/div[2]/div/table//tr[3]/td[1]/text()         | [NOT EMPTY]                      |
      | //div[@id='saraSummary0']/div[2]/div/table//tr[3]/td[2]/b              | Individual(s) Found:             |
      | //div[@id='saraSummary0']/div[2]/div/table//tr[3]/td[2]/text()         | [NOT EMPTY]                      |
#Settlement_Agent_Risk_Assessment-Table1
      | //div[@id='saraSummary0']/div[2]/div[2]/div[1]/table//th[1]            | Secure Insight #                 |
      | //div[@id='saraSummary0']/div[2]/div[2]/div[1]/table//th[2]            | Business Name                    |
      | //div[@id='saraSummary0']/div[2]/div[2]/div[1]/table//th[3]            | Insurance Type                   |
      | //div[@id='saraSummary0']/div[2]/div[2]/div[1]/table//th[4]            | Limit                            |
      | //div[@id='saraSummary0']/div[2]/div[2]/div[1]/table//th[5]            | Expiration Date                  |
      | //div[@id='saraSummary0']/div[2]/div[2]/div[1]/table//th[6]            | Expired                          |
#Settlement_Agent_Risk_Assessment-Agent_Information
      | //div[@id='saraSummary0']/div[2]/div[2]/div/div[3]/div[1]/div          | Agent Information                |
      | //div[@id='saraSummary0']/div[2]/div[2]/div/div[3]/div[1]/table//th[1] | Secure Insight #                 |
      | //div[@id='saraSummary0']/div[2]/div[2]/div/div[3]/div[1]/table//td[1] | [NOT EMPTY]                      |
      | //div[@id='saraSummary0']/div[2]/div[2]/div/div[3]/div[1]/table//th[2] | Name                             |
      | //div[@id='saraSummary0']/div[2]/div[2]/div/div[3]/div[1]/table//td[2] | [NOT EMPTY]                      |
      | //div[@id='saraSummary0']/div[2]/div[2]/div/div[3]/div[1]/table//th[3] | Role                             |
      | //div[@id='saraSummary0']/div[2]/div[2]/div/div[3]/div[1]/table//td[3] | [NOT EMPTY]                      |
      | //div[@id='saraSummary0']/div[2]/div[2]/div/div[3]/div[1]/table//th[4] | Business Address                 |
      | //div[@id='saraSummary0']/div[2]/div[2]/div/div[3]/div[1]/table//td[4] | [NOT EMPTY]                      |
      | //div[@id='saraSummary0']/div[2]/div[2]/div/div[3]/div[1]/table//th[5] | Business Phone                   |
      | //div[@id='saraSummary0']/div[2]/div[2]/div/div[3]/div[1]/table//td[5] | [NOT EMPTY]                      |
#Settlement_Agent_Risk_Assessment-Registration_Information
      | //div[@id='saraSummary0']/div[2]/div[2]/div/div[3]/div[2]/div          | Registration Information         |
      | //div[@id='saraSummary0']/div[2]/div[2]/div/div[3]/div[2]/table//th[1] | Risk Rating                      |
      | //div[@id='saraSummary0']/div[2]/div[2]/div/div[3]/div[2]/table//td[1] | [NOT EMPTY]                      |
      | //div[@id='saraSummary0']/div[2]/div[2]/div/div[3]/div[2]/table//th[2] | Vetting Level                    |
      | //div[@id='saraSummary0']/div[2]/div[2]/div/div[3]/div[2]/table//td[2] | [NOT EMPTY]                      |
      | //div[@id='saraSummary0']/div[2]/div[2]/div/div[3]/div[2]/table//th[3] | Watch Status                     |
      | //div[@id='saraSummary0']/div[2]/div[2]/div/div[3]/div[2]/table//td[3] | [NOT EMPTY]                      |
      | //div[@id='saraSummary0']/div[2]/div[2]/div/div[3]/div[2]/table//th[4] | Watch Source                     |
      | //div[@id='saraSummary0']/div[2]/div[2]/div/div[3]/div[2]/table//td[4] | [NOT EMPTY]                      |
      | //div[@id='saraSummary0']/div[2]/div[2]/div/div[3]/div[2]/table//th[5] | Registration Status              |
      | //div[@id='saraSummary0']/div[2]/div[2]/div/div[3]/div[2]/table//td[5] | [NOT EMPTY]                      |
      | //div[@id='saraSummary0']/div[2]/div[2]/div/div[3]/div[2]/table//th[6] | Registration Expiration          |
      | //div[@id='saraSummary0']/div[2]/div[2]/div/div[3]/div[2]/table//td[6] | [NOT EMPTY]                      |
      | //div[@id='saraSummary0']/div[2]/div[2]/div/div[3]/div[2]/table//th[7] | Rating Reason(s)                 |
      | //div[@id='saraSummary0']/div[2]/div[2]/div/div[3]/div[2]/table//td[7] | [NOT EMPTY]                      |
#Settlement_Agent_Risk_Assessment-License_Information
      | //div[@id='saraSummary0']/div[2]/div[2]/div/div[3]/div[3]              | License Information              |
      | //div[@id='saraSummary0']/div[2]/div[2]/div/div[3]/table//th[1]        | Group                            |
      | //div[@id='saraSummary0']/div[2]/div[2]/div/div[3]/table//th[2]        | License #                        |
      | //div[@id='saraSummary0']/div[2]/div[2]/div/div[3]/table//th[3]        | License Type                     |
      | //div[@id='saraSummary0']/div[2]/div[2]/div/div[3]/table//th[4]        | State                            |
#Settlement_Agent_Risk_Assessment-Expiration_Dates
      | //div[@id='saraSummary0']/div[2]/div[2]/div/div[3]/div[4]/div          | Expiration Dates                 |
      | //div[@id='saraSummary0']/div[2]/div[2]/div/div[3]/div[4]/table//th[1] | Expired Item(s)                  |
      | //div[@id='saraSummary0']/div[2]/div[2]/div/div[3]/div[4]/table//th[2] | Next Expiration Date             |
