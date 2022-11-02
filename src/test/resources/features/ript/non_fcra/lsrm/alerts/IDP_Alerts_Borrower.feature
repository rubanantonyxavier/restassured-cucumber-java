@api
@non_fcra
@lsrm
@alerts
@idp
@borrower
Feature: LSRM IDP Borrower Alerts

  @IDP_084
  Scenario Outline: [IDP_084] LSRM IDP Borrower Alert Validation
  Transaction is input as a refinance, but borrower does not appear to be the current owner.
    Given the request XML filepath is /ript/non_fcra/lsrm/alerts/<alert_id>.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
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
    Ardmille, Kelly - Transaction is input as a refinance, but borrower does not appear to be the current owner.
    """

    @dev_only
    Examples:
      | alert_id | AnchorTag      |
      | IDP_084  | ownerOccupancy |

    @qa_only
    Examples:
      | alert_id | AnchorTag         |
      | IDP_084  | HP_SUBJECT_DETAIL |
    