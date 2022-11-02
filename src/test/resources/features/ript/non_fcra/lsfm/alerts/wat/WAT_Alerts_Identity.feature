@api
@non_fcra
@lsfm
@alerts
@wat
@identity
Feature: LSFM WAT Identity Alerts

  @WAT_013
  Scenario Outline: [WAT_013] LSFM WAT Identity Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/wat/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='IDENTITY'][@Heading='IDENTITY']             |
      | //Category[@Name='IDENTITY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected            |
      | //Category[@Name='IDENTITY']/@Heading             | IDENTITY            |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>          |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                   |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                   |
      | //Alert[@Id='<alert_id>']/@Severity               | High                |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                   |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]             |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | IDP_IDENTITY_DETAIL |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | BRWR_OFAC           |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable          |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud               |
      | //Alert[@Id='<alert_id>']/@Category               | Identity            |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]             |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                   |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    KAYAKIRAN, EVREN - A record that includes the name and date of birth provided was found on the OFAC list.
    """

    Examples:
      | alert_id |
      | WAT_013  |

  @WAT_014
  Scenario Outline: [WAT_014] LSFM WAT Identity Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/wat/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='IDENTITY'][@Heading='IDENTITY']             |
      | //Category[@Name='IDENTITY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected        |
      | //Category[@Name='IDENTITY']/@Heading             | IDENTITY        |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>      |
      | //Alert[@Id='<alert_id>']/@Active                 | 1               |
      | //Alert[@Id='<alert_id>']/@Status                 | Y               |
      | //Alert[@Id='<alert_id>']/@Severity               | High            |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0               |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]         |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | WAT_GOV_DETAILS |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | BRWR_SAM_GOV    |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable      |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud           |
      | //Alert[@Id='<alert_id>']/@Category               | Identity        |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]         |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]         |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]         |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]         |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]         |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N               |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    MICHAEL, HICKS - Possible match found on SAM.gov
    """

    Examples:
      | alert_id |
      | WAT_014  |

  @WAT_015
  Scenario Outline: [WAT_015] LSFM WAT Identity Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/wat/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='IDENTITY'][@Heading='IDENTITY']             |
      | //Category[@Name='IDENTITY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected        |
      | //Category[@Name='IDENTITY']/@Heading             | IDENTITY        |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>      |
      | //Alert[@Id='<alert_id>']/@Active                 | 1               |
      | //Alert[@Id='<alert_id>']/@Status                 | Y               |
      | //Alert[@Id='<alert_id>']/@Severity               | High            |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 2               |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]         |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | WAT_GOV_DETAILS |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | BRWR_HUD        |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable      |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud           |
      | //Alert[@Id='<alert_id>']/@Category               | Identity        |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]         |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]         |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]         |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]         |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]         |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N               |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    KAYE-EDDIE, EMILY - Possible match found on HUD LDP
    """

    Examples:
      | alert_id |
      | WAT_015  |

  @WAT_016
  Scenario Outline: [WAT_016] LSFM WAT Identity Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/wat/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='IDENTITY'][@Heading='IDENTITY']             |
      | //Category[@Name='IDENTITY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected        |
      | //Category[@Name='IDENTITY']/@Heading             | IDENTITY        |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>      |
      | //Alert[@Id='<alert_id>']/@Active                 | 1               |
      | //Alert[@Id='<alert_id>']/@Status                 | Y               |
      | //Alert[@Id='<alert_id>']/@Severity               | High            |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 3               |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]         |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | WAT_GOV_DETAILS |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | BRWR_FHFA       |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable      |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud           |
      | //Alert[@Id='<alert_id>']/@Category               | Identity        |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]         |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]         |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]         |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]         |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]         |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N               |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Cobb, Donna - Possible match found on FHFA SCP
    """

    Examples:
      | alert_id |
      | WAT_016  |

  @WAT_031
  Scenario Outline: [WAT_031] LSFM WAT Identity Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/wat/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='IDENTITY'][@Heading='IDENTITY']             |
      | //Category[@Name='IDENTITY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                   |
      | //Category[@Name='IDENTITY']/@Heading             | IDENTITY                   |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                 |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                          |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                          |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium                     |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 1                          |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                    |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | NONE                       |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_MISSING_DOB_OFAC_CHECK |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable                 |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                      |
      | //Alert[@Id='<alert_id>']/@Category               | Identity                   |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                    |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                    |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                    |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                    |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                    |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                          |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    AGUILAR, CARLOS - OFAC search results could not be returned due to insufficient input data
    and/or insufficient identifying information available on the OFAC list.
    """

    Examples:
      | alert_id |
      | WAT_031  |

