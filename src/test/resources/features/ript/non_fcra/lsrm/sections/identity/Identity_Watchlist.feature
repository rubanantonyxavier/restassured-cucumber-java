@api
@non_fcra
@lsrm
@section
@identity
@watchlist
Feature: LSRM - Identity Section - Watchlist

  @html
  @MADLRVP-13307
  Scenario: [MADLRVP-13307] Verify LSRM HTML - Verify the checks are the same for borrower and co-borrower if they have the same name
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/identity/MADLRVP-13307.xml
    When the LSRM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with IMAGE content
      | XPath                          | expected                                                                 |
      | //div[@id='searchSummary']/img | /PCFRSWebElements/images/ui/lsrm/confirmation_search_performed_white.gif |
# Confirmation Of Searches Performed Table header
    And the HTML response has xpath with TEXT content
      | XPath                              | expected         |
      | //div[@id='searchSummary']//th[1]  | Name/ID          |
      | //div[@id='searchSummary']//th[2]  | Type/Onfile Name |
      | //div[@id='searchSummary']//th[3]  | SSN              |
      | //div[@id='searchSummary']//th[4]  | MERS             |
      | //div[@id='searchSummary']//th[5]  | NMLS             |
      | //div[@id='searchSummary']//th[6]  | ASC              |
      | //div[@id='searchSummary']//th[7]  | SARA 1           |
      | //div[@id='searchSummary']//th[8]  | OFAC             |
      | //div[@id='searchSummary']//th[9]  | SAM.gov          |
      | //div[@id='searchSummary']//th[10] | Other Gov't 2    |
      | //div[@id='searchSummary']//th[11] | Freddie Mac      |
      | //div[@id='searchSummary']//th[12] | Client Supplied  |
# Table content icons
    And multiple HTML elements by xpath //div[@id='searchSummary']/div[@class='indent_block']//td//img has attribute 'src' with value match '.*(attention\.gif|insufficient\.gif|inactive\.gif|fail\.gif|success\.gif|alerts_cleared\.gif)'
    And multiple HTML elements by xpath //div[@id='searchSummary']/div[@class='indent_block']//td[3]//img has attribute 'src' with value match '.*attention\.gif'
    And multiple HTML elements by xpath //div[@id='searchSummary']/div[@class='indent_block']//td[8]//img has attribute 'src' with value match '.*success\.gif'
    And multiple HTML elements by xpath //div[@id='searchSummary']/div[@class='indent_block']//td[9]//img has attribute 'src' with value match '.*success\.gif'
    And multiple HTML elements by xpath //div[@id='searchSummary']/div[@class='indent_block']//td[10]//img has attribute 'src' with value match '.*success\.gif'
