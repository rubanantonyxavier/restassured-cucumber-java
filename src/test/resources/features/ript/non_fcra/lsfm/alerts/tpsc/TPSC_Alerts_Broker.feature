@api
@non_fcra
@lsfm
@alerts
@tpsc
@broker
Feature: LSFM TPSC Broker Alerts

  @TPSC_007
  Scenario Outline: [TPSC_007] LSFM TPSC Broker Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/tpsc/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BROKER'][@Heading='THIRD PARTY']          |
      | //Category[@Name='BROKER']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected               |
      | //Category[@Name='BROKER']/@Heading               | THIRD PARTY            |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>             |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                      |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                      |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium                 |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]                |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | BROKER_PHONE_ADDRESS   |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_BROKER_MULTI_PHONE |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational          |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                  |
      | //Alert[@Id='<alert_id>']/@Category               | Broker                 |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                      |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    More than one third party at indicated phone number. See broker section of report.
    """

    Examples:
      | alert_id |
      | TPSC_007 |

  @TPSC_008
  Scenario Outline: [TPSC_008] LSFM TPSC Broker Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/tpsc/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BROKER'][@Heading='THIRD PARTY']          |
      | //Category[@Name='BROKER']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                 |
      | //Category[@Name='BROKER']/@Heading               | THIRD PARTY              |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>               |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                        |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                        |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium                   |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]                  |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                  |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | BROKER_PHONE_ADDRESS     |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_BROKER_MULTI_ADDRESS |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational            |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                    |
      | //Alert[@Id='<alert_id>']/@Category               | Broker                   |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                  |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                  |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                  |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                  |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                  |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                        |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    More than one third party at indicated business address. See broker section of report.
    """

    Examples:
      | alert_id |
      | TPSC_008 |

