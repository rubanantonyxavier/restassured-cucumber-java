@api
@fcra
@lsrm
@section
@identity
@ofac_watchlist
Feature: LSRM - Identity Section - OFAC Watchlist

  @MADLRVP-10426
  Scenario Outline: [MADLRVP-10426] Verify LSRM 4.1 FCRA - response when birth_dt in the watchlist table of miscdata is null - multiple entries match condition
    Given the request XML filepath is /ript/fcra/lsrm/sections/identity/MADLRVP-10426.xml
    When the LSRM FCRA request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //DerogatoryMatch[@dateOfBirthText='<dob_1>'] |
      | //DerogatoryMatch[@dateOfBirthText='<dob_2>'] |
      | //DerogatoryMatch[@dateOfBirthText='<dob_3>'] |
    And the response has xpath
      | XPath                                                                    | expected                                |
#  dateOfBirthText='1951'
      | //DerogatoryMatch[@dateOfBirthText='<dob_1>']/@borrowerAkaMatch          | false                                   |
      | //DerogatoryMatch[@dateOfBirthText='<dob_1>']/@nicknameMatch             | false                                   |
      | //DerogatoryMatch[@dateOfBirthText='<dob_1>']/@matchScore                | 1.0                                     |
      | //DerogatoryMatch[@dateOfBirthText='<dob_1>']/@reversed                  | false                                   |
      | //DerogatoryMatch[@dateOfBirthText='<dob_1>']/@actorType                 | Loan Actor                              |
      | //DerogatoryMatch[@dateOfBirthText='<dob_1>']/@category                  | CON-NS-PLC                              |
      | //DerogatoryMatch[@dateOfBirthText='<dob_1>']/@matchType                 | Full Name                               |
      | //DerogatoryMatch[@dateOfBirthText='<dob_1>']/@nameMatched               | true                                    |
      | //DerogatoryMatch[@dateOfBirthText='<dob_1>']/@role                      | UNDERWRITER                             |
      | //DerogatoryMatch[@dateOfBirthText='<dob_1>']/@source                    | OFAC                                    |
      | //DerogatoryMatch[@dateOfBirthText='<dob_1>']/@entityId                  | 9640                                    |
      | //DerogatoryMatch[@dateOfBirthText='<dob_1>']/@placeOfBirth              | Umm Tuba                                |
      | //DerogatoryMatch[@dateOfBirthText='<dob_1>']/@remarks                   | [empty]                                 |
      | //DerogatoryMatch[@dateOfBirthText='<dob_1>']/@title                     | [empty]                                 |
      | //DerogatoryMatch[@dateOfBirthText='<dob_1>']//IdentityName/@firstName   | MOHAMMED                                |
      | //DerogatoryMatch[@dateOfBirthText='<dob_1>']//IdentityName/@middleName  | [empty]                                 |
      | //DerogatoryMatch[@dateOfBirthText='<dob_1>']//IdentityName/@lastName    | ABU TEIR                                |
      | //DerogatoryMatch[@dateOfBirthText='<dob_1>']//IdentityName/@suffix      | [empty]                                 |
      | //DerogatoryMatch[@dateOfBirthText='<dob_1>']//IdentityName/@companyName | [empty]                                 |
#  dateOfBirthText='1938 / 1936'
      | //DerogatoryMatch[@dateOfBirthText='<dob_2>']/@borrowerAkaMatch          | false                                   |
      | //DerogatoryMatch[@dateOfBirthText='<dob_2>']/@nicknameMatch             | false                                   |
      | //DerogatoryMatch[@dateOfBirthText='<dob_2>']/@matchScore                | 1.0                                     |
      | //DerogatoryMatch[@dateOfBirthText='<dob_2>']/@reversed                  | false                                   |
      | //DerogatoryMatch[@dateOfBirthText='<dob_2>']/@actorType                 | Loan Actor                              |
      | //DerogatoryMatch[@dateOfBirthText='<dob_2>']/@category                  | SDN                                     |
      | //DerogatoryMatch[@dateOfBirthText='<dob_2>']/@matchType                 | Full Name                               |
      | //DerogatoryMatch[@dateOfBirthText='<dob_2>']/@nameMatched               | true                                    |
      | //DerogatoryMatch[@dateOfBirthText='<dob_2>']/@role                      | PROCESSOR                               |
      | //DerogatoryMatch[@dateOfBirthText='<dob_2>']/@source                    | OFAC                                    |
      | //DerogatoryMatch[@dateOfBirthText='<dob_2>']/@entityId                  | 2679                                    |
      | //DerogatoryMatch[@dateOfBirthText='<dob_2>']/@placeOfBirth              | Najf Al Ashraf (Najaf), Iraq            |
      | //DerogatoryMatch[@dateOfBirthText='<dob_2>']/@remarks                   | [empty]                                 |
      | //DerogatoryMatch[@dateOfBirthText='<dob_2>']/@title                     | LEADING IDEOLOGICAL FIGURE OF HIZBALLAH |
      | //DerogatoryMatch[@dateOfBirthText='<dob_2>']//IdentityName/@firstName   | SHAYKH MUHAMMAD HUSAYN                  |
      | //DerogatoryMatch[@dateOfBirthText='<dob_2>']//IdentityName/@middleName  | [empty]                                 |
      | //DerogatoryMatch[@dateOfBirthText='<dob_2>']//IdentityName/@lastName    | FADLALLAH                               |
      | //DerogatoryMatch[@dateOfBirthText='<dob_2>']//IdentityName/@suffix      | [empty]                                 |
      | //DerogatoryMatch[@dateOfBirthText='<dob_2>']//IdentityName/@companyName | [empty]                                 |
