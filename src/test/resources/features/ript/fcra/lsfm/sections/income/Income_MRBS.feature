@api
@fcra
@lsfm
@section
@income
@mrbs
Feature: LSFM FCRA - Income Detail Section - MRBS

  @MADLRVP-10413
  Scenario Outline: [MADLRVP-10413] Verify LSFM FCRA - INC_006 fires and MRB is found when address contains RIGHT state and WRONG city
    Given the request XML filepath is /ript/fcra/lsfm/sections/income/MADLRVP-10413.xml
    When the LSFM FCRA request is sent
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
      | //Borrower/Employment/Employer/Address/@zip   | [empty]   |
      | //Borrower/Employment/Employer/Address/@city  | Las Wegas |
      | //Borrower/Employment/Employer/Address/@state | CA        |

    Examples:
      | alert_id |
      | INC_006  |
