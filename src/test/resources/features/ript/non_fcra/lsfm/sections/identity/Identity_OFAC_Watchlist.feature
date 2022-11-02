@api
@non_fcra
@lsfm
@section
@identity
@ofac_watchlist
Feature: LSFM - Identity Section - OFAC Watchlist

  @MADLRVP-10424
  Scenario: [MADLRVP-10424] Verify LSFM 4.0 - response when birth_dt in the watchlist table of miscdata is null - only one entry
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/identity/MADLRVP-10424.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response has xpath
      | XPath                                                                 | expected    |
      | //DerogatoryMatch[@dateOfBirthText='1951']/@borrowerAkaMatch          | false       |
      | //DerogatoryMatch[@dateOfBirthText='1951']/@nicknameMatch             | false       |
      | //DerogatoryMatch[@dateOfBirthText='1951']/@matchScore                | 1.0         |
      | //DerogatoryMatch[@dateOfBirthText='1951']/@reversed                  | false       |
      | //DerogatoryMatch[@dateOfBirthText='1951']/@actorType                 | Loan Actor  |
      | //DerogatoryMatch[@dateOfBirthText='1951']/@category                  | CON-NS-PLC  |
      | //DerogatoryMatch[@dateOfBirthText='1951']/@matchType                 | Full Name   |
      | //DerogatoryMatch[@dateOfBirthText='1951']/@nameMatched               | true        |
      | //DerogatoryMatch[@dateOfBirthText='1951']/@role                      | UNDERWRITER |
      | //DerogatoryMatch[@dateOfBirthText='1951']/@source                    | OFAC        |
      | //DerogatoryMatch[@dateOfBirthText='1951']/@entityId                  | 9640        |
      | //DerogatoryMatch[@dateOfBirthText='1951']/@placeOfBirth              | Umm Tuba    |
      | //DerogatoryMatch[@dateOfBirthText='1951']/@remarks                   | [empty]     |
      | //DerogatoryMatch[@dateOfBirthText='1951']/@title                     | [empty]     |
      | //DerogatoryMatch[@dateOfBirthText='1951']//IdentityName/@firstName   | MOHAMMED    |
      | //DerogatoryMatch[@dateOfBirthText='1951']//IdentityName/@middleName  | [empty]     |
      | //DerogatoryMatch[@dateOfBirthText='1951']//IdentityName/@lastName    | ABU TEIR    |
      | //DerogatoryMatch[@dateOfBirthText='1951']//IdentityName/@suffix      | [empty]     |
      | //DerogatoryMatch[@dateOfBirthText='1951']//IdentityName/@companyName | [empty]     |

  @MADLRVP-13570
  Scenario: [MADLRVP-13570] LSFM - Verify WAT_031 is fired when DOB (date of birth) of the borrower is missing from the request
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/identity/MADLRVP-13570.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category/Flagged/Alert[@Id='WAT_031'] |
    And the response has xpath
      | XPath                          | expected |
      | //Alert[@Id='WAT_031']/@Active | 1        |
      | //Alert[@Id='WAT_031']/@Status | Y        |

  @MADLRVP-13571
  Scenario: [MADLRVP-13571] LSFM - Verify WAT_031 is fired when DOB (date of birth) of the borrower is missing from the OFAC list
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/identity/MADLRVP-13571.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category/Flagged/Alert[@Id='WAT_031'] |
    And the response has xpath
      | XPath                          | expected |
      | //Alert[@Id='WAT_031']/@Active | 1        |
      | //Alert[@Id='WAT_031']/@Status | Y        |

  @MADLRVP-13587
  Scenario: [MADLRVP-13587] Verify LSFM - WAT_013 is fired for LSFM reversed names
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/identity/MADLRVP-13587.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category/Flagged/Alert[@Id='WAT_013']                  |
      | //SearchSummary/SearchSummaryStatus                      |
      | //DerogatoryLists/OFACList/DerogatoryMatch               |
      | //DerogatoryLists/OFACList/DerogatoryMatch//IdentityName |
      | //DerogatoryLists/OFACList/DerogatoryMatch//SearchName   |
      | //DerogatoryLists/OFACList/DerogatoryMatch//MatchName    |
    And the response has xpath
      | XPath                                       | expected          |
      | //Alert[@Id='WAT_013']/@Active              | 1                 |
      | //Alert[@Id='WAT_013']/@Status              | Y                 |
      | //SearchSummaryStatus/@actorName            | Abu, Abbas        |
      | //SearchSummaryStatus/@actorRoleText        | Borrower          |
      | //SearchSummaryStatus/@isSearchesPerformed  | true              |
      | //SearchSummaryStatus/ofac/@status          | attention         |
      | //SearchSummaryStatus/ofac/@link            | OFAC_SDN_DETAILS0 |
      | //DerogatoryMatch/@reversed                 | true              |
      | //DerogatoryMatch//IdentityName/@firstName  | Abbas             |
      | //DerogatoryMatch//IdentityName/@middleName | [empty]           |
      | //DerogatoryMatch//IdentityName/@lastName   | Abu               |
      | //DerogatoryMatch//SearchName/@firstName    | ABBAS             |
      | //DerogatoryMatch//SearchName/@middleName   | [empty]           |
      | //DerogatoryMatch//SearchName/@lastName     | ABU               |
      | //DerogatoryMatch//MatchName/@firstName     | ABU               |
      | //DerogatoryMatch//MatchName/@middleName    | [empty]           |
      | //DerogatoryMatch//MatchName/@lastName      | ABBAS             |

  @MADLRVP-13586
  Scenario: [MADLRVP-13586] Verify LSFM - OFAC: WAT_013 is fired
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/identity/MADLRVP-13586.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category/Flagged/Alert[@Id='WAT_013']    |
      | //SearchSummary/SearchSummaryStatus        |
      | //DerogatoryLists/OFACList/DerogatoryMatch |
    And the response has xpath
      | XPath                                       | expected                                           |
      | //Alert[@Id='WAT_013']/@Active              | 1                                                  |
      | //Alert[@Id='WAT_013']/@Status              | Y                                                  |
      | //SearchSummaryStatus/@actorName            | Abbas, Abu                                         |
      | //SearchSummaryStatus/@actorRoleText        | Borrower                                           |
      | //SearchSummaryStatus/@isSearchesPerformed  | true                                               |
      | //SearchSummaryStatus/ofac/@status          | attention                                          |
      | //SearchSummaryStatus/ofac/@link            | OFAC_SDN_DETAILS0                                  |
      | //DerogatoryMatch/@category                 | SDN                                                |
      | //DerogatoryMatch/@dateOfBirth              | 1948-12-10-07:00                                   |
      | //DerogatoryMatch/@entityId                 | 2674                                               |
      | //DerogatoryMatch/@title                    | DIRECTOR OF PALESTINE LIBERATION FRONT - ABU ABBAS |
      | //DerogatoryMatch//IdentityName/@firstName  | Abu                                                |
      | //DerogatoryMatch//IdentityName/@middleName | [empty]                                            |
      | //DerogatoryMatch//IdentityName/@lastName   | Abbas                                              |