#  dateOfBirthText='1947'
      | //DerogatoryMatch[@dateOfBirthText='<dob_3>']/@borrowerAkaMatch          | false                                   |
      | //DerogatoryMatch[@dateOfBirthText='<dob_3>']/@nicknameMatch             | false                                   |
      | //DerogatoryMatch[@dateOfBirthText='<dob_3>']/@matchScore                | 1.0                                     |
      | //DerogatoryMatch[@dateOfBirthText='<dob_3>']/@reversed                  | false                                   |
      | //DerogatoryMatch[@dateOfBirthText='<dob_3>']/@actorType                 | Loan Actor                              |
      | //DerogatoryMatch[@dateOfBirthText='<dob_3>']/@category                  | SDN                                     |
      | //DerogatoryMatch[@dateOfBirthText='<dob_3>']/@matchType                 | Full Name                               |
      | //DerogatoryMatch[@dateOfBirthText='<dob_3>']/@nameMatched               | true                                    |
      | //DerogatoryMatch[@dateOfBirthText='<dob_3>']/@role                      | settlementagent                         |
      | //DerogatoryMatch[@dateOfBirthText='<dob_3>']/@source                    | OFAC                                    |
      | //DerogatoryMatch[@dateOfBirthText='<dob_3>']/@entityId                  | 6945                                    |
      | //DerogatoryMatch[@dateOfBirthText='<dob_3>']/@placeOfBirth              | [empty]                                 |
      | //DerogatoryMatch[@dateOfBirthText='<dob_3>']/@remarks                   | [empty]                                 |
      | //DerogatoryMatch[@dateOfBirthText='<dob_3>']/@title                     | [empty]                                 |
      | //DerogatoryMatch[@dateOfBirthText='<dob_3>']//IdentityName/@firstName   | Bilal                                   |
      | //DerogatoryMatch[@dateOfBirthText='<dob_3>']//IdentityName/@middleName  | [empty]                                 |
      | //DerogatoryMatch[@dateOfBirthText='<dob_3>']//IdentityName/@lastName    | BIN MARWAN                              |
      | //DerogatoryMatch[@dateOfBirthText='<dob_3>']//IdentityName/@suffix      | [empty]                                 |
      | //DerogatoryMatch[@dateOfBirthText='<dob_3>']//IdentityName/@companyName | [empty]                                 |
      | //DerogatoryMatch[@dateOfBirthText='<dob_3>']//InputAddress/@streetAddr  | [empty]                                 |
      | //DerogatoryMatch[@dateOfBirthText='<dob_3>']//InputAddress/@city        | Sacramento                              |
      | //DerogatoryMatch[@dateOfBirthText='<dob_3>']//InputAddress/@state       | TX                                      |
      | //DerogatoryMatch[@dateOfBirthText='<dob_3>']//InputAddress/@zip         | 95825                                   |


    Examples:
      | dob_1 | dob_2       | dob_3 |
      | 1951  | 1938 / 1936 | 1947  |

  @MADLRVP-13590
  Scenario: [MADLRVP-13590] Verify LSRM 3.4 FCRA OFAC: WAT_013 is fired
    Given the request XML filepath is /ript/fcra/lsrm/sections/identity/MADLRVP-13590.xml
    When the LSRM FCRA request is sent
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
