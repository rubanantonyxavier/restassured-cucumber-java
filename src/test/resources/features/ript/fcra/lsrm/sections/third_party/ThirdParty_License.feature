@api
@fcra
@lsrm
@section
@third_party
@license
Feature: LSRM FCRA - Third Party - License

  @MADLRVP-14157
  Scenario Outline: [MADLRVP-14157] Verify LSRM FCRA - APPRAISER LICENSING SEARCH RESULTS section
    Given the request XML filepath is /ript/fcra/lsrm/sections/third_party/MADLRVP-14157.xml
    When the LSRM FCRA request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //ThirdPartySection/AppraiserSearchResults/AppraiserResult/LicenseSearchResults/Appraiser[@firstName='SHAWN'] |
    And the response has xpath
      | XPath                                               | expected              |
      | //Appraiser[@firstName='SHAWN']/@middleName         | M                     |
      | //Appraiser[@firstName='SHAWN']/@lastName           | FREITAG               |
      | //Appraiser[@firstName='SHAWN']/@appraiser_id       | 330872                |
      | //Appraiser[@firstName='SHAWN']/@license            | 1703012               |
      | //Appraiser[@firstName='SHAWN']/@licenseState       | WA                    |
      | //Appraiser[@firstName='SHAWN']/@licenseType        | CERTIFIED RESIDENTIAL |
      | //Appraiser[@firstName='SHAWN']/@status             | A                     |
      | //Appraiser[@firstName='SHAWN']/@policyExpDate      | [NOT EMPTY]           |
      | //Appraiser[@firstName='SHAWN']/Address/@address    | <address>             |
      | //Appraiser[@firstName='SHAWN']/Address/@streetName | <streetname>          |
      | //Appraiser[@firstName='SHAWN']/Address/@city       | BOTHELL               |
      | //Appraiser[@firstName='SHAWN']/Address/@state      | WA                    |
      | //Appraiser[@firstName='SHAWN']/Address/@zip        | 98012                 |


    @qa_only
    Examples:
      | address          | streetname       |
      | 17833 25TH DR SE | 17833 25TH DR SE |

    @uat_only
    Examples:
      | address             | streetname          |
      | 17833 25th DRIVE SE | 17833 25th DRIVE SE |
