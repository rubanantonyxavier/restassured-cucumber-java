@api
@non_fcra
@lsrm
@section
@income
@mrbs
Feature: LSRM - Income Detail Section - MRBS

  @MADLRVP-10416
  Scenario Outline: [MADLRVP-10416] Verify LSRM - INC_006 fires and MRB is found when the address contains CORRECT state and WRONG zip
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/income/MADLRVP-10416.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category[@Name='INCOME'][@Heading='INCOME EMPLOYMENT']        |
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='<alert_id>']      |
      | //ReportInput/LSRMRequest//Borrower/Employment/Employer/Address |
    And the response has xpath
      | XPath                                         | expected  |
      | //Alert[@Id='<alert_id>']/@Active             | 1         |
      | //Alert[@Id='<alert_id>']/@Status             | Y         |
      | //Borrower/Employment/Employer/Address/@zip   | [empty]   |
      | //Borrower/Employment/Employer/Address/@city  | Las Vegas |
      | //Borrower/Employment/Employer/Address/@state | FL        |

    Examples:
      | alert_id |
      | INC_006  |

  @MADLRVP-10421
  Scenario Outline: [MADLRVP-10421] Verify LSRM - INC_006 fires and MRB is found with 2 addresses containing only state
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/income/MADLRVP-10421.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category[@Name='INCOME'][@Heading='INCOME EMPLOYMENT']                      |
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='<alert_id>'][1]                 |
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='<alert_id>'][2]                 |
      | //ReportInput/LSRMRequest//Borrower[@brwrNum='0']/Employment/Employer/Address |
      | //ReportInput/LSRMRequest//Borrower[@brwrNum='1']/Employment/Employer/Address |
    And the response has xpath
      | XPath                                                       | expected |
      | //Alert[@Id='<alert_id>'][1]/@Active                        | 1        |
      | //Alert[@Id='<alert_id>'][1]/@Status                        | Y        |
      | //Alert[@Id='<alert_id>'][2]/@Active                        | 1        |
      | //Alert[@Id='<alert_id>'][2]/@Status                        | Y        |
      | //Borrower[@brwrNum='0']/Employment/Employer/Address/@zip   | [empty]  |
      | //Borrower[@brwrNum='0']/Employment/Employer/Address/@city  | [empty]  |
      | //Borrower[@brwrNum='0']/Employment/Employer/Address/@state | CA       |
      | //Borrower[@brwrNum='1']/Employment/Employer/Address/@zip   | [empty]  |
      | //Borrower[@brwrNum='1']/Employment/Employer/Address/@city  | [empty]  |
      | //Borrower[@brwrNum='1']/Employment/Employer/Address/@state | CA       |

    Examples:
      | alert_id |
      | INC_006  |

  @MADLRVP-10423
  Scenario Outline: [MADLRVP-10423] Verify LSRM - INC_006 fires and the MRB is found with the full address
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/income/MADLRVP-10423.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category[@Name='INCOME'][@Heading='INCOME EMPLOYMENT']        |
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='<alert_id>']      |
      | //ReportInput/LSRMRequest//Borrower/Employment/Employer/Address |
    And the response has xpath
      | XPath                                         | expected   |
      | //Alert[@Id='<alert_id>']/@Active             | 1          |
      | //Alert[@Id='<alert_id>']/@Status             | Y          |
      | //Borrower/Employment/Employer/Address/@zip   | 95825      |
      | //Borrower/Employment/Employer/Address/@city  | Sacramento |
      | //Borrower/Employment/Employer/Address/@state | CA         |

    Examples:
      | alert_id |
      | INC_006  |