@api
@fcra
@lsrm
@section
@property_detail
@market_analysis
Feature: LSRM FCRA - Property Detail - Market Analysis

  @MADLRVP-10409
  Scenario: [MADLRVP-10409] Verify LSRM FCRA - Check that HP_001 is NOT when zip is deemed as a disaster area but fips is not
    Given the request XML filepath is /ript/fcra/lsrm/sections/property_detail/MADLRVP-10409.xml
    When the LSRM FCRA request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category/NotFlagged/Alert[@Id='HP_001'] |
    And the response has xpath
      | XPath                         | expected |
      | //Alert[@Id='HP_001']/@Status | N        |

  @MADLRVP-10407
  Scenario: [MADLRVP-10407] Verify LSRM FCRA - Check that HP_001 is fired when zip and fips deemed as a disaster area
    Given the request XML filepath is /ript/fcra/lsrm/sections/property_detail/MADLRVP-10407.xml
    When the LSRM FCRA request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category/Flagged/Alert[@Id='HP_001'] |
    And the response has xpath
      | XPath                         | expected |
      | //Alert[@Id='HP_001']/@Status | Y        |

  @MADLRVP-14104
  Scenario: [MADLRVP-14104] Verify LSRM FCRA - SuperFund Site
    Given the request XML filepath is /ript/fcra/lsrm/sections/property_detail/MADLRVP-14104.xml
    When the LSRM FCRA request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //PropertySection/MarketAnalysis/@superFundSite                |
      | //PropertySection/SubjectProperty/GeoInfo/Zip9/@superFundDescr |
    And the response has xpath
      | XPath                              | expected                     |
      | //MarketAnalysis/@superFundSite    | SAN FERNANDO VALLEY (AREA 1) |
      | //SubjectProperty//@superFundDescr | SAN FERNANDO VALLEY (AREA 1) |
