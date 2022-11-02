@api
@non_fcra
@lsfm
@alerts
@lqdm
Feature: LSFM LQDM Alerts

  @LQDM_001
  Scenario Outline: [LQDM_001] LSFM LQDM Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/lqdm/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='LQDM'][@Heading='LQ DEBT MONITORING']   |
      | //Category[@Name='LQDM']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected           |
      | //Category[@Name='LQDM']/@Heading                 | LQ DEBT MONITORING |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>         |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                  |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                  |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium             |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                  |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]            |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | LQDM               |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LQDM_INQUIRY       |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational      |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud              |
      | //Alert[@Id='<alert_id>']/@Category               | LQDM               |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]            |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                  |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Customer, Ken - Experian shows borrower has a new credit inquiry after the start of debt monitoring.
    """

    Examples:
      | alert_id |
      | LQDM_001 |

  @LQDM_002
  Scenario Outline: [LQDM_002] LSFM LQDM Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/lqdm/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='LQDM'][@Heading='LQ DEBT MONITORING']   |
      | //Category[@Name='LQDM']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected           |
      | //Category[@Name='LQDM']/@Heading                 | LQ DEBT MONITORING |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>         |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                  |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                  |
      | //Alert[@Id='<alert_id>']/@Severity               | High               |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                  |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]            |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | LQDM               |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LQDM_NEW_TRADE     |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational      |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud              |
      | //Alert[@Id='<alert_id>']/@Category               | LQDM               |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]            |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                  |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Customer, Ken - Experian shows borrower has opened a new tradeline after the start of debt monitoring.
    """

    Examples:
      | alert_id |
      | LQDM_002 |

  @LQDM_003
  Scenario Outline: [LQDM_003] LSFM LQDM Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/lqdm/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='LQDM'][@Heading='LQ DEBT MONITORING']   |
      | //Category[@Name='LQDM']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected           |
      | //Category[@Name='LQDM']/@Heading                 | LQ DEBT MONITORING |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>         |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                  |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                  |
      | //Alert[@Id='<alert_id>']/@Severity               | High               |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                  |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]            |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | LQDM               |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LQDM_PAST_DUE      |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational      |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud              |
      | //Alert[@Id='<alert_id>']/@Category               | LQDM               |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]            |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                  |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Customer, Ken - Experian shows borrower has a past due payment after the start of debt monitoring.
    """

    Examples:
      | alert_id |
      | LQDM_003 |

  @LQDM_005
  Scenario Outline: [LQDM_005] LSFM LQDM Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/lqdm/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='LQDM'][@Heading='LQ DEBT MONITORING']   |
      | //Category[@Name='LQDM']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected           |
      | //Category[@Name='LQDM']/@Heading                 | LQ DEBT MONITORING |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>         |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                  |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                  |
      | //Alert[@Id='<alert_id>']/@Severity               | High               |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                  |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]            |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | LQDM               |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LQDM_BAL_CHANGE    |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational      |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud              |
      | //Alert[@Id='<alert_id>']/@Category               | LQDM               |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]            |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                  |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Customer, Ken -Experian shows borrower has a balance change after the start of debt monitoring.
    """

    Examples:
      | alert_id |
      | LQDM_005 |

