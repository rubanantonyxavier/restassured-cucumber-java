@api
@non_fcra
@lsfm
@alerts
@fm
@market
Feature: LSFM FM Market Alerts

  @FM_062
  Scenario Outline: [FM_062] LSFM FM Market Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/fm/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='MARKET'][@Heading='MARKET']              |
      | //Category[@Name='MARKET']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                 |
      | //Category[@Name='MARKET']/@Heading               | MARKET                   |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>               |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                        |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                        |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium                   |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]                  |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                  |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | [empty]                  |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | FM_HIGH_DELINQUENCY_RATE |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational            |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                    |
      | //Alert[@Id='<alert_id>']/@Category               | Market                   |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                  |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                  |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                  |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                  |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                  |
      | //Alert[@Id='<alert_id>']/@Rescorable             | Y                        |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Delinquency rate in nearby geography significantly higher than national averages
    """

    Examples:
      | alert_id |
      | FM_062   |
