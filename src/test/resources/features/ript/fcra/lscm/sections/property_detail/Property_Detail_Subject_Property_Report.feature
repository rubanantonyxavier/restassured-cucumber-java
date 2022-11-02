@api
@fcra
@lscm
@section
@property_detail
@subject_property_report
Feature: LSCM FCRA - Property Detail Section - Subject Property Report

  @MADLRVP-14346
  Scenario: [MADLRVP-14346] Verify LSCM FCRA - HP_036 and HP_023 are suppressed when HP_007 fires
    Given the request XML filepath is /ript/fcra/lscm/sections/property_detail/MADLRVP-14346.xml
    When the LSCM FCRA request is sent
    Then response content type is XML
    And successful LSCM report is received
    And the response contains xpath
      | //Category/Flagged/Alert[@Id='HP_007']    |
      | //Category/NotFlagged/Alert[@Id='HP_023'] |
      | //Category/NotFlagged/Alert[@Id='HP_036'] |
    And the response has xpath
      | XPath                         | expected |
      | //Alert[@Id='HP_007']/@Status | Y        |
      | //Alert[@Id='HP_023']/@Status | N        |
      | //Alert[@Id='HP_036']/@Status | N        |

  @MADLRVP-14347
  Scenario: [MADLRVP-14347] Verify LSCM FCRA - HP_006 and HP_013 are suppressed when HP_007 fires
    Given the request XML filepath is /ript/fcra/lscm/sections/property_detail/MADLRVP-14347.xml
    When the LSCM FCRA request is sent
    Then response content type is XML
    And successful LSCM report is received
    And the response contains xpath
      | //Category/Flagged/Alert[@Id='HP_007']    |
      | //Category/NotFlagged/Alert[@Id='HP_006'] |
      | //Category/NotFlagged/Alert[@Id='HP_013'] |
    And the response has xpath
      | XPath                         | expected |
      | //Alert[@Id='HP_007']/@Status | Y        |
      | //Alert[@Id='HP_006']/@Status | N        |
      | //Alert[@Id='HP_013']/@Status | N        |

  @MADLRVP-14361
  Scenario: [MADLRVP-14361] Verify LSCM FCRA - The suppression of alerts if HP_007 is fired
    Given the request XML filepath is /ript/fcra/lscm/sections/property_detail/MADLRVP-14361.xml
    When the LSCM FCRA request is sent
    Then response content type is XML
    And successful LSCM report is received
    And the response contains xpath
      | //Category/Flagged/Alert[@Id='HP_007']    |
      | //Category/NotFlagged/Alert[@Id='HP_002'] |
      | //Category/NotFlagged/Alert[@Id='HP_003'] |
      | //Category/NotFlagged/Alert[@Id='HP_008'] |
      | //Category/NotFlagged/Alert[@Id='HP_029'] |
      | //Category/NotFlagged/Alert[@Id='HP_036'] |
      | //Category/NotFlagged/Alert[@Id='HP_037'] |
      | //Category/NotFlagged/Alert[@Id='LS_007'] |
      | //Category/NotFlagged/Alert[@Id='LS_011'] |
    And the response has xpath
      | XPath                         | expected |
      | //Alert[@Id='HP_007']/@Status | Y        |
      | //Alert[@Id='HP_007']/@Active | 1        |
      | //Alert[@Id='HP_002']/@Status | N        |
      | //Alert[@Id='HP_002']/@Active | 1        |
      | //Alert[@Id='HP_003']/@Status | N        |
      | //Alert[@Id='HP_003']/@Active | 1        |
      | //Alert[@Id='HP_008']/@Status | N        |
      | //Alert[@Id='HP_008']/@Active | 1        |
      | //Alert[@Id='HP_029']/@Status | N        |
      | //Alert[@Id='HP_029']/@Active | 1        |
      | //Alert[@Id='HP_036']/@Status | N        |
      | //Alert[@Id='HP_036']/@Active | 1        |
      | //Alert[@Id='HP_037']/@Status | N        |
      | //Alert[@Id='HP_037']/@Active | 1        |
      | //Alert[@Id='LS_007']/@Status | N        |
      | //Alert[@Id='LS_007']/@Active | 1        |
      | //Alert[@Id='LS_011']/@Status | N        |
      | //Alert[@Id='LS_011']/@Active | 1        |

  @MADLRVP-14364
  Scenario: [MADLRVP-14364] Verify LSCM FCRA - HP_042 is suppressed when HP_049 is fired
    Given the request XML filepath is /ript/fcra/lscm/sections/property_detail/MADLRVP-14364.xml
    When the LSCM FCRA request is sent
    Then response content type is XML
    And successful LSCM report is received
    And the response contains xpath
      | //Category/Flagged/Alert[@Id='HP_049']    |
      | //Category/NotFlagged/Alert[@Id='HP_042'] |
    And the response has xpath
      | XPath                         | expected |
      | //Alert[@Id='HP_049']/@Status | Y        |
      | //Alert[@Id='HP_042']/@Status | N        |

  @MADLRVP-14482
  Scenario: [MADLRVP-14482] Verify LSCM FCRA - Unit number present in the header of report
    Given the request XML filepath is /ript/fcra/lscm/sections/property_detail/MADLRVP-14482.xml
    When the LSCM FCRA request is sent
    Then response content type is XML
    And successful LSCM report is received
    And the response contains xpath
      | //ReportResults/CollateralManager/Header |
    And the response has xpath
      | XPath                                       | expected                                    |
      | //CollateralManager/Header/@propertyAddress | 1255 COLLINS AVE 503, MIAMI BEACH, FL 33139 |