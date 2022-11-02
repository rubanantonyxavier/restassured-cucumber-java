@api
@non_fcra
@lsfm
@section
@property_detail
@subject_property_analysis
Feature: LSFM - Property Detail Section - Subject Property Analysis

  @MADLRVP-10434
  Scenario: [MADLRVP-10434] Verify LSFM - HP_042 is not suppressed when HP_049 is fired
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/property_detail/MADLRVP-10434.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']         |
      | //Category[@Name='PROPERTY']/Flagged//Alert[@Id='HP_042'] |
      | //Category[@Name='PROPERTY']/Flagged//Alert[@Id='HP_049'] |
    And the response has xpath
      | XPath                         | expected |
      | //Alert[@Id='HP_042']/@Status | Y        |
      | //Alert[@Id='HP_049']/@Status | Y        |