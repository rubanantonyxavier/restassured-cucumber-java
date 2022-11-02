@api
@non_fcra
@lsfm
@alerts
@rds
@borrower
Feature: LSFM RDS Borrower Alerts

  @RDS_005
  Scenario Outline: [RDS_005] LSFM RDS Borrower Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/rds/<alert_id>.xml
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
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_OCC_INT                  |
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
    Le Torres, Quynh Thu - Borrower owns one or more properties with a higher value
    or size than the declared owner occupied property
    """

    Examples:
      | alert_id |
      | RDS_005  |

  @RDS_006
  Scenario Outline: [RDS_006] LSFM RDS Borrower Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/rds/<alert_id>.xml
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
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_OCC_INT_MED              |
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
    Castillo, Mary - Borrower owns one or more properties that
    may have a higher value or size than the declared owner occupied property
    """

    Examples:
      | alert_id |
      | RDS_006  |

  @RDS_007
  Scenario Outline: [RDS_007] LSFM RDS Borrower Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/rds/<alert_id>.xml
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
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_OCC_INT_MF               |
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
    Werczberger, Jacob - Low probability that subject property will be owner occupied
    Borrower currently owns 1 or more properties and subject property is listed as multi-family
    """

    Examples:
      | alert_id |
      | RDS_007  |

