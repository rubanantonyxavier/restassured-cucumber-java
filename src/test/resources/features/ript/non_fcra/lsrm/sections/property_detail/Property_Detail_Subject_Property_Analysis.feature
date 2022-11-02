@api
@non_fcra
@lsrm
@section
@property_detail
@subject_property_analysis
Feature: LSRM - Property Detail - Subject Property Analysis

  @MADLRVP-10449
  Scenario Outline: [MADLRVP-10449] Verify LSRM - Zip different for standardized address than input - HP_049 is fired
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/property_detail/MADLRVP-10449.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']             |
      | //Category[@Name='PROPERTY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                            |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY                            |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                          |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                                   |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                                   |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium                              |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]                             |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                             |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_SUBJECT_REPORT                   |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_SUBJ_STANDARDIZED_ZIP_DIFFERENT |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable                          |
      | //Alert[@Id='<alert_id>']/@Classification         | Collateral                          |
      | //Alert[@Id='<alert_id>']/@Category               | Property                            |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                             |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                             |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                             |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                             |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                             |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                                   |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Input subject property address was standardized to a different zip code.
    """
    And the response has xpath //Alert[@Id='<alert_id>']/@Recommendation with value (ignoring newline and spaces)
    """
    See Subject Property FAQ's. Populate APN and rerun the report.
    """

    Examples:
      | alert_id |
      | HP_049   |