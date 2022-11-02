@api
@non_fcra
@lsrm
@section
@property_detail
@market_analysis
Feature: LSRM - Property Detail - Market Analysis

  @MADLRVP-10408
  Scenario: [MADLRVP-10408] Verify LSRM - Check that HP_001 is NOT when zip is deemed as a disaster area but fips is not
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/property_detail/MADLRVP-10408.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category/NotFlagged/Alert[@Id='HP_001'] |
    And the response has xpath
      | XPath                         | expected |
      | //Alert[@Id='HP_001']/@Status | N        |

  @MADLRVP-10406
  Scenario: [MADLRVP-10406] Verify LSRM - Check that HP_001 is fired when zip and fips deemed as a disaster area
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/property_detail/MADLRVP-10406.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category/Flagged/Alert[@Id='HP_001'] |
    And the response has xpath
      | XPath                         | expected |
      | //Alert[@Id='HP_001']/@Status | Y        |

  @MADLRVP-15469
  Scenario: [MADLRVP-15469] Verify LSRM - SuperFund
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/property_detail/MADLRVP-15469.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //PropertySection/MarketAnalysis/@superFundSite |
    And the response has xpath
      | XPath                              | expected                     |
      | //MarketAnalysis/@superFundSite    | SAN FERNANDO VALLEY (AREA 1) |
