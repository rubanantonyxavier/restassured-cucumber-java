@api
@non_fcra
@lsfm
@html
@searches
@section
Feature: LSFM HTML Searches Section

  @MADLRVP-9134
  Scenario: [MADLRVP-9134] Verify LSFM HTML - Confirmation of Searches Section
    Given the request XML filepath is /ript/non_fcra/lsfm/html/MADLRVP-9134.xml
    When the request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                                                   | expected           |
      | //table[@class='FM_searchSummary']//tr[1]/th[1]                         | Name/ID            |
      | //table[@class='FM_searchSummary']//tr[1]/th[2]                         | Type/Onfile Name   |
      | //table[@class='FM_searchSummary']//tr[1]/th[3]                         | SSN                |
      | //table[@class='FM_searchSummary']//tr[1]/th[4]                         | MERS               |
      | //table[@class='FM_searchSummary']//tr[1]/th[5]                         | NMLS               |
      | //table[@class='FM_searchSummary']//tr[1]/th[6]                         | ASC                |
      | //table[@class='FM_searchSummary']//tr[1]/th[7]                         | SARA 1             |
      | //table[@class='FM_searchSummary']//tr[1]/th[8]                         | OFAC               |
      | //table[@class='FM_searchSummary']//tr[1]/th[9]                         | SAM.gov            |
      | //table[@class='FM_searchSummary']//tr[1]/th[10]/span                   | Other Gov't 2      |
      | //table[@class='FM_searchSummary']//tr[1]/th[11]                        | Freddie Mac        |
      | //table[@class='FM_searchSummary']//tr[1]/th[12]                        | Client Supplied    |
      | //table[@class='FM_searchSummary']//tr[@class='legend'][1]/td/text()[2] | Complete           |
      | //table[@class='FM_searchSummary']//tr[@class='legend'][1]/td/text()[3] | Alert(             |
      | //table[@class='FM_searchSummary']//tr[@class='legend'][1]/td/text()[4] | ) Cleared          |
      | //table[@class='FM_searchSummary']//tr[@class='legend'][1]/td/text()[5] | Search Failed      |
      | //table[@class='FM_searchSummary']//tr[@class='legend'][1]/td/text()[6] | Review Recommended |
      | //table[@class='FM_searchSummary']//tr[@class='legend'][1]/td/text()[7] | Insufficient Data  |
      | //table[@class='FM_searchSummary']//tr[@class='legend'][1]/td/text()[8] | N/A                |
    And the HTML response has xpath //table[@class='FM_searchSummary']//tr[@class='legend'][2]/td with value (ignoring newline and spaces)
    """
    1 Settlement Agent Risk Assessment
    2 Other Gov't: HUD LDP, FHFA SCP
    3 Borrower watchlist screening includes AKAs listed in the Best Match in the identity section
    """
    And the HTML response has xpath with IMAGE content
      | XPath                                                                | expected                                                     |
      | //table[@class='FM_searchSummary']//tr[@class='legend'][1]/td/img[1] | /PCFRSWebElements/images/ui/lsfm/analysis/success.gif        |
      | //table[@class='FM_searchSummary']//tr[@class='legend'][1]/td/img[2] | /PCFRSWebElements/images/ui/lsfm/analysis/alerts_cleared.gif |
      | //table[@class='FM_searchSummary']//tr[@class='legend'][1]/td/img[3] | /PCFRSWebElements/images/ui/lsfm/analysis/fail.gif           |
      | //table[@class='FM_searchSummary']//tr[@class='legend'][1]/td/img[4] | /PCFRSWebElements/images/ui/lsfm/analysis/attention.gif      |
      | //table[@class='FM_searchSummary']//tr[@class='legend'][1]/td/img[5] | /PCFRSWebElements/images/ui/lsfm/analysis/insufficient.gif   |
      | //table[@class='FM_searchSummary']//tr[@class='legend'][1]/td/img[6] | /PCFRSWebElements/images/ui/lsfm/analysis/inactive.gif       |
