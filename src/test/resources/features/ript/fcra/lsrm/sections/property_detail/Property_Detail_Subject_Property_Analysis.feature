@api
@fcra
@lsrm
@section
@property_detail
@subject_property_analysis
Feature: LSRM FCRA - Property Detail - Subject Property Analysis

  @MADLRVP-10450
  Scenario: [MADLRVP-10450] Verify LSRM FCRA - HP_042 is not suppressed when HP_049 is fired
    Given the request XML filepath is /ript/fcra/lsrm/sections/property_detail/MADLRVP-10450.xml
    When the LSRM FCRA request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category/Flagged/Alert[@Id='HP_042'] |
      | //Category/Flagged/Alert[@Id='HP_049'] |
    And the response has xpath
      | XPath                         | expected |
      | //Alert[@Id='HP_042']/@Status | Y        |
      | //Alert[@Id='HP_049']/@Status | Y        |
