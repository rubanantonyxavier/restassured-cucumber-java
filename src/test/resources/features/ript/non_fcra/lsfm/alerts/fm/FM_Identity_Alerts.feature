@api
@non_fcra
@lsfm
@alerts
@fm
@identity
Feature: LSFM FM Identity Alerts

  @FM_013
  Scenario Outline: [FM_013] LSFM FM Identity Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/fm/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='IDENTITY'][@Heading='IDENTITY']            |
      | //Category[@Name='IDENTITY']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected            |
      | //Category[@Name='IDENTITY']/@Heading             | IDENTITY            |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>          |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                   |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                   |
      | //Alert[@Id='<alert_id>']/@Severity               | Low                 |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                   |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]             |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | IDP_ADDRESS_SUMMARY |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | FM_NON_ARMS_TRANS   |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational       |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud               |
      | //Alert[@Id='<alert_id>']/@Category               | Identity            |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]             |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                   |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Borrower may be associated with broker.
    Similarity between broker name and borrower name or borrower employer
    """

    Examples:
      | alert_id |
      | FM_013   |

  @FM_014
  Scenario Outline: [FM_014] LSFM FM Identity Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/fm/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='IDENTITY'][@Heading='IDENTITY']            |
      | //Category[@Name='IDENTITY']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected            |
      | //Category[@Name='IDENTITY']/@Heading             | IDENTITY            |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>          |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                   |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                   |
      | //Alert[@Id='<alert_id>']/@Severity               | High                |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                   |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]             |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | IDP_IDENTITY_DETAIL |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | FM_PREDATORY_LNDNG  |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational       |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud               |
      | //Alert[@Id='<alert_id>']/@Category               | Identity            |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]             |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                   |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Transaction consistent with possible elder abuse scenario
    """

    Examples:
      | alert_id |
      | FM_014   |

  @FM_015
  Scenario Outline: [FM_015] LSFM FM Identity Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/fm/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='IDENTITY'][@Heading='IDENTITY']            |
      | //Category[@Name='IDENTITY']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected          |
      | //Category[@Name='IDENTITY']/@Heading             | IDENTITY          |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>        |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                 |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                 |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium            |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                 |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]           |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | [empty]           |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | FM_FRAUD_ID_THEFT |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational     |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud             |
      | //Alert[@Id='<alert_id>']/@Category               | Identity          |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]           |
      | //Alert[@Id='<alert_id>']/@Rescorable             | Y                 |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Property is in a high risk area for fraud and identity theft
    and property value is out of range for that area
    """

    Examples:
      | alert_id |
      | FM_015   |