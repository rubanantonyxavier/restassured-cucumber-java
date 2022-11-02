@api
@non_fcra
@lsrm
@alerts
@sara
@broker
Feature: LSRM SARA Broker Alerts

  @SARA_003
  Scenario Outline: [SARA_003] LSRM SARA Broker Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsrm/alerts/<alert_id>.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category[@Name='BROKER'][@Heading='THIRD PARTY']          |
      | //Category[@Name='BROKER']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected       |
      | //Category[@Name='BROKER']/@Heading               | THIRD PARTY    |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>     |
      | //Alert[@Id='<alert_id>']/@Active                 | 1              |
      | //Alert[@Id='<alert_id>']/@Status                 | Y              |
      | //Alert[@Id='<alert_id>']/@Severity               | High           |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]        |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]        |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | SARA           |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | SARA_HIGH_RISK |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable     |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud          |
      | //Alert[@Id='<alert_id>']/@Category               | Broker         |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]        |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]        |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]        |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]        |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]        |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N              |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Settlement Agent Risk Assessment returned a High risk rating
    for one or more matches on Title Agent.
    """

    Examples:
      | alert_id |
      | SARA_003 |
