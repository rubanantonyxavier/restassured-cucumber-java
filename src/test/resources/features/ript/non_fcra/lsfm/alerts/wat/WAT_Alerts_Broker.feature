@api
@non_fcra
@lsfm
@alerts
@wat
@broker
Feature: LSFM WAT Broker Alerts

  @WAT_019
  Scenario Outline: [WAT_019] LSFM WAT Broker Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/wat/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BROKER'][@Heading='THIRD PARTY']          |
      | //Category[@Name='BROKER']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                  |
      | //Category[@Name='BROKER']/@Heading               | THIRD PARTY               |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                         |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                         |
      | //Alert[@Id='<alert_id>']/@Severity               | High                      |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]                   |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                   |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | WAT_3RD_PARTY_GOV_DETAILS |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | THIRD_PARTY_SAM_GOV       |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable                |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                     |
      | //Alert[@Id='<alert_id>']/@Category               | Broker                    |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                   |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                   |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                   |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                   |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                   |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                         |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Possible match found on SAM.gov for Account Executive and Mortgage Broker
    """

    Examples:
      | alert_id |
      | WAT_019  |

  @WAT_020
  Scenario Outline: [WAT_020] LSFM WAT Broker Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/wat/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BROKER'][@Heading='THIRD PARTY']          |
      | //Category[@Name='BROKER']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                  |
      | //Category[@Name='BROKER']/@Heading               | THIRD PARTY               |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                         |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                         |
      | //Alert[@Id='<alert_id>']/@Severity               | High                      |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]                   |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                   |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | WAT_3RD_PARTY_GOV_DETAILS |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | THIRD_PARTY_HUD           |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable                |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                     |
      | //Alert[@Id='<alert_id>']/@Category               | Broker                    |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                   |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                   |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                   |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                   |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                   |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                         |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Possible match found on HUD LDP for Loan Closer
    """

    Examples:
      | alert_id |
      | WAT_020  |

  @WAT_021
  Scenario Outline: [WAT_021] LSFM WAT Broker Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/wat/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BROKER'][@Heading='THIRD PARTY']          |
      | //Category[@Name='BROKER']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                                            |
      | //Category[@Name='BROKER']/@Heading               | THIRD PARTY                                         |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                                          |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                                                   |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                                                   |
      | //Alert[@Id='<alert_id>']/@Severity               | High                                                |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]                                             |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                                             |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | WAT_3RD_PARTY_GOV_DETAILS                           |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | THIRD_PARTY_FHFA                                    |
      | //Alert[@Id='<alert_id>']/@Message                | Possible match found on FHFA SCP for Escrow Officer |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable                                          |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                                               |
      | //Alert[@Id='<alert_id>']/@Category               | Broker                                              |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                                             |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                                             |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                                             |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                                             |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                                             |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                                                   |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Possible match found on FHFA SCP for Escrow Officer
    """

    Examples:
      | alert_id |
      | WAT_021  |

  @WAT_024
  Scenario Outline: [WAT_024] LSFM WAT Broker Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/wat/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BROKER'][@Heading='THIRD PARTY']          |
      | //Category[@Name='BROKER']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected         |
      | //Category[@Name='BROKER']/@Heading               | THIRD PARTY      |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>       |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                |
      | //Alert[@Id='<alert_id>']/@Severity               | High             |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]          |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]          |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | OFAC_SDN_DETAILS |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | THIRD_PARTY_OFAC |
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
    Possible match found on OFAC for Trustee
    """

    Examples:
      | alert_id |
      | WAT_024  |

  @WAT_025
  Scenario Outline: [WAT_025] LSFM WAT Broker Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/wat/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BROKER'][@Heading='THIRD PARTY']          |
      | //Category[@Name='BROKER']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                  |
      | //Category[@Name='BROKER']/@Heading               | THIRD PARTY               |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                         |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                         |
      | //Alert[@Id='<alert_id>']/@Severity               | High                      |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]                   |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                   |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | WAT_3RD_PARTY_GOV_DETAILS |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | SPOOR_SAMGOV              |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable                |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                     |
      | //Alert[@Id='<alert_id>']/@Category               | Broker                    |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                   |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                   |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                   |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                   |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                   |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                         |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Possible match found on SAM.gov for Subject Property Owner of Record
    """

    Examples:
      | alert_id |
      | WAT_025  |

  @WAT_030
  Scenario Outline: [WAT_030] LSFM WAT Broker Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/wat/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BROKER'][@Heading='THIRD PARTY']          |
      | //Category[@Name='BROKER']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected         |
      | //Category[@Name='BROKER']/@Heading               | THIRD PARTY      |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>       |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                |
      | //Alert[@Id='<alert_id>']/@Severity               | High             |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]          |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]          |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | OFAC_SDN_DETAILS |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | SPOOR_OFAC       |
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
    Possible match found on OFAC for Subject Property Owner of Record
    """

    Examples:
      | alert_id |
      | WAT_030  |

