@api
@fcra
@lsfm
@section
@property_detail
@subject_property_report_and_details
Feature: LSFM FCRA - Property Detail Section - Subject Property Report And Details

  @MADLRVP-10462
  Scenario Outline: [MADLRVP-10462] Verify LSFM FCRA - HP_050 alert is fired
    Given the request XML filepath is /ript/fcra/lsfm/sections/property_detail/MADLRVP-10462.xml
    When the LSFM FCRA request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']             |
      | //Category[@Name='PROPERTY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected           |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY           |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>         |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                  |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                  |
      | //Alert[@Id='<alert_id>']/@Severity               | High               |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]            |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_SUBJECT_REPORT  |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_PRIVATE_LENDER |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable         |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud              |
      | //Alert[@Id='<alert_id>']/@Category               | Property           |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]            |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                  |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    The subject property has had a private lender in the past 20 year(s).
    """
    And the response has xpath //Alert[@Id='<alert_id>']/@Recommendation with value (ignoring newline and spaces)
    """
    Verify the private lender's background and obtain a copy of the Note.
    Request proof of deposit from the private loan proceeds.
    Request canceled checks for payment history.
    """

    Examples:
      | alert_id |
      | HP_050   |
