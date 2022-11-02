@api
@fcra
@lsfm
@section
@identity
@watchlist
Feature: LSFM FCRA - Identity Section - Watchlist

  @MADLRVP-13515
  Scenario: [MADLRVP-13515] Verify LSFM FCRA - Check fuzzy reverse matching for names that contain nicknames
    Given the request XML filepath is /ript/fcra/lsfm/sections/identity/MADLRVP-13515.xml
    When the LSFM FCRA request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ThirdPartySection/SettlementAgentRiskAssessment |
    And the response has xpath
      | XPath                                                        | expected                              |
      | //SettlementAgentRiskAssessment/@busNameSearched             | Admiral Abstract, LLC                 |
      | //SettlementAgentRiskAssessment/@individualFirstNameSearched | KOREN                                 |
      | //SettlementAgentRiskAssessment/@individualLastNameSearched  | JON                                   |
      | //SettlementAgentRiskAssessment/@busNamesSearched            | Admiral Abstract, LLC                 |
      | //SettlementAgentRiskAssessment/@individualNamesSearched     | KOREN, JONATHAN                       |
      | //SettlementAgentRiskAssessment/@busCount                    | 1                                     |
      | //SettlementAgentRiskAssessment/@message                     | 1 Company Found, 1 Individual Found.. |
      | //SettlementAgentRiskAssessment/@individualCount             | 1                                     |

  @MADLRVP-13516
  Scenario: [MADLRVP-13516] Verify LSFM FCRA - Check fuzzy reverse matching for double names with typos
    Given the request XML filepath is /ript/fcra/lsfm/sections/identity/MADLRVP-13516.xml
    When the LSFM FCRA request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ThirdPartySection/SettlementAgentRiskAssessment |
    And the response has xpath
      | XPath                                                        | expected                              |
      | //SettlementAgentRiskAssessment/@busNameSearched             | Law office of Jacquelynn Vance-Pauls  |
      | //SettlementAgentRiskAssessment/@individualFirstNameSearched | Vance-Paul                            |
      | //SettlementAgentRiskAssessment/@individualLastNameSearched  | Jacquelyn                             |
      | //SettlementAgentRiskAssessment/@busNamesSearched            | Law office of Jacquelynn Vance-Pauls  |
      | //SettlementAgentRiskAssessment/@individualNamesSearched     | Vance-Pauls, Jacquelynn               |
      | //SettlementAgentRiskAssessment/@busCount                    | 1                                     |
      | //SettlementAgentRiskAssessment/@message                     | 1 Company Found, 1 Individual Found.. |
      | //SettlementAgentRiskAssessment/@individualCount             | 1                                     |

  @MADLRVP-13517
  Scenario: [MADLRVP-13517] Verify LSFM FCRA - Check fuzzy reverse matching for names that contain AKA
    Given the request XML filepath is /ript/fcra/lsfm/sections/identity/MADLRVP-13517.xml
    When the LSFM FCRA request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ThirdPartySection/SettlementAgentRiskAssessment |
    And the response has xpath
      | XPath                                                        | expected                              |
      | //SettlementAgentRiskAssessment/@busNameSearched             | Megan O'Connor Title Company          |
      | //SettlementAgentRiskAssessment/@individualFirstNameSearched | jons                                  |
      | //SettlementAgentRiskAssessment/@individualLastNameSearched  | megan                                 |
      | //SettlementAgentRiskAssessment/@busNamesSearched            | Megan O'Connor Title Company          |
      | //SettlementAgentRiskAssessment/@individualNamesSearched     | oconnor, megan                        |
      | //SettlementAgentRiskAssessment/@busCount                    | 1                                     |
      | //SettlementAgentRiskAssessment/@message                     | 1 Company Found, 1 Individual Found.. |
      | //SettlementAgentRiskAssessment/@individualCount             | 1                                     |

  @html
  @MADLRVP-13306
  Scenario: [MADLRVP-13306] Verify LSFM FCRA HTML - Verify the checks are the same for borrower and co-borrower if they have the same name
    Given the request XML filepath is /ript/fcra/lsfm/sections/identity/MADLRVP-13306.xml
    When the LSFM FCRA request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with IMAGE content
      | XPath                          | expected                                                                 |
      | //div[@id='searchSummary']/img | /PCFRSWebElements/images/ui/lsfm/confirmation_search_performed_white.gif |
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
      | //tr[@class="legend"][1]//img[1] | /PCFRSWebElements/images/ui/lsfm/analysis/success.gif        |
      | //tr[@class="legend"][1]//img[2] | /PCFRSWebElements/images/ui/lsfm/analysis/alerts_cleared.gif |
      | //tr[@class="legend"][1]//img[3] | /PCFRSWebElements/images/ui/lsfm/analysis/fail.gif           |
      | //tr[@class="legend"][1]//img[4] | /PCFRSWebElements/images/ui/lsfm/analysis/attention.gif      |
      | //tr[@class="legend"][1]//img[5] | /PCFRSWebElements/images/ui/lsfm/analysis/insufficient.gif   |
      | //tr[@class="legend"][1]//img[6] | /PCFRSWebElements/images/ui/lsfm/analysis/inactive.gif       |
    And the HTML response has xpath with TEXT content
      | XPath                                 | expected                         |
      | //tr[@class="legend"][1]/td/text()[2] | Complete                         |
      | //tr[@class="legend"][1]/td/text()[3] | Alert(                           |
      | //tr[@class="legend"][1]/td/text()[4] | ) Cleared                        |
      | //tr[@class="legend"][1]/td/text()[5] | Search Failed                    |
      | //tr[@class="legend"][1]/td/text()[6] | Review Recommended               |
      | //tr[@class="legend"][1]/td/text()[7] | Insufficient Data                |
      | //tr[@class="legend"][1]/td/text()[8] | N/A                              |
      | //tr[@class="legend"][2]/td/text()[2] | Settlement Agent Risk Assessment |
      | //tr[@class="legend"][2]/td/text()[4] | Other Gov't: HUD LDP, FHFA SCP   |
