@api
@fcra
@lsfm
@section
@third_party
@license
Feature: LSFM FCRA - Third Party - License

  @MADLRVP-14156
  Scenario: [MADLRVP-14156] Verify LSFM FCRA - Appraiser Search with State License and Other States
    Given the request XML filepath is /ript/fcra/lsfm/sections/third_party/MADLRVP-14156.xml
    When the LSFM FCRA request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ThirdPartySection/AppraiserSearchResults/AppraiserResult/LicenseSearchResults/Appraiser[@license='7015102-CR00']      |
      | //ThirdPartySection/AppraiserSearchResults/AppraiserResult/OtherStateSearchResults/Appraiser[@license='CR000040027285'] |
      | //ThirdPartySection/AppraiserSearchResults/AppraiserResult/OtherStateSearchResults/Appraiser[@license='AL000040027285'] |
      | //ThirdPartySection/AppraiserSearchResults/AppraiserResult/OtherStateSearchResults/Appraiser[@license='AL40027285']     |
      | //ThirdPartySection/AppraiserSearchResults/AppraiserResult/OtherStateSearchResults/Appraiser[@license='CR40027285']     |
      | //ThirdPartySection/AppraiserSearchResults/AppraiserResult/OtherStateSearchResults/Appraiser[@license='CRA-3016']       |
    And the response has xpath
      | XPath                                                | expected |
      | //Appraiser[@license='7015102-CR00']/@licenseState   | UT       |
      | //Appraiser[@license='CR000040027285']/@licenseState | CO       |
      | //Appraiser[@license='AL000040027285']/@licenseState | CO       |
      | //Appraiser[@license='AL40027285']/@licenseState     | CO       |
      | //Appraiser[@license='CR40027285']/@licenseState     | CO       |
      | //Appraiser[@license='CRA-3016']/@licenseState       | ID       |
