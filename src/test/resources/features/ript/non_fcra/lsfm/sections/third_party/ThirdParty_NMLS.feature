@api
@non_fcra
@lsfm
@section
@third_party
@nmls
Feature: LSFM - Third Party - NMLS

  @MADLRVP-13360
  Scenario: [MADLRVP-13360] LSFM - Validate NMLS search will return with Temporary Authority status and date
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/third_party/MADLRVP-13360.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ThirdPartySection/NMLSDetail//NMLSStateLicenses/NMLSStateLicense |
    And the response has xpath
      | XPath                             | expected            |
      | //NMLSStateLicense/@licenseNumber | [empty]             |
      | //NMLSStateLicense/@regulator     | CA                  |
      | //NMLSStateLicense/@status        | TEMPORARY AUTHORITY |
      | //NMLSStateLicense/@date          | 12/14/2021          |

  @MADLRVP-13361
  Scenario: [MADLRVP-13361] LSFM - Validate NMLS search will return with state license approve status
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/third_party/MADLRVP-13361.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ThirdPartySection/NMLSDetail//NMLSSearchResult         |
      | //NMLSSearchResult[@searchCriteria='283485']             |
      | //NMLSSearchResult[@searchCriteria='Vincent SanFilippo'] |
    And the response has xpath
      | XPath                                                                | expected   |
      | //NMLSSearchResult[@searchCriteria='283485']/@searchedBy             | NMLS ID    |
      | //NMLSSearchResult[@searchCriteria='Vincent SanFilippo']/@searchedBy | Originator |
      | //NMLSStateLicense/@licenseNumber                                    | 871898296  |
      | //NMLSStateLicense/@regulator                                        | CA         |
      | //NMLSStateLicense/@status                                           | APPROVED   |
      | //NMLSStateLicense/@date                                             | 04/14/2020 |

  @MADLRVP-13363
  Scenario: [MADLRVP-13363] LSFM - Validate NMLS search will return with No Federal Registration Found
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/third_party/MADLRVP-13363.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ThirdPartySection/NMLSDetail//NMLSRecord[@nmlsId='868435644'] |
    And the response has xpath
      | XPath                                             | expected                      |
      | //NMLSRecord[@nmlsId='868435644']/@name           | VINCENT MARC SANFILIPPO       |
      | //NMLSRecord[@nmlsId='868435644']/@federalMessage | NO FEDERAL REGISTRATION FOUND |

  @MADLRVP-13364
  Scenario: [MADLRVP-13364] LSFM - Validate NMLS search will return with No license filtered state and no federal registration found
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/third_party/MADLRVP-13364.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ThirdPartySection/NMLSDetail//NMLSRecord[@nmlsId='868710629'] |
    And the response has xpath
      | XPath                                                 | expected                         |
      | //NMLSRecord[@nmlsId='868710629']/@name               | MAX ALEXANDER MARTINEZ           |
      | //NMLSRecord[@nmlsId='868710629']/@message            | NO LICENSE IN FILTERED STATE     |
      | //NMLSRecord[@nmlsId='868710629']/@federalMessage     | NO FEDERAL REGISTRATION FOUND    |
      | //NMLSRecord[@nmlsId='868710629']/Address/@streetAddr | 800 S. BARRANCA AVENUE SUITE 210 |
      | //NMLSRecord[@nmlsId='868710629']/Address/@state      | CA                               |
      | //NMLSRecord[@nmlsId='868710629']/Address/@city       | COVINA                           |
      | //NMLSRecord[@nmlsId='868710629']/Address/@zip        | 91723                            |

  @MADLRVP-13365
  Scenario: [MADLRVP-13365] LSFM - Validate NMLS -individual search will return with expired state license
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/third_party/MADLRVP-13365.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ThirdPartySection/NMLSDetail//NMLSSearchResult |
      | //NMLSSearchResult[@searchCriteria='Sean Magee'] |
    And the response has xpath
      | XPath                                                        | expected   |
      | //NMLSSearchResult[@searchCriteria='Sean Magee']/@searchedBy | Originator |
      | //NMLSStateLicense/@licenseNumber                            | 871565364  |
      | //NMLSStateLicense/@regulator                                | IN         |
      | //NMLSStateLicense/@status                                   | EXPIRED    |
      | //NMLSStateLicense/@date                                     | 02/01/2019 |

  @MADLRVP-13366
  Scenario: [MADLRVP-13366] LSFM - Validate NMLS search returned match individual with Inactive Federal Registration
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/third_party/MADLRVP-13366.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ThirdPartySection/NMLSDetail//NMLSFederalLicenses/NMLSFederalLicense |
    And the response has xpath
      | XPath                               | expected                                         |
      | //NMLSFederalLicense/@companyNmlsId | 868332968                                        |
      | //NMLSFederalLicense/@companyName   | FIRST SAVINGS BANK                               |
      | //NMLSFederalLicense/@employer      | FIRST SAVINGS BANK                               |
      | //NMLSFederalLicense/@regulator     | BOARD OF GOVERNORS OF THE FEDERAL RESERVE SYSTEM |
      | //NMLSFederalLicense/@tla           | FEDERAL RESERVE                                  |
      | //NMLSFederalLicense/@startDate     | 2018-09-19-07:00                                 |
      | //NMLSFederalLicense/@endDate       | 2021-01-28-08:00                                 |
      | //NMLSFederalLicense/@active        | false                                            |

  @MADLRVP-13367
  Scenario: [MADLRVP-13367] LSFM - Validate NMLS search returned a match ID with Active Federal Registration
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/third_party/MADLRVP-13367.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ThirdPartySection/NMLSDetail/NMLSSearchResult                        |
      | //ThirdPartySection/NMLSDetail//NMLSFederalLicenses/NMLSFederalLicense |
    And the response has xpath
      | XPath                               | expected                              |
      | //NMLSSearchResult/@searchCriteria  | 869369487                             |
      | //NMLSSearchResult/@searchedBy      | NMLS ID                               |
      | //NMLSFederalLicense/@companyNmlsId | 868333194                             |
      | //NMLSFederalLicense/@companyName   | MERIDIAN TRUST FEDERAL CREDIT UNION   |
      | //NMLSFederalLicense/@employer      | WESTERN HERITAGE FEDERAL CREDIT UNION |
      | //NMLSFederalLicense/@regulator     | NATIONAL CREDIT UNION ADMINISTRATION  |
      | //NMLSFederalLicense/@tla           | NCUA                                  |
      | //NMLSFederalLicense/@startDate     | 2015-08-17-07:00                      |
      | //NMLSFederalLicense/@active        | true                                  |

  @MADLRVP-13563
  Scenario: [MADLRVP-13563] LSFM - Validate NMLS search returned a match ID with Active Federal Registration
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/third_party/MADLRVP-13563.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //NMLSStateLicense[@status='APPROVED']                  |
      | //NMLSStateLicense[@status='TEMPORARY AUTHORITY ENDED'] |
      | //Category/Flagged/Alert[@Id='NMLS_001']                |
      | //Category/NotFlagged/Alert[@Id='NMLS_003']             |
      | //Category/NotFlagged/Alert[@Id='NMLS_007']             |
    And the response has xpath
      | XPath                           | expected |
      | //Alert[@Id='NMLS_001']/@Active | 1        |
      | //Alert[@Id='NMLS_001']/@Status | Y        |
      | //Alert[@Id='NMLS_003']/@Active | 1        |
      | //Alert[@Id='NMLS_003']/@Status | N        |
      | //Alert[@Id='NMLS_007']/@Active | 1        |
      | //Alert[@Id='NMLS_007']/@Status | N        |

  @MADLRVP-13566
  Scenario: [MADLRVP-13566] LSFM - Verify WAT alert is fired when the state of the individual matches the state of the tied company
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/third_party/MADLRVP-13566.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category/Flagged/Alert[@Id='WAT_019'] |
      | //Category/Flagged/Alert[@Id='WAT_021'] |
    And the response has xpath
      | XPath                          | expected |
      | //Alert[@Id='WAT_019']/@Active | 1        |
      | //Alert[@Id='WAT_019']/@Status | Y        |
      | //Alert[@Id='WAT_021']/@Active | 1        |
      | //Alert[@Id='WAT_021']/@Status | Y        |

  @MADLRVP-13567
  Scenario: [MADLRVP-13567] LSFM - Verify WAT alert is NOT fired when the state of the individual DOES NOT match the state of the tied company
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/third_party/MADLRVP-13567.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category/NotFlagged/Alert[@Id='WAT_019'] |
      | //Category/NotFlagged/Alert[@Id='WAT_021'] |
    And the response has xpath
      | XPath                          | expected |
      | //Alert[@Id='WAT_019']/@Active | 1        |
      | //Alert[@Id='WAT_019']/@Status | N        |
      | //Alert[@Id='WAT_021']/@Active | 1        |
      | //Alert[@Id='WAT_021']/@Status | N        |
