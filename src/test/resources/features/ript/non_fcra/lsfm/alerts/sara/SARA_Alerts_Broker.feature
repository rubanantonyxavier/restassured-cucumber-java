@api
@non_fcra
@lsfm
@alerts
@sara
@broker
Feature: LSFM SARA Broker Alerts

  @SARA_001
  Scenario Outline: [SARA_001] LSFM SARA Broker Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/sara/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BROKER'][@Heading='THIRD PARTY']          |
      | //Category[@Name='BROKER']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected      |
      | //Category[@Name='BROKER']/@Heading               | THIRD PARTY   |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>    |
      | //Alert[@Id='<alert_id>']/@Active                 | 1             |
      | //Alert[@Id='<alert_id>']/@Status                 | Y             |
      | //Alert[@Id='<alert_id>']/@Severity               | Info          |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]       |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]       |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | SARA          |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | SARA_LOW_RISK |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable    |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud         |
      | //Alert[@Id='<alert_id>']/@Category               | Broker        |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]       |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]       |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]       |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]       |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]       |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N             |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Settlement Agent Risk Assessment returned a Low risk for one or more matches on Settlement Agent.
    """

    Examples:
      | alert_id |
      | SARA_001 |

  @SARA_002
  Scenario Outline: [SARA_002] LSFM SARA Broker Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/sara/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BROKER'][@Heading='THIRD PARTY']          |
      | //Category[@Name='BROKER']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected        |
      | //Category[@Name='BROKER']/@Heading               | THIRD PARTY     |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>      |
      | //Alert[@Id='<alert_id>']/@Active                 | 1               |
      | //Alert[@Id='<alert_id>']/@Status                 | Y               |
      | //Alert[@Id='<alert_id>']/@Severity               | High            |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]         |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]         |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | SARA            |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | SARA_CAUTIONARY |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable      |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud           |
      | //Alert[@Id='<alert_id>']/@Category               | Broker          |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]         |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]         |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]         |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]         |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]         |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N               |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Settlement Agent Risk Assessment returned a Caution Risk rating on one or more matches on Settlement Agent.
    """

    Examples:
      | alert_id |
      | SARA_002 |

  @SARA_003
  Scenario Outline: [SARA_003] LSFM SARA Broker Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/sara/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
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

  @SARA_004
  Scenario Outline: [SARA_004] LSFM SARA Broker Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/sara/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BROKER'][@Heading='THIRD PARTY']          |
      | //Category[@Name='BROKER']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected            |
      | //Category[@Name='BROKER']/@Heading               | THIRD PARTY         |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>          |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                   |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                   |
      | //Alert[@Id='<alert_id>']/@Severity               | High                |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]             |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]             |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | SARA                |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | SARA_VETTING_STATUS |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable          |
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
    Settlement Agent Risk Assessment vetting is in process and/or incomplete for Settlement Agent.
    """

    Examples:
      | alert_id |
      | SARA_004 |

  @SARA_005
  Scenario Outline: [SARA_005] LSFM SARA Broker Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/sara/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BROKER'][@Heading='THIRD PARTY']          |
      | //Category[@Name='BROKER']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected      |
      | //Category[@Name='BROKER']/@Heading               | THIRD PARTY   |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>    |
      | //Alert[@Id='<alert_id>']/@Active                 | 1             |
      | //Alert[@Id='<alert_id>']/@Status                 | Y             |
      | //Alert[@Id='<alert_id>']/@Severity               | High          |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]       |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]       |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | SARA          |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | SARA_NO_MATCH |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable    |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud         |
      | //Alert[@Id='<alert_id>']/@Category               | Broker        |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]       |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]       |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]       |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]       |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]       |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N             |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Settlement Agent Risk Assessment search returned no possible matches
    or too many matches on ESCROW OFFICER or a Limited Vetting Profile.
    """

    Examples:
      | alert_id |
      | SARA_005 |

  @SARA_006
  Scenario Outline: [SARA_006] LSFM SARA Broker Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/sara/<alert_id>.xml
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
      | //Alert[@Id='<alert_id>']/@Severity               | High                   |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]                |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | SARA                   |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | SARA_INSURANCE_EXPIRED |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable             |
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
    Settlement Agent Risk Assessment returned an expired E and O Insurance,
    Fidelity Bond or Cybersecurity for Settlement Agent.
    """

    Examples:
      | alert_id |
      | SARA_006 |

  @SARA_007
  Scenario Outline: [SARA_007] LSFM SARA Broker Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/sara/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BROKER'][@Heading='THIRD PARTY']          |
      | //Category[@Name='BROKER']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected             |
      | //Category[@Name='BROKER']/@Heading               | THIRD PARTY          |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>           |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                    |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                    |
      | //Alert[@Id='<alert_id>']/@Severity               | High                 |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]              |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]              |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | SARA                 |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | SARA_LICENSE_EXPIRED |
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
    Settlement Agent Risk Assessment returned one or more licenses that expired on Settlement Agent.
    """

    Examples:
      | alert_id |
      | SARA_007 |

  @SARA_008
  Scenario Outline: [SARA_008] LSFM SARA Broker Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/sara/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BROKER'][@Heading='THIRD PARTY']          |
      | //Category[@Name='BROKER']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                     |
      | //Category[@Name='BROKER']/@Heading               | THIRD PARTY                  |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                   |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                            |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                            |
      | //Alert[@Id='<alert_id>']/@Severity               | High                         |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]                      |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                      |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | SARA                         |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | SARA_INCOMPLETE_REGISTRATION |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable                   |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                        |
      | //Alert[@Id='<alert_id>']/@Category               | Broker                       |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                      |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                            |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Settlement Agent Risk Assessment has started but not finished their application for Escrow on Secure Insight website.
    """

    Examples:
      | alert_id |
      | SARA_008 |

  @SARA_009
  Scenario Outline: [SARA_009] LSFM SARA Broker Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/sara/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
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
      | //Alert[@Id='<alert_id>']/@ExternalTag            | SARA_SUSPENDED |
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
    Settlement Agent Risk Assessment returned a status of Suspended for Settlement Agent.
    """

    Examples:
      | alert_id |
      | SARA_009 |

  @SARA_010
  Scenario Outline: [SARA_010] LSFM SARA Broker Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/sara/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BROKER'][@Heading='THIRD PARTY']          |
      | //Category[@Name='BROKER']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected             |
      | //Category[@Name='BROKER']/@Heading               | THIRD PARTY          |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>           |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                    |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                    |
      | //Alert[@Id='<alert_id>']/@Severity               | Info                 |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]              |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]              |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | SARA                 |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | SARA_TRUST_ACCT_INFO |
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
    Settlement Agent Risk Assessment returned a modified vetting as Settlement Agent is tied to a national underwriter.
    Trust account information may require verification by the lender and not Secure Insight.
    """

    Examples:
      | alert_id |
      | SARA_010 |

