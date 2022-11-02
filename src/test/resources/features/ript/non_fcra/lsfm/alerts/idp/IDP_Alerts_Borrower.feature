@api
@non_fcra
@lsfm
@alerts
@idp
@borrower
Feature: LSFM IDP Borrower Alerts

  @IDP_003
  Scenario Outline: [IDP_003] LSFM IDP Borrower Alert Validation
  Based on credit header data, the addresses for which the borrower has applied for credit are provided.
  The transaction histories of those properties are displayed,
  and if the borrower's name appears as a previous or current owner of 5 or more properties,
  this alert will populate
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged//Alert[@Id='<alert_id>']         |
    And the response has xpath
      | XPath                                             | expected                     |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                   |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                            |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                            |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium                       |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                      |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | ownerOccupancy               |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_BRWR_HIGH_PRCH           |
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
    Cohen, Catherine - Borrower has purchased more than 5 properties in their lifetime
    """

    Examples:
      | alert_id |
      | IDP_003  |

  @IDP_014
  Scenario Outline: [IDP_014] LSFM IDP Borrower Alert Validation
  Borrower currently owns more than one property.
  Can be used as a gauge to determine potential owner occupancy fraud dependent
  upon what the borrower is claiming for subject property
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged//Alert[@Id='<alert_id>']         |
    And the response has xpath
      | XPath                                             | expected                     |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                   |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                            |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                            |
      | //Alert[@Id='<alert_id>']/@Severity               | Low                          |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                      |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | ownerOccupancy               |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_BRWR_OWNS_MULTI_PROP     |
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
    Ellis, William - Borrower currently owns multiple properties
    """

    Examples:
      | alert_id |
      | IDP_014  |

  @IDP_015
  Scenario Outline: [IDP_015] LSFM IDP Borrower Alert Validation
  Borrower is not self-employed and borrower's current address is not listed as residential.
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged//Alert[@Id='<alert_id>']         |
    And the response has xpath
      | XPath                                             | expected                     |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                   |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                            |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                            |
      | //Alert[@Id='<alert_id>']/@Severity               | Low                          |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                      |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | IDP_ADDRESS_SUMMARY          |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_PRSNT_ADD_USE_CODE       |
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
    DONNARZI, G - Borrower is not self-employed and borrower's current address is not listed as residential.
    """

    Examples:
      | alert_id |
      | IDP_015  |

  @IDP_035
  Scenario Outline: [IDP_035] LSFM IDP Borrower Alert Validation
  Borrower SSN search of FACL database. FACL equates a LoanSafe run to a loan application
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged//Alert[@Id='<alert_id>']         |
    And the response has xpath
      | XPath                                             | expected                     |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                   |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                            |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                            |
      | //Alert[@Id='<alert_id>']/@Severity               | High                         |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                      |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | UNDISCLOSED_DEBT             |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_MULTIAPP_OTHER_LENDER    |
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
    MARSUPIAL, MARK - Borrower has additional loan applications on different properties
    with other lenders in the past 120 days
    """

    Examples:
      | alert_id |
      | IDP_035  |

  @IDP_036
  Scenario Outline: [IDP_036] LSFM IDP Borrower Alert Validation
  Borrower SSN search of FACL database.  FACL equates a LoanSafe run to a loan application
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged//Alert[@Id='<alert_id>']         |
    And the response has xpath
      | XPath                                             | expected                     |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                   |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                            |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                            |
      | //Alert[@Id='<alert_id>']/@Severity               | High                         |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                      |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | UNDISCLOSED_DEBT             |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_MULTIAPP_SAME_LENDER     |
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
    Marsupial, Mark - Borrower has additional loan applications on
    different properties with your institution in the past 360 days
    """

    Examples:
      | alert_id |
      | IDP_036  |

  @IDP_037
  Scenario Outline: [IDP_037] LSFM IDP Borrower Alert Validation
  Borrower SSN search of FACL database. FACL equates a LoanSafe run to a loan application
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged//Alert[@Id='<alert_id>']         |
    And the response has xpath
      | XPath                                             | expected                      |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT  |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                    |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                             |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                             |
      | //Alert[@Id='<alert_id>']/@Severity               | High                          |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                             |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                       |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | UNDISCLOSED_DEBT              |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_MULTIAPP_SAME_LENDER_ADDR |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational                 |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                         |
      | //Alert[@Id='<alert_id>']/@Category               | Borrower                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                       |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                       |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                       |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                       |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                       |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                             |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Marsupial, Mark - Borrower has additional loan applications on the same property with
    your institution in the past 360 days
    """

    Examples:
      | alert_id |
      | IDP_037  |

  @IDP_038
  Scenario Outline: [IDP_038] LSFM IDP Borrower Alert Validation
  Additional loans for the borrower were found through MERS (Mortgage Electronic Registry System) data
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged//Alert[@Id='<alert_id>']         |
    And the response has xpath
      | XPath                                             | expected                     |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                   |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                            |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                            |
      | //Alert[@Id='<alert_id>']/@Severity               | High                         |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                      |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | LOAN_REGISTRY_SEARCH         |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_LOAN_REGISTRY            |
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
    Werczberger, Jacob - Borrower has additional loans registered
    on other properties in the loan registry system within the last 120 days.
    """

    Examples:
      | alert_id |
      | IDP_038  |

  @IDP_040
  Scenario Outline: [IDP_040] LSFM IDP Borrower Alert Validation
  Based on credit header data, the addresses for which the borrower has applied for credit are provided.
  The transaction histories of those properties are displayed, and if the borrower's name is aligned with two or more
  foreclosure transactions, the alert will populate. Credit risk alert. Will impact LS score
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged//Alert[@Id='<alert_id>']         |
    And the response has xpath
      | XPath                                             | expected                     |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                   |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                            |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                            |
      | //Alert[@Id='<alert_id>']/@Severity               | High                         |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                      |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | BORROWER_ADDRESS_SUMMARY     |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_FCL_7YRS_HIGH            |
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
    ANDRADE, JORGE - Borrower has had one or more foreclosures, or deed in lieu of foreclosure filings in the past 7 years
    """

    Examples:
      | alert_id |
      | IDP_040  |

  @IDP_046
  Scenario Outline: [IDP_046] LSFM IDP Borrower Alert Validation
  Borrower has filed one or more bankruptcies in the past seven years
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged//Alert[@Id='<alert_id>']         |
    And the response has xpath
      | XPath                                             | expected                     |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                   |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                            |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                            |
      | //Alert[@Id='<alert_id>']/@Severity               | High                         |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                      |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | IDENTITY_DETAIL_BK           |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_BK_7YRS_HIGH             |
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
    Carrin, Gregory - Borrower has filed one or more bankruptcies in the past seven years
    """

    Examples:
      | alert_id |
      | IDP_046  |

  @IDP_062
  Scenario Outline: [IDP_062] LSFM IDP Borrower Alert Validation
  The second home property address is less than {2ND_HOME_THRESHOLD_MILES} miles
  from the borrower's current residence.
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged//Alert[@Id='<alert_id>']         |
    And the response has xpath
      | XPath                                             | expected                        |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT    |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                      |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                               |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                               |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium                          |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                               |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                         |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | IDP_DATA_VERIFICATION           |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | IDP_2ND_HOME_CLOSE_TO_RESIDENCE |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational                   |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                           |
      | //Alert[@Id='<alert_id>']/@Category               | Borrower                        |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                         |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                         |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                         |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                         |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                         |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                               |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Ellis, William - The second home property address is less than 25 miles
    from the borrower's current residence.
    """

    Examples:
      | alert_id |
      | IDP_062  |

  @IDP_064
  Scenario Outline: [IDP_064] LSFM IDP Borrower Alert Validation
  Suspicious sale. Buyer is a previous owner of the subject property.
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged//Alert[@Id='<alert_id>']         |
    And the response has xpath
      | XPath                                             | expected                            |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT        |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                          |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                                   |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                                   |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium                              |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                                   |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                             |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_SUBJECT_DETAIL                   |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | BRWR_SUSPICIOUS_SALE_PREVIOUS_OWNER |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational                       |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                               |
      | //Alert[@Id='<alert_id>']/@Category               | Borrower                            |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                             |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                             |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                             |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                             |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                             |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                                   |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Walter, Aaron - Suspicious sale. Buyer is a previous owner of the subject property.
    """

    Examples:
      | alert_id |
      | IDP_064  |

  @IDP_065
  Scenario Outline: [IDP_065] LSFM IDP Borrower Alert Validation
  Suspicious sale. Buyer and Seller share the same last name
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged//Alert[@Id='<alert_id>']         |
    And the response has xpath
      | XPath                                             | expected                                    |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT                |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                                  |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                                           |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                                           |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium                                      |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                                           |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                                     |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_SUBJECT_DETAIL                           |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | BRWR_SUSPICIOUS_SALE_SELLER_BUYER_SAME_NAME |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational                               |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                                       |
      | //Alert[@Id='<alert_id>']/@Category               | Borrower                                    |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                                     |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                                     |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                                     |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                                     |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                                     |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                                           |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Walter, Aaron - Suspicious sale. Buyer and Seller share the same last name
    """

    Examples:
      | alert_id |
      | IDP_065  |

  @IDP_066
  Scenario Outline: [IDP_066] LSFM IDP Borrower Alert Validation
  This alert should fire when red X shows in search summary and it is not related to a MERS lockout (IDP_050)
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //*[name()='urn:Category'][@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //*[name()='urn:Category'][@Name='BORROWER']/Flagged//Alert[@Id='<alert_id>']         |
    And the response has xpath
      | XPath                                             | expected                     |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                   |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                            |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                            |
      | //Alert[@Id='<alert_id>']/@Severity               | High                         |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                      |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | LOAN_REGISTRY_SEARCH         |
