@api
@non_fcra
@lsfm
@alerts
@nmls
@broker
Feature: LSFM NMLS Broker Alerts

  @NMLS_001
  Scenario Outline: [NMLS_001] LSFM NMLS Broker Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/nmls/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BROKER'][@Heading='THIRD PARTY']         |
      | //Category[@Name='BROKER']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected            |
      | //Category[@Name='BROKER']/@Heading               | THIRD PARTY         |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>          |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                   |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                   |
#  per Jenifer request    | //Alert[@Id='<alert_id>']/@Severity               | Info                |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]             |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]             |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | NMLS_REGISTRY       |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | NMLS_FOUND_APPROVED |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational       |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud               |
      | //Alert[@Id='<alert_id>']/@Category               | Broker              |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]             |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                   |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    NMLS search returned one or more matches on Vincent SanFilippo
    with a state license status of approved.
    """

    Examples:
      | alert_id |
      | NMLS_001 |

  @NMLS_002
  Scenario Outline: [NMLS_002] LSFM NMLS Broker Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/nmls/<alert_id>.xml
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
      | //Alert[@Id='<alert_id>']/@Severity               | Medium                  |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]                 |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                 |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | NMLS_REGISTRY           |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | NMLS_FOUND_MULTI_STATUS |
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
    NMLS search returned multiple matches on Joshua Smith
    with conflicting state license statuses.
    """

    Examples:
      | alert_id |
      | NMLS_002 |

  @NMLS_003
  Scenario Outline: [NMLS_003] LSFM NMLS Broker Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/nmls/<alert_id>.xml
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
      | //Alert[@Id='<alert_id>']/@AnchorTag              | NMLS_REGISTRY           |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | NMLS_FOUND_NOT_APPROVED |
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
    NMLS search returned one or more matches on Sean Magee
    with state license status other than approved.
    """

    Examples:
      | alert_id |
      | NMLS_003 |

  @NMLS_004
  Scenario Outline: [NMLS_004] LSFM NMLS Broker Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/nmls/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BROKER'][@Heading='THIRD PARTY']         |
      | //Category[@Name='BROKER']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected       |
      | //Category[@Name='BROKER']/@Heading               | THIRD PARTY    |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>     |
      | //Alert[@Id='<alert_id>']/@Active                 | 1              |
      | //Alert[@Id='<alert_id>']/@Status                 | Y              |
      | //Alert[@Id='<alert_id>']/@Severity               | High           |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]        |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]        |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | NMLS_REGISTRY  |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | NMLS_NOT_FOUND |
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
    NMLS search returned no state license match on ID 411341.
    """

    Examples:
      | alert_id |
      | NMLS_004 |

  @NMLS_005
  Scenario Outline: [NMLS_005] LSFM NMLS Broker Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/nmls/<alert_id>.xml
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
      | //Alert[@Id='<alert_id>']/@AnchorTag              | NMLS_REGISTRY        |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | NMLS_STATE_NOT_FOUND |
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
    NMLS search returned one or more state license matches on Max Martinez,
    but no license was found in a state associated with this loan transaction.
    """

    Examples:
      | alert_id |
      | NMLS_005 |

  @NMLS_006
  Scenario Outline: [NMLS_006] LSFM NMLS Broker Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/nmls/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BROKER'][@Heading='THIRD PARTY']         |
      | //Category[@Name='BROKER']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected              |
      | //Category[@Name='BROKER']/@Heading               | THIRD PARTY           |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>            |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                     |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                     |
      | //Alert[@Id='<alert_id>']/@Severity               | Info                  |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]               |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]               |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | NMLS_REGISTRY         |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | NMLS_ACTIVE_FED_FOUND |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational         |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                 |
      | //Alert[@Id='<alert_id>']/@Category               | Broker                |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]               |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                     |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    NMLS search returned a match on Cindy Baker with an active federal registration.
    """

    Examples:
      | alert_id |
      | NMLS_006 |

  @NMLS_007
  Scenario Outline: [NMLS_007] LSFM NMLS Broker Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/nmls/<alert_id>.xml
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
      | //Alert[@Id='<alert_id>']/@AnchorTag              | NMLS_REGISTRY           |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | NMLS_INACTIVE_FED_FOUND |
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
    NMLS search returned a match on Sean Magee  with an inactive federal registration.
    """

    Examples:
      | alert_id |
      | NMLS_007 |

  @NMLS_008
  Scenario Outline: [NMLS_008] LSFM NMLS Broker Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/nmls/<alert_id>.xml
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
      | //Alert[@Id='<alert_id>']/@Severity               | Medium               |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]              |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]              |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | NMLS_REGISTRY        |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | NMLS_MULTI_FED_FOUND |
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
    NMLS search returned multiple matches on Joshua Smith
    with conflicting federal registration statuses.
    """

    Examples:
      | alert_id |
      | NMLS_008 |

  @NMLS_009
  Scenario Outline: [NMLS_009] LSFM NMLS Broker Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/nmls/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
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
    NMLS search returned no federal registration on
    ID 2611, 411341, 1640341, 1643508 and Max Martinez
    """

    Examples:
      | alert_id |
      | NMLS_009 |

  @NMLS_010
  Scenario Outline: [NMLS_010] LSFM NMLS Broker Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/nmls/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BROKER'][@Heading='THIRD PARTY']         |
      | //Category[@Name='BROKER']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                       |
      | //Category[@Name='BROKER']/@Heading               | THIRD PARTY                    |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                     |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                              |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                              |
      | //Alert[@Id='<alert_id>']/@Severity               | Info                           |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]                        |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                        |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | NMLS_REGISTRY                  |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | NMLS_FOUND_TEMPORARY_AUTHORITY |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational                  |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                          |
      | //Alert[@Id='<alert_id>']/@Category               | Broker                         |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                        |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                        |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                        |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                        |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                        |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                              |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    NMLS search returned one or more matches on
    ID 868370283 with Temporary Authority.
    """

    Examples:
      | alert_id |
      | NMLS_010 |

