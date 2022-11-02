@api
@non_fcra
@lsfm
@alerts
@hp
@borrower
Feature: LSFM HP Borrower Alerts

  @HP_022
  Scenario Outline: [HP_022] LSFM HP Borrower Alert Validation
  This alert is not a duplicate. This alert is dependent upon the mailing address not matching
  the subject BORROWER address.  This applies specifically to a refinance of the primary residence.
  This alert excludes mailing address that are PO Boxes
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/hp/<alert_id>.xml
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
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_SUBJ_MAIL_DIFF           |
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
    Werczberger, Jacob - The subject property is a refinance of a primary residence,
    and the mailing address reported by the tax assessor is not the subject property or a PO Box.
    """

    Examples:
      | alert_id |
      | HP_022   |

