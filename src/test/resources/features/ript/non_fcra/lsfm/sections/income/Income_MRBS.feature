@api
@non_fcra
@lsfm
@section
@income
@mrbs
Feature: LSFM - Income Detail Section - MRBS

  @MADLRVP-10410
  Scenario Outline: [MADLRVP-10410] Verify LSFM - INC_006 fires and MRB is found when the address contains only state
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/income/MADLRVP-10410.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='INCOME'][@Heading='INCOME EMPLOYMENT']       |
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='<alert_id>']     |
      | //ReportInput/LSFMRequest/Borrower/Employment/Employer/Address |
    And the response has xpath
      | XPath                                         | expected |
      | //Alert[@Id='<alert_id>']/@Active             | 1        |
      | //Alert[@Id='<alert_id>']/@Status             | Y        |
      | //Borrower/Employment/Employer/Address/@zip   | [empty]  |
      | //Borrower/Employment/Employer/Address/@city  | [empty]  |
      | //Borrower/Employment/Employer/Address/@state | CA       |

    Examples:
      | alert_id |
      | INC_006  |

  @MADLRVP-10414
  Scenario Outline: [MADLRVP-10414] Verify LSFM - INC_006 fires and MRB is found when the address contains RIGHT state and WRONG zip
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/income/MADLRVP-10414.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='INCOME'][@Heading='INCOME EMPLOYMENT']       |
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='<alert_id>']     |
      | //ReportInput/LSFMRequest/Borrower/Employment/Employer/Address |
    And the response has xpath
      | XPath                                         | expected      |
      | //Alert[@Id='<alert_id>']/@Active             | 1             |
      | //Alert[@Id='<alert_id>']/@Status             | Y             |
      | //Borrower/Employment/Employer/Address/@zip   | 33532         |
      | //Borrower/Employment/Employer/Address/@city  | Wesley Chapel |
      | //Borrower/Employment/Employer/Address/@state | FL            |

    Examples:
      | alert_id |
      | INC_006  |

  @MADLRVP-10415
  Scenario Outline: [MADLRVP-10415] Verify LSFM - INC_006 fires and MRB is found with 2 addresses containing only state
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/income/MADLRVP-10415.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='INCOME'][@Heading='INCOME EMPLOYMENT']                     |
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='<alert_id>'][1]                |
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='<alert_id>'][2]                |
      | //ReportInput/LSFMRequest/Borrower[@brwrNum='0']/Employment/Employer/Address |
      | //ReportInput/LSFMRequest/Borrower[@brwrNum='1']/Employment/Employer/Address |
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

  @MADLRVP-10422
  Scenario Outline: [MADLRVP-10422] Verify LSFM - INC_006 fires and the MRB is found with the full address
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/income/MADLRVP-10422.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='INCOME'][@Heading='INCOME EMPLOYMENT']       |
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='<alert_id>']     |
      | //ReportInput/LSFMRequest/Borrower/Employment/Employer/Address |
    And the response has xpath
      | XPath                                         | expected  |
      | //Alert[@Id='<alert_id>']/@Active             | 1         |
      | //Alert[@Id='<alert_id>']/@Status             | Y         |
      | //Borrower/Employment/Employer/Address/@zip   | 92581     |
      | //Borrower/Employment/Employer/Address/@city  | Santa Ana |
      | //Borrower/Employment/Employer/Address/@state | CA        |

    Examples:
      | alert_id |
      | INC_006  |