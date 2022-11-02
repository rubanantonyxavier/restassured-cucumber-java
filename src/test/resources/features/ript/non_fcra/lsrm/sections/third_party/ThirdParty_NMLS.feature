@api
@non_fcra
@lsrm
@section
@third_party
@nmls
Feature: LSRM - Third Party - NMLS

  @MADLRVP-13482
  Scenario: [MADLRVP-13482] Verify LSRM - NMLS search returned state status as Temporary Authority
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/third_party/MADLRVP-13482.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //ThirdPartySection/NMLSDetail//NMLSStateLicenses/NMLSStateLicense |
    And the response has xpath
      | XPath                             | expected            |
      | //NMLSStateLicense/@licenseNumber | [empty]             |
      | //NMLSStateLicense/@regulator     | CA                  |
      | //NMLSStateLicense/@status        | TEMPORARY AUTHORITY |
      | //NMLSStateLicense/@date          | 12/14/2021          |

  @MADLRVP-13483
  Scenario: [MADLRVP-13483] Verify LSRM - NMLS search returned federal registration status as Active
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/third_party/MADLRVP-13483.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //ThirdPartySection/NMLSDetail/NMLSSearchResult                                         |
      | //ThirdPartySection/NMLSDetail/NMLSSearchResult//NMLSFederalLicenses/NMLSFederalLicense |
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

  @MADLRVP-13484
  Scenario: [MADLRVP-13484] Verify LSRM - NMLS search returned with No license filtered state and no federal registration found
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/third_party/MADLRVP-13484.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
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

  @MADLRVP-13485
  Scenario: [MADLRVP-13485] Verify LSRM - NMLS search will return with No Federal Registration Found
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/third_party/MADLRVP-13485.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //ThirdPartySection/NMLSDetail//NMLSRecord[@nmlsId='868435644'] |
    And the response has xpath
      | XPath                                             | expected                      |
      | //NMLSRecord[@nmlsId='868435644']/@name           | VINCENT MARC SANFILIPPO       |
      | //NMLSRecord[@nmlsId='868435644']/@federalMessage | NO FEDERAL REGISTRATION FOUND |

  @MADLRVP-13568
  Scenario: [MADLRVP-13568] Verify LSRM - Verify WAT alert is fired when the state of the individual matches the state of the tied company
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/third_party/MADLRVP-13568.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category/Flagged/Alert[@Id='WAT_019'] |
      | //Category/Flagged/Alert[@Id='WAT_021'] |
    And the response has xpath
      | XPath                          | expected |
      | //Alert[@Id='WAT_019']/@Active | 1        |
      | //Alert[@Id='WAT_019']/@Status | Y        |
      | //Alert[@Id='WAT_021']/@Active | 1        |
      | //Alert[@Id='WAT_021']/@Status | Y        |

  @MADLRVP-13569
  Scenario: [MADLRVP-13569] Verify LSRM - Verify WAT alert is NOT fired when the state of the individual DOES NOT match the state of the tied company
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/third_party/MADLRVP-13569.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category/NotFlagged/Alert[@Id='WAT_019'] |
      | //Category/NotFlagged/Alert[@Id='WAT_021'] |
    And the response has xpath
      | XPath                          | expected |
      | //Alert[@Id='WAT_019']/@Active | 1        |
      | //Alert[@Id='WAT_019']/@Status | N        |
      | //Alert[@Id='WAT_021']/@Active | 1        |
      | //Alert[@Id='WAT_021']/@Status | N        |

  @MADLRVP-13564
  Scenario: [MADLRVP-13564] Verify LSRM - Verify suppression of NMLS_003 and NMLS_007 when state license returns TEMPORARY AUTHORITY ENDED and APPROVED
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/third_party/MADLRVP-13564.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //NMLSStateLicense[@status='APPROVED']                  |
      | //NMLSStateLicense[@status='TEMPORARY AUTHORITY ENDED'] |
      | //Category/NotFlagged/Alert[@Id='NMLS_003']             |
      | //Category/NotFlagged/Alert[@Id='NMLS_007']             |
    And the response has xpath
      | XPath                           | expected |
      | //Alert[@Id='NMLS_003']/@Active | 1        |
      | //Alert[@Id='NMLS_003']/@Status | N        |
      | //Alert[@Id='NMLS_007']/@Active | 1        |
      | //Alert[@Id='NMLS_007']/@Status | N        |
