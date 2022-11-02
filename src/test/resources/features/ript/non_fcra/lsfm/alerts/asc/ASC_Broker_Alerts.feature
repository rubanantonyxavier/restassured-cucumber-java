@api
@non_fcra
@lsfm
@alerts
@asc
@broker
Feature: LSFM ASC Broker Alerts

  @ASC_001
  Scenario Outline: [ASC_001] LSFM ASC Broker Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/asc/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BROKER'][@Heading='THIRD PARTY']         |
      | //Category[@Name='BROKER']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected         |
      | //Category[@Name='BROKER']/@Heading               | THIRD PARTY      |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>       |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                |
      | //Alert[@Id='<alert_id>']/@Severity               | High             |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]          |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]          |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | APPRAISER_SEARCH |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | ASC_NOT_FOUND    |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable       |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud            |
      | //Alert[@Id='<alert_id>']/@Category               | Broker           |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]          |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]          |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]          |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]          |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]          |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    ASC search returned no state license match on CR00400.
    """

    Examples:
      | alert_id |
      | ASC_001  |

  @ASC_002
  Scenario Outline: [ASC_002] LSFM ASC Broker Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/asc/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BROKER'][@Heading='THIRD PARTY']         |
      | //Category[@Name='BROKER']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected             |
      | //Category[@Name='BROKER']/@Heading               | THIRD PARTY          |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>           |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                    |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                    |
      | //Alert[@Id='<alert_id>']/@Severity               | High                 |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]              |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]              |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | APPRAISER_SEARCH     |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | ASC_FOUND_NOT_ACTIVE |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable           |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                |
      | //Alert[@Id='<alert_id>']/@Category               | Broker               |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]              |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                    |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    ASC search returned a match on 1830 with state license status other than active
    """

    Examples:
      | alert_id |
      | ASC_002  |

  @ASC_003
  Scenario Outline: [ASC_003] LSFM ASC Broker Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/asc/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BROKER'][@Heading='THIRD PARTY']         |
      | //Category[@Name='BROKER']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                |
      | //Category[@Name='BROKER']/@Heading               | THIRD PARTY             |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>              |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                       |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                       |
      | //Alert[@Id='<alert_id>']/@Severity               | High                    |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]                 |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                 |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | APPRAISER_SEARCH        |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | ASC_FOUND_NAME_MISMATCH |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable              |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                   |
      | //Alert[@Id='<alert_id>']/@Category               | Broker                  |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                 |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                 |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                 |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                 |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                 |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                       |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    ASC onfile name for the license ID does not match input appraiser name GA000395L.
    """

    Examples:
      | alert_id |
      | ASC_003  |

