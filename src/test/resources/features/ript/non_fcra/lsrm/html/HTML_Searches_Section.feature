@api
@non_fcra
@lsrm
@html
@searches
Feature: LSRM HTML SEARCHES section

  @MADLRVP-9285
  Scenario: [MADLRVP-9285] Verify LSRM HTML - SEARCHES section
    Given the request XML filepath is /ript/non_fcra/lsrm/html/MADLRVP-9285.xml
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
      | //tr[@class="legend"][1]/td/text()[4] | ) Cleared                        |
      | //tr[@class="legend"][1]/td/text()[5] | Search Failed                    |
      | //tr[@class="legend"][1]/td/text()[6] | Review Recommended               |
      | //tr[@class="legend"][1]/td/text()[7] | Insufficient Data                |
      | //tr[@class="legend"][1]/td/text()[8] | N/A                              |
      | //tr[@class="legend"][2]/td/text()[2] | Settlement Agent Risk Assessment |
      | //tr[@class="legend"][2]/td/text()[4] | Other Gov't: HUD LDP, FHFA SCP   |
