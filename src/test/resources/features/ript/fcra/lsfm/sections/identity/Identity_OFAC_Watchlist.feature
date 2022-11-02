@api
@fcra
@lsfm
@section
@identity
@ofac_watchlist
Feature: LSFM FCRA - Identity Section - OFAC Watchlist

  @MADLRVP-10429
  Scenario Outline: [MADLRVP-10429] Verify LSFM 4.1 FCRA - response when birth_dt in the watchlist table of miscdata is NOT null
    Given the request XML filepath is /ript/fcra/lsfm/sections/identity/MADLRVP-10429.xml
    When the LSFM FCRA request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //DerogatoryMatch[@dateOfBirth='<dob>'] |
    And the response has xpath
      | XPath                                                              | expected          |
      | //DerogatoryMatch[@dateOfBirth='<dob>']/@borrowerAkaMatch          | false             |
      | //DerogatoryMatch[@dateOfBirth='<dob>']/@nicknameMatch             | false             |
      | //DerogatoryMatch[@dateOfBirth='<dob>']/@matchScore                | 1.0               |
      | //DerogatoryMatch[@dateOfBirth='<dob>']/@reversed                  | false             |
      | //DerogatoryMatch[@dateOfBirth='<dob>']/@actorType                 | Loan Actor        |
      | //DerogatoryMatch[@dateOfBirth='<dob>']/@category                  | SDN               |
      | //DerogatoryMatch[@dateOfBirth='<dob>']/@matchType                 | Full Name         |
      | //DerogatoryMatch[@dateOfBirth='<dob>']/@nameMatched               | true              |
      | //DerogatoryMatch[@dateOfBirth='<dob>']/@role                      | ACCOUNT MANAGER   |
      | //DerogatoryMatch[@dateOfBirth='<dob>']/@source                    | OFAC              |
      | //DerogatoryMatch[@dateOfBirth='<dob>']/@entityId                  | 6703              |
      | //DerogatoryMatch[@dateOfBirth='<dob>']/@placeOfBirth              | Mexico            |
      | //DerogatoryMatch[@dateOfBirth='<dob>']/@remarks                   | [empty]           |
      | //DerogatoryMatch[@dateOfBirth='<dob>']/@title                     | [empty]           |
      | //DerogatoryMatch[@dateOfBirth='<dob>']//IdentityName/@firstName   | JOSE DE JESUS     |
      | //DerogatoryMatch[@dateOfBirth='<dob>']//IdentityName/@middleName  | [empty]           |
      | //DerogatoryMatch[@dateOfBirth='<dob>']//IdentityName/@lastName    | AMEZCUA CONTRERAS |
      | //DerogatoryMatch[@dateOfBirth='<dob>']//IdentityName/@suffix      | [empty]           |
      | //DerogatoryMatch[@dateOfBirth='<dob>']//IdentityName/@companyName | [empty]           |

    Examples:
      | dob              |
      | 1964-07-31-07:00 |

  @MADLRVP-13589
  Scenario: [MADLRVP-13589] Verify LSFM 4.1 FCRA - OFAC: WAT_013 is fired
    Given the request XML filepath is /ript/fcra/lsfm/sections/identity/MADLRVP-13589.xml
    When the LSFM FCRA request is sent
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