# per Jennifer request     | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_MERS_ACCESS_ISSUE        |
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
    Benito, Joe - There is a problem accessing the Loan Registry System.
    """

    Examples:
      | alert_id |
      | IDP_066  |

  @IDP_067
  Scenario Outline: [IDP_067] LSFM IDP Borrower Alert Validation
  Suspicious sale.  Borrower's last name matches {roles} for this transaction.
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged//Alert[@Id='<alert_id>']         |
    And the response has xpath
      | XPath                                             | expected                                        |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT                    |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                                      |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                                               |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                                               |
      | //Alert[@Id='<alert_id>']/@Severity               | High                                            |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                                               |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                                         |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | SearchSummaryAnchor                             |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | BRWR_SUSPICIOUS_SALE_LOAN_ACTOR_BUYER_SAME_NAME |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational                                   |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                                           |
      | //Alert[@Id='<alert_id>']/@Category               | Borrower                                        |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                                         |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                                         |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                                         |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                                         |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                                         |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                                               |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Burnett, Gregory - Suspicious sale.
    Borrower's last name matches Loan Actor (BuyerAgent) for this transaction.
    """

    Examples:
      | alert_id |
      | IDP_067  |

  @IDP_068
  Scenario Outline: [IDP_068] LSFM IDP Borrower Alert Validation
  Potential undisclosed REO.
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged//Alert[@Id='<alert_id>']         |
    And the response has xpath
      | XPath                                             | expected                      |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT  |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                    |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                             |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                             |
      | //Alert[@Id='<alert_id>']/@Severity               | High                          |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                             |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                       |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | REO_COMPARISON_SUMMARY        |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | IDP_REO_POTENTIAL_UNDISCLOSED |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable                    |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                         |
      | //Alert[@Id='<alert_id>']/@Category               | Borrower                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                       |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                       |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                       |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                       |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                       |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                             |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    bruce, greenberg - Potential undisclosed REO.
    """

    Examples:
      | alert_id |
      | IDP_068  |

  @IDP_069
  Scenario Outline: [IDP_069] LSFM IDP Borrower Alert Validation
  Unable to determine ownership of input REO address as no onfile REO address was found to match
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged//Alert[@Id='<alert_id>']         |
    And the response has xpath
      | XPath                                             | expected                     |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                   |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                            |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                            |
      | //Alert[@Id='<alert_id>']/@Severity               | Low                          |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                      |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | REO_COMPARISON_SUMMARY       |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | <ExternalTag>                |
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
    GOLDOVA, HASAN - Unable to determine ownership of input REO address as no onfile REO address was found to match
    """

    @dev_only
    Examples:
      | alert_id | ExternalTag               |
      | IDP_069  | LSF_ONFILE_INPUT_NO_MATCH |

    @qa_only
    Examples:
      | alert_id | ExternalTag                   |
      | IDP_069  | IDP_REO_ONFILE_INPUT_NO_MATCH |

  @IDP_070
  Scenario Outline: [IDP_070] LSFM IDP Borrower Alert Validation
  An exact match between the input REO and onfile REO was not found.
  However, a closely matching onfile address was identified
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged//Alert[@Id='<alert_id>']         |
    And the response has xpath
      | XPath                                             | expected                     |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                   |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                            |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                            |
      | //Alert[@Id='<alert_id>']/@Severity               | Low                          |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                      |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | REO_COMPARISON_SUMMARY       |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | <ExternalTag>                |
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
    Smith, Janka - An exact match between the input REO and onfile REO was not found.
    However, a closely matching onfile address was identified
    """

    @dev_only
    Examples:
      | alert_id | ExternalTag                          |
      | IDP_070  | LSF_INPUT_STANDARDIZED_DIFFER_ONFILE |

    @qa_only
    Examples:
      | alert_id | ExternalTag                              |
      | IDP_070  | IDP_REO_INPUT_STANDARDIZED_DIFFER_ONFILE |

  @IDP_071
  Scenario Outline: [IDP_071] LSFM IDP Borrower Alert Validation
  Input REO address previously owned by borrower
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged//Alert[@Id='<alert_id>']         |
    And the response has xpath
      | XPath                                             | expected                     |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                   |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                            |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                            |
      | //Alert[@Id='<alert_id>']/@Severity               | Low                          |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                      |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | REO_COMPARISON_SUMMARY       |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | <ExternalTag>                |
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
    Krempa, Theodore - Input REO address previously owned by borrower
    """

    @dev_only
    Examples:
      | alert_id | ExternalTag                |
      | IDP_071  | LSF_INPUT_PREVIOUSLY_OWNED |

    @qa_only
    Examples:
      | alert_id | ExternalTag                    |
      | IDP_071  | IDP_REO_INPUT_PREVIOUSLY_OWNED |

  @IDP_072
  Scenario Outline: [IDP_072] LSFM IDP Borrower Alert Validation
  Unable to determine ownership of input REO.
  Either the borrower's name was not found to be associated with any transaction,
  or there is no transaction history available.
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged//Alert[@Id='<alert_id>']         |
    And the response has xpath
      | XPath                                             | expected                     |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                   |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                            |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                            |
      | //Alert[@Id='<alert_id>']/@Severity               | Low                          |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                      |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | REO_COMPARISON_SUMMARY       |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | IDP_REO_INPUT_NEVER_OWNED    |
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
    ALEXOSHI, JOSHUA - Unable to determine ownership of input REO.
    Either the borrower's name was not found to be associated with any transaction,
    or there is no transaction history available.
    """

    Examples:
      | alert_id |
      | IDP_072  |

  @IDP_073
  Scenario Outline: [IDP_073] LSFM IDP Borrower Alert Validation
  Difference between input REO and standardized input REO address used to match onfile
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged//Alert[@Id='<alert_id>']         |
    And the response has xpath
      | XPath                                             | expected                     |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                   |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                            |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                            |
      | //Alert[@Id='<alert_id>']/@Severity               | Low                          |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                      |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | REO_COMPARISON_SUMMARY       |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | <ExternalTag>                |
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
    CARRARZI, JAMES - Difference between input REO and standardized input REO address used to match onfile
    """

    @dev_only
    Examples:
      | alert_id | ExternalTag                       |
      | IDP_073  | LSF_DIFFERENCE_INPUT_STANDARDIZED |

    @qa_only
    Examples:
      | alert_id | ExternalTag                           |
      | IDP_073  | IDP_REO_DIFFERENCE_INPUT_STANDARDIZED |

  @IDP_075
  Scenario Outline: [IDP_075] LSFM IDP Borrower Alert Validation
  Possible liens or judgments found
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged//Alert[@Id='<alert_id>']         |
    And the response has xpath
      | XPath                                             | expected                     |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                   |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                            |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                            |
      | //Alert[@Id='<alert_id>']/@Severity               | High                         |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                      |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | LANDJ_SEARCH                 |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_LANDJ_FOUND              |
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
    IVANMILLE, JAMES - Possible liens or judgments found
    """

    Examples:
      | alert_id |
      | IDP_075  |

  @IDP_076
  Scenario Outline: [IDP_076] LSFM IDP Borrower Alert Validation
  L&J found have a release date, or an identifying word in the filing type indicating satisfaction.
  E.g., dismissal, withdrawal, release, satisfied
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged//Alert[@Id='<alert_id>']         |
    And the response has xpath
      | XPath                                             | expected                     |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                   |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                            |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                            |
      | //Alert[@Id='<alert_id>']/@Severity               | Info                         |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                      |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | LANDJ_SEARCH                 |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_LANDJ_FOUND_SAT          |
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
    IVANMILLE, JAMES - Possible satisfied liens or judgments found
    """

    Examples:
      | alert_id |
      | IDP_076  |

  @IDP_082
  Scenario Outline: [IDP_082] LSFM IDP Borrower Alert Validation
  Transaction is input as a refinance, but borrower does not appear to be the current owner.
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged//Alert[@Id='<alert_id>']         |
    And the response has xpath
      | XPath                                             | expected                     |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                   |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                            |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                            |
      | //Alert[@Id='<alert_id>']/@Severity               | High                         |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                      |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | LANDJ_SEARCH                 |
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
    IVANMILLE, JAMES - Possible liens or judgments found after the provided fund date; January 1, 2003
    """

    Examples:
      | alert_id |
      | IDP_082  |

  @IDP_084
  Scenario Outline: [IDP_084] LSFM IDP Borrower Alert Validation
  Transaction is input as a refinance, but borrower does not appear to be the current owner.
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged//Alert[@Id='<alert_id>']         |
    And the response has xpath
      | XPath                                             | expected                     |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                   |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                            |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                            |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium                       |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                      |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | <AnchorTag>                  |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_REFI_NOT_OWNED           |
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
    IVANMILLE, James - Transaction is input as a refinance, but borrower does not appear to be the current owner.
    """

    @dev_only
    Examples:
      | alert_id | AnchorTag      |
      | IDP_084  | ownerOccupancy |

    @qa_only
    Examples:
      | alert_id | AnchorTag         |
      | IDP_084  | HP_SUBJECT_DETAIL |

  @IDP_086
  Scenario Outline: [IDP_086] LSFM IDP Borrower Alert Validation
  PRE-PURCHASE: Borrower has had one or more foreclosures, or deed in lieu
  of foreclosure filings since subject loan closed.
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged//Alert[@Id='<alert_id>']         |
    And the response has xpath
      | XPath                                             | expected                     |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                   |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                            |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                            |
      | //Alert[@Id='<alert_id>']/@Severity               | High                         |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                      |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | BORROWER_ADDRESS_SUMMARY     |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_FRCL_POST_FUND           |
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
    PRE-PURCHASE: APARICIO, MARIO - Borrower has had one or more foreclosures,
    or deed in lieu of foreclosure filings since subject loan closed.
    """

    Examples:
      | alert_id |
      | IDP_086  |

  @IDP_087
  Scenario Outline: [IDP_087] LSFM IDP Borrower Alert Validation
  PRE-PURCHASE: Borrower has had one or more foreclosures, or deed in lieu
  of foreclosure filings since subject loan closed.
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged//Alert[@Id='<alert_id>']         |
    And the response has xpath
      | XPath                                             | expected                     |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                   |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                            |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                            |
      | //Alert[@Id='<alert_id>']/@Severity               | High                         |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                      |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | BORROWER_ADDRESS_SUMMARY     |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_NOD_POST_FUND            |
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
    PRE-PURCHASE: ELECTRONIC RGSTRTN, MORTGAGE - Borrower has had one or more NODs since subject loan closed.
    """

    Examples:
      | alert_id |
      | IDP_087  |

  @IDP_089
  Scenario Outline: [IDP_089] LSFM IDP Borrower Alert Validation
  PRE-PURCHASE: Borrower has purchased one or more properties after subject loan closed.
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged//Alert[@Id='<alert_id>']         |
    And the response has xpath
      | XPath                                             | expected                     |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                   |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                            |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                            |
      | //Alert[@Id='<alert_id>']/@Severity               | High                         |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                      |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | BORROWER_ADDRESS_SUMMARY     |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_PURCH_POST_FUND          |
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
    PRE-PURCHASE: APARICIO, MARIO - Borrower has purchased one or more properties after subject loan closed.
    """

    Examples:
      | alert_id |
      | IDP_089  |

  @IDP_091
  Scenario Outline: [IDP_091] LSFM IDP Borrower Alert Validation
  LSF_BANKRUPTCY_ALERT=Y
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged//Alert[@Id='<alert_id>']         |
    And the response has xpath
      | XPath                                             | expected                     |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                   |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                            |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                            |
      | //Alert[@Id='<alert_id>']/@Severity               | High                         |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                      |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | IDENTITY_DETAIL_BK           |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_BANKRUPTCY_OVER_7_YEARS  |
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
    Ardur, James - Borrower has filed one or more bankruptcies more than 7 years ago.
    """

    Examples:
      | alert_id |
      | IDP_091  |

  @IDP_093
  Scenario Outline: [IDP_093] LSFM IDP Borrower Alert Validation
  Borrower's previously owned property had an NOD and a Foreclosure.
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged//Alert[@Id='<alert_id>']         |
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
      | //Alert[@Id='<alert_id>']/@ExternalTag            | NOD_FRCL_FOUND               |
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
    Becker, Daniel - Borrower's previously owned property had an NOD and a Foreclosure.
    """

    Examples:
      | alert_id |
      | IDP_093  |

  @IDP_094
  Scenario Outline: [IDP_094] LSFM IDP Borrower Alert Validation
  Potential undisclosed REO. Property is disclosed on at least one, but not all borrowers who appear to own it.
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged//Alert[@Id='<alert_id>']         |
    And the response has xpath
      | XPath                                             | expected                      |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT  |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                    |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                             |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                             |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium                        |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 1                             |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                       |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | REO_COMPARISON_SUMMARY        |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | IDP_REO_NOT_DISCLOSED_FOR_ALL |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable                    |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                         |
      | //Alert[@Id='<alert_id>']/@Category               | Borrower                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                       |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                       |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                       |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                       |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                       |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                             |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Castillo, Mary - Potential undisclosed REO. Property is disclosed on at least one,
    but not all borrowers who appear to own it.
    """

    Examples:
      | alert_id |
      | IDP_094  |

  @IDP_095
  Scenario Outline: [IDP_095] LSFM IDP Borrower Alert Validation
  Potential undisclosed REO. Current address not disclosed as REO although borrower appears to own it.
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged//Alert[@Id='<alert_id>']         |
    And the response has xpath
      | XPath                                             | expected                          |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT      |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                        |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                                 |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                                 |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium                            |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                                 |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                           |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | REO_COMPARISON_SUMMARY            |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | IDP_REO_NOT_DISCLOSED_FOR_CURRENT |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable                        |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                             |
      | //Alert[@Id='<alert_id>']/@Category               | Borrower                          |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                           |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                           |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                           |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                           |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                           |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                                 |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Taylor, William T. - Potential undisclosed REO.
    Current address not disclosed as REO although borrower appears to own it.
    """

    Examples:
      | alert_id |
      | IDP_095  |

  @IDP_097
  Scenario Outline: [IDP_097] LSFM IDP Borrower Alert Validation
  Borrower has had one or more foreclosures, or deed in lieu of foreclosure filings in the past 3 years.
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged//Alert[@Id='<alert_id>']         |
    And the response has xpath
      | XPath                                             | expected                     |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                   |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                            |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                            |
      | //Alert[@Id='<alert_id>']/@Severity               | High                         |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                      |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | BORROWER_ADDRESS_SUMMARY     |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_FCL_3YRS                 |
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
    ANDRADE, JORGE - Borrower has had one or more foreclosures,
    or deed in lieu of foreclosure filings in the past 3 years.
    """

    Examples:
      | alert_id |
      | IDP_097  |

  @IDP_098
  Scenario Outline: [IDP_098] LSFM IDP Borrower Alert Validation
  Occupancy is input as an investment or second home, and borrower has had a foreclosure,
  or deed in lieu of foreclosure filings in the past 7 years.
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged//Alert[@Id='<alert_id>']         |
    And the response has xpath
      | XPath                                             | expected                     |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                   |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                            |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                            |
      | //Alert[@Id='<alert_id>']/@Severity               | High                         |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                      |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | BORROWER_ADDRESS_SUMMARY     |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_FCL_7YRS_INVEST_2ND      |
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
    COC, DOTTOR CHRISTINA L - Occupancy is input as an investment or second home, and borrower has had a foreclosure,
    or deed in lieu of foreclosure filings in the past 7 years.
    """

    Examples:
      | alert_id |
      | IDP_098  |

  @IDP_099 @ignore
  Scenario Outline: [IDP_099] LSFM IDP Borrower Alert Validation.
  Alert fires when the property is listed as currently owned and is for sale (as well as REO listed)
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp<alert_id>_<reo>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER'][@Heading='OCCUPANCY & UNDISCLOSED DEBT'] |
      | //Category[@Name='BORROWER']/Flagged//Alert[@Id='<alert_id>']         |
    And the response has xpath
      | XPath                                             | expected                            |
      | //Category[@Name='BORROWER']/@Heading             | OCCUPANCY & UNDISCLOSED DEBT        |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                          |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                                   |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                                   |
      | //Alert[@Id='<alert_id>']/@Severity               | High                                |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                                   |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                             |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | BORROWER_ADDRESS_SUMMARY            |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_CURRENTLY_OWNED_LISTED_FOR_SALE |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable                          |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                               |
      | //Alert[@Id='<alert_id>']/@Category               | Borrower                            |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                             |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                             |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                             |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                             |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                             |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                                   |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    ODONNELL, BRIAN - Borrower owns one or more properties,
    other than the subject property, that show listed for sale on MLS.
    """

    Examples:
      | alert_id | reo     |
      | IDP_099  | Non_REO |
      | IDP_099  | REO     |

