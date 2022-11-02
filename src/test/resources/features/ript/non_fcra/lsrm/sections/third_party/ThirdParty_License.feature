@api
@non_fcra
@lsrm
@section
@third_party
@license
Feature: LSRM - Third Party - License

  @MADLRVP-16041
  Scenario Outline: [MADLRVP-16041] Verify LSRM - License is found with all addresses where it is registered
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/third_party/MADLRVP-16041.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //ThirdPartySection/AppraiserSearchResults/AppraiserResult/LicenseSearchResults/Appraiser[@license='<license1>']    |
      | //ThirdPartySection/AppraiserSearchResults/AppraiserResult/OtherStateSearchResults/Appraiser[@license='<license2>'] |
      | //ThirdPartySection/AppraiserSearchResults/AppraiserResult/OtherStateSearchResults/Appraiser[@license='<license3>'] |
      | //ThirdPartySection/AppraiserSearchResults/AppraiserResult/OtherStateSearchResults/Appraiser[@license='<license4>'] |
      | //ThirdPartySection/AppraiserSearchResults/AppraiserResult/OtherStateSearchResults/Appraiser[@license='<license5>'] |
      | //ThirdPartySection/AppraiserSearchResults/AppraiserResult/OtherStateSearchResults/Appraiser[@license='<license6>'] |
    And the response has xpath
      | XPath                                                                          | expected              |
      | //LicenseSearchResults/Appraiser[@license='<license1>']/@firstName             | JOHN                  |
      | //LicenseSearchResults/Appraiser[@license='<license1>']/@middleName            | M                     |
      | //LicenseSearchResults/Appraiser[@license='<license1>']/@lastName              | DENNETT               |
      | //LicenseSearchResults/Appraiser[@license='<license1>']/@appraiser_id          | 291315                |
      | //LicenseSearchResults/Appraiser[@license='<license1>']/@licenseState          | UT                    |
      | //LicenseSearchResults/Appraiser[@license='<license1>']/@licenseType           | CERTIFIED RESIDENTIAL |
      | //LicenseSearchResults/Appraiser[@license='<license1>']/@status                | A                     |
      | //LicenseSearchResults/Appraiser[@license='<license1>']/@policyExpDate         | [NOT EMPTY]           |
      | //LicenseSearchResults/Appraiser[@license='<license1>']/Address/@address       | <address>             |
      | //LicenseSearchResults/Appraiser[@license='<license1>']/Address/@streetName    | <address>             |
      | //LicenseSearchResults/Appraiser[@license='<license1>']/Address/@city          | IDAHO FALLS           |
      | //LicenseSearchResults/Appraiser[@license='<license1>']/Address/@state         | ID                    |
      | //LicenseSearchResults/Appraiser[@license='<license1>']/Address/@zip           | 83406                 |
      | //OtherStateSearchResults/Appraiser[@license='<license2>']/@licenseState       | CO                    |
      | //OtherStateSearchResults/Appraiser[@license='<license2>']/@licenseType        | LICENSED              |
      | //OtherStateSearchResults/Appraiser[@license='<license2>']/@status             | I                     |
      | //OtherStateSearchResults/Appraiser[@license='<license2>']/@policyExpDate      | [NOT EMPTY]           |
      | //OtherStateSearchResults/Appraiser[@license='<license2>']/Address/@address    | 10691 TORRINGTON LN   |
      | //OtherStateSearchResults/Appraiser[@license='<license2>']/Address/@streetName | 10691 TORRINGTON LN   |
      | //OtherStateSearchResults/Appraiser[@license='<license2>']/Address/@city       | HIGHLANDS RANCH       |
      | //OtherStateSearchResults/Appraiser[@license='<license2>']/Address/@state      | CO                    |
      | //OtherStateSearchResults/Appraiser[@license='<license2>']/Address/@zip        | 80126                 |
      | //OtherStateSearchResults/Appraiser[@license='<license3>']/@licenseState       | CO                    |
      | //OtherStateSearchResults/Appraiser[@license='<license3>']/@licenseType        | LICENSED              |
      | //OtherStateSearchResults/Appraiser[@license='<license3>']/@status             | I                     |
      | //OtherStateSearchResults/Appraiser[@license='<license3>']/@policyExpDate      | [NOT EMPTY]           |
      | //OtherStateSearchResults/Appraiser[@license='<license3>']/Address/@address    | 10691 TORRINGTON LN   |
      | //OtherStateSearchResults/Appraiser[@license='<license3>']/Address/@streetName | 10691 TORRINGTON LN   |
      | //OtherStateSearchResults/Appraiser[@license='<license3>']/Address/@city       | HIGHLANDS RANCH       |
      | //OtherStateSearchResults/Appraiser[@license='<license3>']/Address/@state      | CO                    |
      | //OtherStateSearchResults/Appraiser[@license='<license3>']/Address/@zip        | 80126                 |
      | //OtherStateSearchResults/Appraiser[@license='<license4>']/@licenseState       | CO                    |
      | //OtherStateSearchResults/Appraiser[@license='<license4>']/@licenseType        | CERTIFIED RESIDENTIAL |
      | //OtherStateSearchResults/Appraiser[@license='<license4>']/@status             | I                     |
      | //OtherStateSearchResults/Appraiser[@license='<license4>']/@policyExpDate      | [NOT EMPTY]           |
      | //OtherStateSearchResults/Appraiser[@license='<license4>']/Address/@address    | 10691 TORRINGTON LN   |
      | //OtherStateSearchResults/Appraiser[@license='<license4>']/Address/@streetName | 10691 TORRINGTON LN   |
      | //OtherStateSearchResults/Appraiser[@license='<license4>']/Address/@city       | HIGHLANDS RANCH       |
      | //OtherStateSearchResults/Appraiser[@license='<license4>']/Address/@state      | CO                    |
      | //OtherStateSearchResults/Appraiser[@license='<license4>']/Address/@zip        | 80126                 |
      | //OtherStateSearchResults/Appraiser[@license='<license5>']/@licenseState       | CO                    |
      | //OtherStateSearchResults/Appraiser[@license='<license5>']/@licenseType        | CERTIFIED RESIDENTIAL |
      | //OtherStateSearchResults/Appraiser[@license='<license5>']/@status             | I                     |
      | //OtherStateSearchResults/Appraiser[@license='<license5>']/@policyExpDate      | [NOT EMPTY]           |
      | //OtherStateSearchResults/Appraiser[@license='<license5>']/Address/@address    | 10691 TORRINGTON LN   |
      | //OtherStateSearchResults/Appraiser[@license='<license5>']/Address/@streetName | 10691 TORRINGTON LN   |
      | //OtherStateSearchResults/Appraiser[@license='<license5>']/Address/@city       | HIGHLANDS RANCH       |
      | //OtherStateSearchResults/Appraiser[@license='<license5>']/Address/@state      | CO                    |
      | //OtherStateSearchResults/Appraiser[@license='<license5>']/Address/@zip        | 80126                 |
      | //OtherStateSearchResults/Appraiser[@license='<license6>']/@licenseState       | ID                    |
      | //OtherStateSearchResults/Appraiser[@license='<license6>']/@licenseType        | CERTIFIED RESIDENTIAL |
      | //OtherStateSearchResults/Appraiser[@license='<license6>']/@status             | A                     |
      | //OtherStateSearchResults/Appraiser[@license='<license6>']/@policyExpDate      | [NOT EMPTY]           |
      | //OtherStateSearchResults/Appraiser[@license='<license6>']/Address/@address    | <address>             |
      | //OtherStateSearchResults/Appraiser[@license='<license6>']/Address/@streetName | <address>             |
      | //OtherStateSearchResults/Appraiser[@license='<license6>']/Address/@city       | IDAHO FALLS           |
      | //OtherStateSearchResults/Appraiser[@license='<license6>']/Address/@state      | ID                    |
      | //OtherStateSearchResults/Appraiser[@license='<license6>']/Address/@zip        | 83406                 |

    @qa_only
    Examples:
      | license1     | license2       | license3   | license4   | license5       | license6 | address            |
      | 7015102-CR00 | AL000040027285 | AL40027285 | CR40027285 | CR000040027285 | CRA-3016 | 4769 E SAGEWOOD DR |

    @uat_only
    Examples:
      | license1     | license2       | license3   | license4   | license5       | license6 | address            |
      | 7015102-CR00 | AL000040027285 | AL40027285 | CR40027285 | CR000040027285 | CRA-3016 | 4725 E SAGEWOOD DR |

