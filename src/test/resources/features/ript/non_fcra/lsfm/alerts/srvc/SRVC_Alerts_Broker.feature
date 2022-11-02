@api
@non_fcra
@lsfm
@alerts
@srvc
@broker
Feature: LSFM SRVC Broker Alerts

  @SRVC_002
  Scenario Outline: [SRVC_002] LSFM SRVC Broker Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/srvc/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BROKER'][@Heading='THIRD PARTY']          |
      | //Category[@Name='BROKER']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                        |
      | //Category[@Name='BROKER']/@Heading               | THIRD PARTY                     |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                      |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                               |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                               |
      | //Alert[@Id='<alert_id>']/@Severity               | High                            |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]                         |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                         |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | SearchSummaryAnchor             |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | SRVC_FHLMC_SERVICER_ID_NOTFOUND |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable                      |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                           |
      | //Alert[@Id='<alert_id>']/@Category               | Broker                          |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                         |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                         |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                         |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                         |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                         |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                               |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Your organization's onfile Freddie Mac Seller/Servicer number was not found in our list of current
    Freddie Mac Seller/Servicer IDs. Entities were not screened against the Freddie Mac Exclusionary List.
    """

    Examples:
      | alert_id |
      | SRVC_002 |
