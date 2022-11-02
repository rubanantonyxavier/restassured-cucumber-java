@api
@non_fcra
@lsfm
@section
@third_party
@license
Feature: LSFM - Third Party - License

  @MADLRVP-16040
  Scenario Outline: [MADLRVP-16040] Verify LSFM - Search is performed only by license number
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/third_party/MADLRVP-16040.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //ThirdPartySection/AppraiserSearchResults/AppraiserResult/LicenseSearchResults/Appraiser[@firstName='<firstName>'] |
    And the response has xpath
      | XPath                                                     | expected              |
      | //Appraiser[@firstName='<firstName>']/@middleName         | M                     |
      | //Appraiser[@firstName='<firstName>']/@lastName           | FREITAG               |
      | //Appraiser[@firstName='<firstName>']/@appraiser_id       | 330872                |
      | //Appraiser[@firstName='<firstName>']/@license            | 1703012               |
      | //Appraiser[@firstName='<firstName>']/@licenseState       | WA                    |
      | //Appraiser[@firstName='<firstName>']/@licenseType        | CERTIFIED RESIDENTIAL |
      | //Appraiser[@firstName='<firstName>']/@status             | A                     |
      | //Appraiser[@firstName='<firstName>']/@policyExpDate      | [NOT EMPTY]           |
      | //Appraiser[@firstName='<firstName>']/Address/@address    | <address>             |
      | //Appraiser[@firstName='<firstName>']/Address/@streetName | <address>             |
      | //Appraiser[@firstName='<firstName>']/Address/@city       | BOTHELL               |
      | //Appraiser[@firstName='<firstName>']/Address/@state      | WA                    |
      | //Appraiser[@firstName='<firstName>']/Address/@zip        | 98012                 |

    @qa_only
    Examples:
      | firstName | address          |
      | SHAWN     | 17833 25TH DR SE |

    @uat_only
    Examples:
      | firstName | address             |
      | SHAWN     | 17833 25th DRIVE SE |