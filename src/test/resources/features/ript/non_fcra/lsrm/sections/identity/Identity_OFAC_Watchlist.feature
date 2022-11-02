@api
@non_fcra
@lsrm
@section
@identity
@ofac_watchlist
Feature: LSRM - Identity Section - OFAC Watchlist

  @MADLRVP-10428
  Scenario: [MADLRVP-10428] Verify LSRM 4.0 - response when birth_dt in the watchlist table of miscdata is NOT null
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/identity/MADLRVP-10428.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //DerogatoryMatch[@dateOfBirth='1964-07-31-07:00'] |
    And the response has xpath
      | XPath                                                                       | expected          |
      | //DerogatoryMatch[@dateOfBirth='1964-07-31-07:00']/@source                  | OFAC              |
      | //DerogatoryMatch[@dateOfBirth='1964-07-31-07:00']//IdentityName/@firstName | JOSE DE JESUS     |
      | //DerogatoryMatch[@dateOfBirth='1964-07-31-07:00']//IdentityName/@lastName  | AMEZCUA CONTRERAS |

  @MADLRVP-13588
  Scenario: [MADLRVP-13588] Verify LSRM 3.4 OFAC: WAT_013 is fired
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/identity/MADLRVP-13588.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
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

  @MADLRVP-13572
  Scenario: [MADLRVP-13572] Verify LSRM - Verify WAT_031 is fired when DOB (date of birth) of the borrower is missing from the request
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/identity/MADLRVP-13572.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category/Flagged/Alert[@Id='WAT_031'] |
    And the response has xpath
      | XPath                          | expected |
      | //Alert[@Id='WAT_031']/@Active | 1        |
      | //Alert[@Id='WAT_031']/@Status | Y        |

  @MADLRVP-13573
  Scenario: [MADLRVP-13573] Verify LSRM - Verify WAT_031 is fired when DOB (date of birth) of the borrower is missing from the OFAC list
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/identity/MADLRVP-13573.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category/Flagged/Alert[@Id='WAT_031'] |
    And the response has xpath
      | XPath                          | expected |
      | //Alert[@Id='WAT_031']/@Active | 1        |
      | //Alert[@Id='WAT_031']/@Status | Y        |
