@api
@non_fcra
@lsfm
@section
@property_detail
@market_analysis
Feature: LSFM - Property Detail Section - Market Analysis

  @MADLRVP-10400
  Scenario Outline: [MADLRVP-10400] Verify LSFM - HP_001 is NOT when zip is deemed as a disaster area but fips is not
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/property_detail/MADLRVP-10400.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']                |
      | //Category[@Name='PROPERTY']/NotFlagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected              |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY              |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>            |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                     |
      | //Alert[@Id='<alert_id>']/@Status                 | N                     |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium                |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]               |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]               |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_MARKET_ANALYSIS    |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_SUB_PROP_DISASTER |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable            |
      | //Alert[@Id='<alert_id>']/@Classification         | Collateral            |
      | //Alert[@Id='<alert_id>']/@Category               | Property              |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]               |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                     |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Subject property is located in a zip code and county declared as a FEMA Disaster Area,
    with a disaster type that could impact property condition.
    """

    Examples:
      | alert_id |
      | HP_001   |

  @MADLRVP-15468
  Scenario: [MADLRVP-15468] Verify LSFM - SuperFund
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/property_detail/MADLRVP-15468.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //PropertySection/MarketAnalysis/@superFundSite |
    And the response has xpath
      | XPath                              | expected                     |
      | //MarketAnalysis/@superFundSite    | SAN FERNANDO VALLEY (AREA 1) |
