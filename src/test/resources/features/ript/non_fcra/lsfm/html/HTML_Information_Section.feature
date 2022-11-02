@api
@non_fcra
@lsfm
@html
@information
@section
Feature: LSFM HTML Information Section

  @report
  @MADLRVP-9108
  Scenario: [MADLRVP-9108] Verify LSFM HTML - REPORT INFORMATION section
    Given the request XML filepath is /ript/non_fcra/lsfm/html/MADLRVP-9108.xml
    When the request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                                                | expected                         |
      | //table[@class='FM_data FM_header_info_1']//tr/td[@class='header']/b | REPORT INFORMATION               |
      | //table[@class='FM_data FM_header_info_1']//tr[3]/td[1]/b            | Report Order No.                 |
      | //table[@class='FM_data FM_header_info_1']//tr[3]/td[2]              | [NOT EMPTY]                      |
      | //table[@class='FM_data FM_header_info_1']//tr[3]/td[3]/b            | Report Date                      |
      | //table[@class='FM_data FM_header_info_1']//tr[3]/td[4]              | [DATETIME --> MMM d, yyyy h:mma] |
      | //table[@class='FM_data FM_header_info_1']//tr[4]/td[1]/b            | Master ID                        |
      | //table[@class='FM_data FM_header_info_1']//tr[4]/td[2]              | [NOT EMPTY]                      |
      | //table[@class='FM_data FM_header_info_1']//tr[4]/td[3]/b            | Primary Report Date              |
      | //table[@class='FM_data FM_header_info_1']//tr[4]/td[4]              | [DATETIME --> MMM d, yyyy h:mma] |
      | //table[@class='FM_data FM_header_info_1']//tr[5]/td[1]/b            | Standardized Property Address    |
      | //table[@class='FM_data FM_header_info_1']//tr[5]/td[2]              | [NOT EMPTY]                      |
      | //table[@class='FM_data FM_header_info_1']//tr[5]/td[3]/b            | Input Property Address           |
      | //table[@class='FM_data FM_header_info_1']//tr[5]/td[4]              | [NOT EMPTY]                      |
      | //table[@class='FM_data FM_header_info_1']//tr[6]/td[1]/b            | APN                              |
      | //table[@class='FM_data FM_header_info_1']//tr[6]/td[2]              | [NOT EMPTY]                      |
      | //table[@class='FM_data FM_header_info_1']//tr[7]/td[1]/b            | Current Address                  |
      | //table[@class='FM_data FM_header_info_1']//tr[7]/td[2]              | [NOT EMPTY]                      |
      | //table[@class='FM_data FM_header_info_1']//tr[8]/td[1]/b            | Retro Date                       |
      | //table[@class='FM_data FM_header_info_1']//tr[8]/td[2]              | [DATE --> MMM d, yyyy]           |
    And the HTML response has xpath with IMAGE content
      | XPath                                                         | expected                                        |
      | //table[@class='FM_data FM_header_info_1']//tr[5]/td[1]/a/img | /PCFRSWebElements/images/ui/lsfm/faq_button.png |
    And the HTML response has ON-CLICK elements in each XPath that end with the expected content
      | XPath                                                     | expected                                         |
      | //table[@class='FM_data FM_header_info_1']//tr[5]/td[1]/a | /PCFRSWebElements/html/subject_property_faq.html |

  @loan
  @MADLRVP-9109
  Scenario: [MADLRVP-9109] Verify LSFM HTML - LOAN INFORMATION section
    Given the request XML filepath is /ript/non_fcra/lsfm/html/MADLRVP-9109.xml
    When the request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                                                   | expected                 |
      | //table[@class='FM_data FM_header_info_2']//tr/td[@class='header'][1]/b | LOAN INFORMATION         |
      | //table[@class='FM_data FM_header_info_2']//tr[2]/td[1]/b               | Loan Number              |
      | //table[@class='FM_data FM_header_info_2']//tr[2]/td[2]                 | [NOT EMPTY]              |
      | //table[@class='FM_data FM_header_info_2']//tr[3]/td[1]/b               | Loan Purpose             |
      | //table[@class='FM_data FM_header_info_2']//tr[3]/td[2]                 | [NOT EMPTY]              |
      | //table[@class='FM_data FM_header_info_2']//tr[4]/td[1]/b               | Broker Code / Name       |
      | //table[@class='FM_data FM_header_info_2']//tr[4]/td[2]                 | [NOT EMPTY]              |
      | //table[@class='FM_data FM_header_info_2']//tr[5]/td[1]/b               | Occupancy                |
      | //table[@class='FM_data FM_header_info_2']//tr[5]/td[2]                 | [NOT EMPTY]              |
      | //table[@class='FM_data FM_header_info_2']//tr[6]/td[1]/b               | Doc Type                 |
      | //table[@class='FM_data FM_header_info_2']//tr[6]/td[2]                 | [NOT EMPTY]              |
      | //table[@class='FM_data FM_header_info_2']//tr[7]/td[1]/b               | Reported Appraised Value |
      | //table[@class='FM_data FM_header_info_2']//tr[7]/td[2]                 | [NOT EMPTY]              |
      | //table[@class='FM_data FM_header_info_2']//tr[8]/td[1]/b               | Loan Amount              |
      | //table[@class='FM_data FM_header_info_2']//tr[8]/td[2]                 | [NOT EMPTY]              |
      | //table[@class='FM_data FM_header_info_2']//tr[9]/td[1]/b               | LTV / CombLTV            |
      | //table[@class='FM_data FM_header_info_2']//tr[9]/td[2]                 | [NOT EMPTY]              |

  @borrower
  @MADLRVP-9110
  Scenario: [MADLRVP-9110] Verify LSFM HTML - BORROWER INFORMATION section
    Given the request XML filepath is /ript/non_fcra/lsfm/html/MADLRVP-9110.xml
    When the request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                                                   | expected                  |
      | //table[@class='FM_data FM_header_info_2']//tr/td[@class='header'][2]/b | BORROWER INFORMATION      |
      | //table[@class='FM_data FM_header_info_2']//tr[2]/td[3]/b               | Pri-Borrower              |
      | //table[@class='FM_data FM_header_info_2']//tr[2]/td[4]                 | [NOT EMPTY]               |
      | //table[@class='FM_data FM_header_info_2']//tr[3]/td[3]/b               | Pri-Borrower SSN          |
      | //table[@class='FM_data FM_header_info_2']//tr[3]/td[4]                 | [NOT EMPTY]               |
      | //table[@class='FM_data FM_header_info_2']//tr[4]/td[3]/b               | Date of Birth             |
      | //table[@class='FM_data FM_header_info_2']//tr[4]/td[4]                 | [NOT EMPTY]               |
      | //table[@class='FM_data FM_header_info_2']//tr[5]/td[3]/b               | First Time Buyer          |
      | //table[@class='FM_data FM_header_info_2']//tr[5]/td[4]                 | [NOT EMPTY]               |
      | //table[@class='FM_data FM_header_info_2']//tr[6]/td[3]/b               | Home Phone                |
      | //table[@class='FM_data FM_header_info_2']//tr[6]/td[4]                 | [NOT EMPTY]               |
      | //table[@class='FM_data FM_header_info_2']//tr[7]/td[3]/b               | Co-Borrower               |
      | //table[@class='FM_data FM_header_info_2']//tr[7]/td[4]                 | [NOT EMPTY]               |
      | //table[@class='FM_data FM_header_info_2']//tr[8]/td[3]/b               | Co-Borrower SSN           |
      | //table[@class='FM_data FM_header_info_2']//tr[8]/td[4]                 | [NOT EMPTY]               |
      | //table[@class='FM_data FM_header_info_2']//tr[9]/td[3]/b               | Co-Borrower Date of Birth |
      | //table[@class='FM_data FM_header_info_2']//tr[9]/td[4]                 | [NOT EMPTY]               |

  @employment
  @MADLRVP-9111
  Scenario: [MADLRVP-9111] Verify LSFM HTML - EMPLOYMENT INFORMATION section
    Given the request XML filepath is /ript/non_fcra/lsfm/html/MADLRVP-9111.xml
    When the request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                                                   | expected               |
      | //table[@class='FM_data FM_header_info_2']//tr/td[@class='header'][3]/b | EMPLOYMENT INFORMATION |
      | //table[@class='FM_data FM_header_info_2']//tr[2]/td[5]/b               | Employer               |
      | //table[@class='FM_data FM_header_info_2']//tr[2]/td[6]                 | [NOT EMPTY]            |
      | //table[@class='FM_data FM_header_info_2']//tr[3]/td[5]/b               | Self Employed          |
      | //table[@class='FM_data FM_header_info_2']//tr[3]/td[6]                 | [NOT EMPTY]            |
      | //table[@class='FM_data FM_header_info_2']//tr[4]/td[5]/b               | Mo. Income             |
      | //table[@class='FM_data FM_header_info_2']//tr[4]/td[6]                 | [NOT EMPTY]            |
      | //table[@class='FM_data FM_header_info_2']//tr[5]/td[5]/b               | Job Years              |
      | //table[@class='FM_data FM_header_info_2']//tr[5]/td[6]                 | [NOT EMPTY]            |
      | //table[@class='FM_data FM_header_info_2']//tr[6]/td[5]/b               | Work Phone             |
      | //table[@class='FM_data FM_header_info_2']//tr[6]/td[6]                 | [NOT EMPTY]            |
      | //table[@class='FM_data FM_header_info_2']//tr[7]/td[5]/b               | Debt-to-Income         |
      | //table[@class='FM_data FM_header_info_2']//tr[7]/td[6]                 | [NOT EMPTY]            |
      | //table[@class='FM_data FM_header_info_2']//tr[8]/td[5]/b               | Total Mo. Income       |
      | //table[@class='FM_data FM_header_info_2']//tr[8]/td[6]                 | [NOT EMPTY]            |

  @multiple_total_monthly_income
  @MADLRVP-9112
  Scenario: [MADLRVP-9112] Verify LSFM HTML - Multiple Total Monthly Income section
    Given the request XML filepath is /ript/non_fcra/lsfm/html/MADLRVP-9112.xml
    When the request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with TEXT content
      | XPath                                              | expected              |
      | //a[@onclick="toggleSection('OtherBorrowers');"]/b | Other Borrowers / SSN |
    And multiple HTML elements by xpath match regex
      | XPath                                                             | expected              |
      | //div[@id='OtherBorrowers']//td[not(@class)][position() < last()] | Borrower \d{1,2} SSN  |
      | //div[@id='OtherBorrowers']//td[@class='divider']                 | \w+, \w+ XXX-XX-\d{4} |
      | //div[@id='OtherBorrowers']//td[not(@class)][last()]              | \w+, \w+ XXX-XX-\d{4} |