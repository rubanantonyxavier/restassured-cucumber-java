@api
@fcra
@lsrm
@section
@income
@mrbs
Feature: LSRM FCRA - Income Detail Section - MRBS

  @MADLRVP-10417
  Scenario Outline: [MADLRVP-10417] Verify LSRM FCRA - INC_006 fires and MRB is found when the address contains only state
    Given the request XML filepath is /ript/fcra/lsrm/sections/income/MADLRVP-10417.xml
    When the LSRM FCRA request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category[@Name='INCOME'][@Heading='INCOME EMPLOYMENT']        |
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='<alert_id>']      |
      | //ReportInput/LSRMRequest//Borrower/Employment/Employer/Address |
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

  @MADLRVP-10420
  Scenario Outline: [MADLRVP-10420] Verify LSRM FCRA - INC_006 fires and MRB is found when address contains CORRECT state and WRONG city
    Given the request XML filepath is /ript/fcra/lsrm/sections/income/MADLRVP-10420.xml
    When the LSRM FCRA request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category[@Name='INCOME'][@Heading='INCOME EMPLOYMENT']        |
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='<alert_id>']      |
      | //ReportInput/LSRMRequest//Borrower/Employment/Employer/Address |
    And the response has xpath
      | XPath                                         | expected      |
      | //Alert[@Id='<alert_id>']/@Active             | 1             |
      | //Alert[@Id='<alert_id>']/@Status             | Y             |
      | //Borrower/Employment/Employer/Address/@zip   | 100000        |
      | //Borrower/Employment/Employer/Address/@city  | Wesley Chapel |
      | //Borrower/Employment/Employer/Address/@state | FL            |

    Examples:
      | alert_id |
      | INC_006  |
   