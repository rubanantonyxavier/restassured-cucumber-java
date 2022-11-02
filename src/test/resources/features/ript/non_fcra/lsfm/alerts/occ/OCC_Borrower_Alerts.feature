@api
@non_fcra
@lsfm
@alerts
@occ
@borrower
Feature: LSFM OCC Borrower Alerts

  @OCC_001
  Scenario Outline: [OCC_001] LSFM OCC Borrower Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/occ/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged/Alert[@Id='<alert_id>']          |
    And the response has xpath
      | XPath                                             | expected                     |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                   |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                            |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                            |
      | //Alert[@Id='<alert_id>']/@Severity               | High                         |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                      |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | IDP_DATA_VERIFICATION        |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_MAIL_50_MILES            |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational                |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                        |
      | //Alert[@Id='<alert_id>']/@Category               | Borrower                     |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                      |
      | //Alert[@Id='<alert_id>']/@Rescorable             | Y                            |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Geng, Xie - Low probability that the subject property will be
    owner occupied - Refinance where borrower's mailing address
    is greater than 50.0 miles from the subject property.
    """

    Examples:
      | alert_id |
      | OCC_001  |

  @OCC_002
  Scenario Outline: [OCC_002] LSFM OCC Borrower Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/occ/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged/Alert[@Id='<alert_id>']          |
    And the response has xpath
      | XPath                                             | expected                     |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                   |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                            |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                            |
      | //Alert[@Id='<alert_id>']/@Severity               | High                         |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                      |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | IDP_DATA_VERIFICATION        |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_2ND_HOME_SAME_ZIP        |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational                |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                        |
      | //Alert[@Id='<alert_id>']/@Category               | Borrower                     |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                      |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                            |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    TONI, FIELD - Low probability that the subject property will be used as a second home.
    Subject property is in the same zip code as the borrower's mailing address.
    """

    Examples:
      | alert_id |
      | OCC_002  |

  @OCC_003
  Scenario Outline: [OCC_003] LSFM OCC Borrower Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/occ/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged/Alert[@Id='<alert_id>']          |
    And the response has xpath
      | XPath                                             | expected                     |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                   |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                            |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                            |
      | //Alert[@Id='<alert_id>']/@Severity               | High                         |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                      |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | ownerOccupancy               |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_SUBJ_LOWER_VALUE_CUROWN  |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational                |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                        |
      | //Alert[@Id='<alert_id>']/@Category               | Borrower                     |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                      |
      | //Alert[@Id='<alert_id>']/@Rescorable             | Y                            |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Drescher, Florian - Low probability that the subject property will be owner occupied.
    Borrower currently owns one or more properties with a value
    that is 5% greater than the subject property value.
    """

    Examples:
      | alert_id |
      | OCC_003  |

  @OCC_004
  Scenario Outline: [OCC_004] LSFM OCC Borrower Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/occ/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged/Alert[@Id='<alert_id>']          |
    And the response has xpath
      | XPath                                             | expected                     |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                   |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                            |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                            |
      | //Alert[@Id='<alert_id>']/@Severity               | High                         |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                      |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | ownerOccupancy               |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_OCC_INV_PUR_STRAW        |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable                   |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                        |
      | //Alert[@Id='<alert_id>']/@Category               | Borrower                     |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                      |
      | //Alert[@Id='<alert_id>']/@Rescorable             | Y                            |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Transaction for investment property has characteristics of
    reverse occupancy and/or rental income misrepresentation
    """

    Examples:
      | alert_id |
      | OCC_004  |

  @OCC_005
  Scenario Outline: [OCC_005] LSFM OCC Borrower Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/occ/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged/Alert[@Id='<alert_id>']          |
    And the response has xpath
      | XPath                                             | expected                     |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                   |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                            |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                            |
      | //Alert[@Id='<alert_id>']/@Severity               | High                         |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                      |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | ownerOccupancy               |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_OCC_INV_PUR_STRAW_FMN    |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable                   |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                        |
      | //Alert[@Id='<alert_id>']/@Category               | Borrower                     |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                      |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                            |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Transaction for investment property has characteristics of
    reverse occupancy and/or rental income misrepresentation.
    """

    Examples:
      | alert_id |
      | OCC_005  |

