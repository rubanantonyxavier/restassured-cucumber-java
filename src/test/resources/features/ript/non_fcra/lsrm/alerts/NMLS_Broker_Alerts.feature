@api
@non_fcra
@lsrm
@alerts
@nmls
@broker
Feature: LSRM NMLS Broker Alerts
  
  @NMLS_009
  Scenario Outline: [NMLS_009] LSRM NMLS Broker Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsrm/alerts/<alert_id>.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category[@Name='BROKER'][@Heading='THIRD PARTY']         |
      | //Category[@Name='BROKER']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected          |
      | //Category[@Name='BROKER']/@Heading               | THIRD PARTY       |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>        |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                 |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                 |
      | //Alert[@Id='<alert_id>']/@Severity               | High              |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]           |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]           |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | NMLS_REGISTRY     |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | NMLS_NO_FED_FOUND |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable        |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud             |
      | //Alert[@Id='<alert_id>']/@Category               | Broker            |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]           |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                 |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    NMLS search returned no federal registration on ID 3113, 139238
    """

    Examples:
      | alert_id |
      | NMLS_009 |
