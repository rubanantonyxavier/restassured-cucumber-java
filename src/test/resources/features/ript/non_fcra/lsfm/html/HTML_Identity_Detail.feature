@api
@non_fcra
@lsfm
@html
@identity
@section
Feature: LSFM HTML IDENTITY DETAIL Section

  @MADLRVP-9147
  Scenario: [MADLRVP-9147] Verify LSFM HTML - IDENTITY SUMMARY - No Bankruptcies found
    Given the request XML filepath is /ript/non_fcra/lsfm/html/MADLRVP-9147_NoBankruptcy.xml
    When the request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with IMAGE content
      | XPath                                                           | expected                                                   |
      | //div[@id='identityDetail']/img[@alt='Identity Detail Section'] | /PCFRSWebElements/images/ui/lsfm/identity_detail_white.gif |
    And the HTML response has xpath with TEXT content
      | XPath                                                                     | expected                                             |
      | //div[@id='idSummaryBorrower0']//div[@class='text']//b                    | IDENTITY SUMMARY: Castillo, Mary                     |
      | (//div[@id='idSummaryBorrower0']//table[@class='subSectionHeader']//b)[1] | BEST MATCH                                           |
      | (//div[@id='idSummaryBorrower0']//table)[2]//td[1]/b                      | Name: SSN: SSN Issue State: Approx. SSN Issue Years: |
      | (//div[@id='idSummaryBorrower0']//table)[2]//td[2]/b                      | Date Reported: Date of Birth:                        |
      | (//div[@id='idSummaryBorrower0']//table)[2]//td[3]/b                      | AKA                                                  |
      | //div[@id='IDENTITY_DETAIL_BK0']//table[@class='subSectionHeader']//b     | BANKRUPTCY                                           |
      | //div[@id='IDENTITY_DETAIL_BK0']//table[@class='gray_text_table']//b      | # Bankruptcies Found:                                |
      | //div[@id='IDENTITY_DETAIL_BK0']//table[@class='gray_text_table']         | # Bankruptcies Found: No Bankruptcies found          |

  @bankruptcy
  @MADLRVP-9147
  Scenario: [MADLRVP-9147] Verify LSFM HTML - IDENTITY SUMMARY - Bankruptcies found
    Given the request XML filepath is /ript/non_fcra/lsfm/html/MADLRVP-9147_Bankruptcy.xml
    When the request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with IMAGE content
      | XPath                                                           | expected                                                   |
      | //div[@id='identityDetail']/img[@alt='Identity Detail Section'] | /PCFRSWebElements/images/ui/lsfm/identity_detail_white.gif |
    And the HTML response has ON-CLICK elements in each XPath that end with the expected content
      | XPath                                                            | expected                                         |
      | //div[@id='idSummaryBorrower0']//*[@class='subSectionHeader']//a | /PCFRSWebElements/html/other_identities_faq.html |
    And the HTML response has xpath with TEXT content
      | XPath                                                                                                      | expected                                             |
      | //div[@id='idSummaryBorrower0']//div[@class='text']//b                                                     | IDENTITY SUMMARY: Ardur, J                           |
      | (//div[@id='idSummaryBorrower0']//table[@class='subSectionHeader']//b)[1]                                  | SSN has not been issued or has been randomly issued. |
#  IDENTITY SUMMARY
      | (//div[@id='idSummaryBorrower0']//table[@class='subSectionHeader']//b)[2]                                  | BEST MATCH                                           |
      | (//div[@id='idSummaryBorrower0']//table)[3]//td[1]/b                                                       | Name: SSN: SSN Issue State: Approx. SSN Issue Years: |
      | (//div[@id='idSummaryBorrower0']//table)[3]//td[2]/b                                                       | Date Reported: Date of Birth:                        |
      | (//div[@id='idSummaryBorrower0']//table)[3]//td[3]/b                                                       | AKA                                                  |
#  OTHER IDENTITIES FOUND
      | (//div[@id='idSummaryBorrower0']//table[@class='subSectionHeader'])[3]//b                                  | OTHER IDENTITIES FOUND                               |
      | //div[@id='idSummaryBorrower0']//table[@class='gray_text_table other_identity_grid_4_cell']//tr[1]/td[1]/b | Other Name                                           |
      | //div[@id='idSummaryBorrower0']//table[@class='gray_text_table other_identity_grid_4_cell']//tr[1]/td[2]/b | SSN Details                                          |
      | //div[@id='idSummaryBorrower0']//table[@class='gray_text_table other_identity_grid_4_cell']//tr[1]/td[3]/b | AKA                                                  |
      | //div[@id='idSummaryBorrower0']//table[@class='gray_text_table other_identity_grid_4_cell']//tr[2]/td[2]/b | SSN: Date Reported: Date of Birth:                   |
      | //div[@id='idSummaryBorrower0']//table[@class='gray_text_table other_identity_grid_4_cell']//tr[2]/td[1]   | JOHN ARDUR                                           |
#  BANKRUPTCY
      | //div[@id='IDENTITY_DETAIL_BK0']//table[@class='subSectionHeader']//b                                      | BANKRUPTCY                                           |
      | //div[@id='IDENTITY_DETAIL_BK0']//table[@class='gray_text_table']//tr[1]/td[1]                             | # Bankruptcies Found: 3                              |
      | //div[@id='IDENTITY_DETAIL_BK0']//table[@class='gray_text_table']//tr[4]/td[1]                             | Case Number:                                         |
      | //div[@id='IDENTITY_DETAIL_BK0']//table[@class='gray_text_table']//tr[5]/td[1]/b                           | Court Code:                                          |
      | //div[@id='IDENTITY_DETAIL_BK0']//table[@class='gray_text_table']//tr[3]/td[2]                             | Chapter: 7                                           |
      | //div[@id='IDENTITY_DETAIL_BK0']//table[@class='gray_text_table']//tr[4]/td[2]/b                           | Court Name:                                          |
      | //div[@id='IDENTITY_DETAIL_BK0']//table[@class='gray_text_table']//tr[5]/td[2]/b                           | Filing Status:                                       |
      | //div[@id='IDENTITY_DETAIL_BK0']//table[@class='gray_text_table']//tr[3]/td[3]/b                           | Filing Date:                                         |
      | //div[@id='IDENTITY_DETAIL_BK0']//table[@class='gray_text_table']//tr[4]/td[3]/b                           | Disposition Date:                                    |
      | //div[@id='IDENTITY_DETAIL_BK0']//table[@class='gray_text_table']//tr[5]/td[3]/b                           | Disposition:                                         |

  @MADLRVP-9148
  Scenario: [MADLRVP-9148] Verify LSFM HTML - WATCHLIST SEARCHES - OFAC check
    Given the request XML filepath is /ript/non_fcra/lsfm/html/MADLRVP-9148.xml
    When the request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                                                 | expected                          |
      | //div[@id='idDerogatoryBorrower0']//*[@class='wide_letter_spacing']/b | WATCHLIST SEARCHES: BEKTAS, HALIS |
      | //div[@id='OFAC_SDN_DETAILS0']//*[@class='sectionBullet']             | OFAC Record for Review            |
      | //table[@class='ofacTable'][1]/thead/tr[1]                            | Name: bektas, halis               |
      | //table[@class='ofacTable'][1]/thead/tr[2]                            | Reversed: N                       |
      | //table[@class='ofacTable'][1]/tbody/tr[1]/td[1]                      | List/Program                      |
      | //table[@class='ofacTable'][1]/tbody/tr[1]/td[2]                      | SDN                               |
      | //table[@class='ofacTable'][1]/tbody/tr[1]/td[3]                      | OFAC Entity #                     |
      | //table[@class='ofacTable'][1]/tbody/tr[2]/td[1]                      | Date of Birth                     |
      | //table[@class='ofacTable'][1]/tbody/tr[2]/td[2]                      | [DATE --> MMM dd, yyyy]           |
      | //table[@class='ofacTable'][1]/tbody/tr[2]/td[3]                      | Place of Birth                    |
    And the HTML response has xpath //div[@class='disclaimerOfac'] with value (ignoring newline and spaces)
    """
    The information in this report is provided based on your input, and is intended to facilitate your further research.
    It does not indicate that the person(s) you are screening appear on any of the lists being searched,
    or that any derogatory information is associated with such person(s). This information in this report may not be
    used, in whole or in part, for the purpose of serving as a factor in establishing any individual's eligibility
    for credit, insurance, employment, or any other purpose authorized under the Fair Credit Reporting Act, or as
    a basis for any adverse action against any individual.
    """

  @MADLRVP-9149
  Scenario: [MADLRVP-9149] Verify LSFM HTML - WATCHLIST SEARCHES - OFAC check
    Given the request XML filepath is /ript/non_fcra/lsfm/html/MADLRVP-9149.xml
    When the request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with IMAGE content
      | XPath                                                           | expected                                                   |
      | //div[@id='identityDetail']/img[@alt='Identity Detail Section'] | /PCFRSWebElements/images/ui/lsfm/identity_detail_white.gif |
    And the HTML response has xpath with TEXT content
      | XPath                                                                                | expected                        |
      | //div[@id='idDerogatoryBorrower0']//*[@class='wide_letter_spacing']/b                | WATCHLIST SEARCHES: GRAY, AARON |
      | //div[@id='WAT_GOV_DETAILS0']//b                                                     | Government Watch List           |
      | (//div[@id='WAT_GOV_DETAILS0']//tr[@class='header'])[1]//td[1]                       | Source                          |
      | (//div[@id='WAT_GOV_DETAILS0']//tr[@class='header'])[1]//td[2]                       | Category                        |
      | (//div[@id='WAT_GOV_DETAILS0']//tr[@class='header'])[1]//td[3]                       | Match Type                      |
      | (//div[@id='WAT_GOV_DETAILS0']//tr[@class='header'])[1]//td[4]                       | Borrower AKA Matched            |
      | (//div[@id='WAT_GOV_DETAILS0']//tr[@class='header'])[1]//td[5]                       | Reversed                        |
      | (//div[@id='WAT_GOV_DETAILS0']//tr[@class='header'])[1]//td[6]                       | Address Matched                 |
      | (//div[@id='WAT_GOV_DETAILS0']//tr[@class='header'])[1]//td[7]                       | Nickname Matched                |
      | (//div[@id='WAT_GOV_DETAILS0']//tr[@class='header'])[2]//td[2]                       | BORROWER REPORTED DATA          |
      | (//div[@id='WAT_GOV_DETAILS0']//tr[@class='header'])[2]//td[3]                       | WATCH LIST RESULTS              |
      | //div[@id='WAT_GOV_DETAILS0']//table[@class='data derogatoryListTable']//tr[2]/td[1] | Name                            |
      | //div[@id='WAT_GOV_DETAILS0']//table[@class='data derogatoryListTable']//tr[2]/td[2] | gray, aaron                     |
      | //div[@id='WAT_GOV_DETAILS0']//table[@class='data derogatoryListTable']//tr[3]/td[1] | Street                          |
      | //div[@id='WAT_GOV_DETAILS0']//table[@class='data derogatoryListTable']//tr[4]/td[1] | City, State, Zip                |
    And the HTML response has xpath //div[@id='WAT_GOV_DETAILS0']//div[@class='buffer_left'] with value (ignoring newline and spaces)
    """
    LoanSafe's SAM.gov Exclusion Section does not include OFAC records.
    For OFAC screening results, see the corresponding LoanSafe OFAC section.
    """