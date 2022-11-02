@api
@non_fcra
@lsfm
@alerts
@idp
@income
Feature: LSFM IDP Income Alerts

  @IDP_006
  Scenario Outline: [IDP_006] LSFM IDP Income Alert Validation
  Based on calculated subject property address distance from employer address.
  Requires employer address input data to produce alert.
  Logic is for borrower 1 and 2.
  Uses the verified employer address unless we didn’t find one, then it uses the input employer address
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='INCOME'][@Heading='INCOME EMPLOYMENT']    |
      | //Category[@Name='INCOME']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected          |
      | //Category[@Name='INCOME']/@Heading               | INCOME EMPLOYMENT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>        |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                 |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                 |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium            |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                 |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]           |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | IV_EMP_SITEMAP    |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_EMPL_LOC      |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational     |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud             |
      | //Alert[@Id='<alert_id>']/@Category               | Income            |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]           |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                 |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    GOLDETTA, ROWENA - Subject property location compared
    to borrower's employment location is outside normal distance range
    """

    Examples:
      | alert_id |
      | IDP_006  |

  @IDP_008
  Scenario Outline: [IDP_008] LSFM IDP Income Alert Validation
  Borrower is not self-employed and employer address is a residential property.
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
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
      | //Alert[@Id='<alert_id>']/@Active                 | 1                  |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                  |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium             |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                  |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]            |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | IV_EMP_SITEMAP     |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_EMPLYR_ADD_RES |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational      |
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
    KIRKARZI, HOWARD - Borrower is not self-employed and employer address is a residential property.
    """

    Examples:
      | alert_id |
      | IDP_008  |

