@api
@non_fcra
@lsfm
@alerts
@fm
@fraud
Feature: LSFM FM Fraud Alerts

  @FM_046
  Scenario Outline: [FM_046] LSFM FM Fraud Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/fm/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='FRAUD'][@Heading='FRAUD SCORE RISK']    |
      | //Category[@Name='FRAUD']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected         |
      | //Category[@Name='FRAUD']/@Heading                | FRAUD SCORE RISK |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>       |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                |
      | //Alert[@Id='<alert_id>']/@Severity               | High             |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]          |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]          |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | [empty]          |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | FM_SCORE_HIGH    |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational    |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud            |
      | //Alert[@Id='<alert_id>']/@Category               | Fraud            |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]          |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]          |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]          |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]          |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]          |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    The score indicates that this loan has a high probability of loss due to fraudulent misrepresentation.
    """

    Examples:
      | alert_id |
      | FM_046   |

  @FM_047
  Scenario Outline: [FM_047] LSFM FM Fraud Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/fm/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='FRAUD'][@Heading='FRAUD SCORE RISK']    |
      | //Category[@Name='FRAUD']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected          |
      | //Category[@Name='FRAUD']/@Heading                | FRAUD SCORE RISK  |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>        |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                 |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                 |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium            |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]           |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]           |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | [empty]           |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | FM_SCORE_MODERATE |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational     |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud             |
      | //Alert[@Id='<alert_id>']/@Category               | Fraud             |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]           |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                 |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    The score indicates that this loan has a moderate probability of loss due to fraudulent misrepresentation.
    """

    Examples:
      | alert_id |
      | FM_047   |

  @FM_048
  Scenario Outline: [FM_048] LSFM FM Fraud Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/fm/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='FRAUD'][@Heading='FRAUD SCORE RISK']    |
      | //Category[@Name='FRAUD']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected         |
      | //Category[@Name='FRAUD']/@Heading                | FRAUD SCORE RISK |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>       |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                |
      | //Alert[@Id='<alert_id>']/@Severity               | Low              |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]          |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]          |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | [empty]          |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | FM_SCORE_LOW     |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational    |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud            |
      | //Alert[@Id='<alert_id>']/@Category               | Fraud            |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]          |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]          |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]          |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]          |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]          |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    The score indicates that this loan has a lower probability of loss due to fraudulent misrepresentation.
    """

    Examples:
      | alert_id |
      | FM_048   |

