@api
@non_fcra
@lsfm
@alerts
@cust
@income
Feature: LSFM CUST Income Alerts

  @CUST_001
  Scenario Outline: [CUST_001] LSFM CUST Income Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/cust/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='INCOME'][@Heading='INCOME EMPLOYMENT']    |
      | //Category[@Name='INCOME']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected           |
      | //Category[@Name='INCOME']/@Heading               | INCOME EMPLOYMENT  |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>         |
      | //Alert[@Id='<alert_id>']/@Active                 | <active>           |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                  |
      | //Alert[@Id='<alert_id>']/@Severity               | High               |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                  |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]            |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | [empty]            |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_EMPLOMENT_FLAG |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable         |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud              |
      | //Alert[@Id='<alert_id>']/@Category               | Income             |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]            |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                  |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Ardmille, Kelly - Borrower income pattern of employer, position, and earnings indicates potential fraud risk.
    """

    @qa_only
    Examples:
      | alert_id | active |
      | CUST_001 | 0      |

    @uat_only
    Examples:
      | alert_id | active |
      | CUST_001 | 1      |