# Legend
    And the HTML response has xpath with IMAGE content
      | XPath                            | expected                                                     |
      | //tr[@class="legend"][1]//img[1] | /PCFRSWebElements/images/ui/lsrm/analysis/success.gif        |
      | //tr[@class="legend"][1]//img[2] | /PCFRSWebElements/images/ui/lsrm/analysis/alerts_cleared.gif |
      | //tr[@class="legend"][1]//img[3] | /PCFRSWebElements/images/ui/lsrm/analysis/fail.gif           |
      | //tr[@class="legend"][1]//img[4] | /PCFRSWebElements/images/ui/lsrm/analysis/attention.gif      |
      | //tr[@class="legend"][1]//img[5] | /PCFRSWebElements/images/ui/lsrm/analysis/insufficient.gif   |
      | //tr[@class="legend"][1]//img[6] | /PCFRSWebElements/images/ui/lsrm/analysis/inactive.gif       |
    And the HTML response has xpath with TEXT content
      | XPath                                 | expected                         |
      | //tr[@class="legend"][1]/td/text()[2] | Complete                         |
      | //tr[@class="legend"][1]/td/text()[3] | Alert(                           |
      | //tr[@class="legend"][1]/td/span      | s                                |
      | //tr[@class="legend"][1]/td/text()[4] | ) Cleared                        |
      | //tr[@class="legend"][1]/td/text()[5] | Search Failed                    |
      | //tr[@class="legend"][1]/td/text()[6] | Review Recommended               |
      | //tr[@class="legend"][1]/td/text()[7] | Insufficient Data                |
      | //tr[@class="legend"][1]/td/text()[8] | N/A                              |
      | //tr[@class="legend"][2]/td/text()[2] | Settlement Agent Risk Assessment |
      | //tr[@class="legend"][2]/td/text()[4] | Other Gov't: HUD LDP, FHFA SCP   |

  @MADLRVP-13512
  Scenario: [MADLRVP-13512] Verify LSRM - Check fuzzy reverse matching for names that contain AKA
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/identity/MADLRVP-13512.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //ThirdPartySection/SettlementAgentRiskAssessment |
    And the response has xpath
      | XPath                                                        | expected                              |
      | //SettlementAgentRiskAssessment/@busNameSearched             | Megan O'Connor Title Company          |
      | //SettlementAgentRiskAssessment/@individualFirstNameSearched | jone                                  |
      | //SettlementAgentRiskAssessment/@individualLastNameSearched  | megan                                 |
      | //SettlementAgentRiskAssessment/@busNamesSearched            | Megan O'Connor Title Company          |
      | //SettlementAgentRiskAssessment/@individualNamesSearched     | oconnor, megan                        |
      | //SettlementAgentRiskAssessment/@busCount                    | 1                                     |
      | //SettlementAgentRiskAssessment/@message                     | 1 Company Found, 1 Individual Found.. |
      | //SettlementAgentRiskAssessment/@individualCount             | 1                                     |

  @MADLRVP-13513
  Scenario: [MADLRVP-13513] Verify LSRM - Check fuzzy reverse matching for nickname and last name
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/identity/MADLRVP-13513.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //ThirdPartySection/SettlementAgentRiskAssessment |
    And the response has xpath
      | XPath                                                        | expected                                  |
      | //SettlementAgentRiskAssessment/@busNameSearched             | The Law Offices of William J. Golding, PC |
      | //SettlementAgentRiskAssessment/@individualFirstNameSearched | Golding                                   |
      | //SettlementAgentRiskAssessment/@individualLastNameSearched  | Bill                                      |
      | //SettlementAgentRiskAssessment/@busNamesSearched            | The Law Offices of William J. Golding, PC |
      | //SettlementAgentRiskAssessment/@individualNamesSearched     | Golding, William                          |
      | //SettlementAgentRiskAssessment/@busCount                    | 1                                         |
      | //SettlementAgentRiskAssessment/@message                     | 1 Company Found, 1 Individual Found..     |
      | //SettlementAgentRiskAssessment/@individualCount             | 1                                         |

  @MADLRVP-13514
  Scenario: [MADLRVP-13514] Verify LSRM - Check fuzzy reverse matching for double name with typos
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/identity/MADLRVP-13514.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //ThirdPartySection/SettlementAgentRiskAssessment |
    And the response has xpath
      | XPath                                                        | expected                              |
      | //SettlementAgentRiskAssessment/@busNameSearched             | Horizon Land Services, LLC            |
      | //SettlementAgentRiskAssessment/@individualFirstNameSearched | May-MLean                             |
      | //SettlementAgentRiskAssessment/@individualLastNameSearched  | Susan                                 |
      | //SettlementAgentRiskAssessment/@busNamesSearched            | Horizon Land Services, LLC            |
      | //SettlementAgentRiskAssessment/@individualNamesSearched     | May-McLean, Susan                     |
      | //SettlementAgentRiskAssessment/@busCount                    | 1                                     |
      | //SettlementAgentRiskAssessment/@message                     | 1 Company Found, 1 Individual Found.. |
      | //SettlementAgentRiskAssessment/@individualCount             | 1                                     |
