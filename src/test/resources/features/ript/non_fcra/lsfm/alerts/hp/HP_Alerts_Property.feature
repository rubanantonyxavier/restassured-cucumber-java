@api
@non_fcra
@lsfm
@alerts
@hp
@property
Feature: LSFM HP Property Alerts

  @HP_001
  @MADLRVP-10398
  @market_analysis
  Scenario Outline: [HP_001] LSFM HP Property Alert Validation
  Determine whether or not the Subject Property Address has a known "disaster"
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/hp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']             |
      | //Category[@Name='PROPERTY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected              |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY              |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>            |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                     |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                     |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium                |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]               |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]               |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_MARKET_ANALYSIS    |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_SUB_PROP_DISASTER |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable            |
      | //Alert[@Id='<alert_id>']/@Classification         | Collateral            |
      | //Alert[@Id='<alert_id>']/@Category               | Property              |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]               |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                     |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Subject property is located in a zip code and county declared as a FEMA Disaster Area,
    with a disaster type that could impact property condition.
    """

    Examples:
      | alert_id |
      | HP_001   |

  @HP_002
  Scenario Outline: [HP_002] LSFM HP Property Alert Validation
  Based on county land use code
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/hp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']             |
      | //Category[@Name='PROPERTY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected            |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY            |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>          |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                   |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                   |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium              |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]             |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]             |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_SUBJECT_ANALYSIS |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_SUB_PROP_RES    |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational       |
      | //Alert[@Id='<alert_id>']/@Classification         | Collateral          |
      | //Alert[@Id='<alert_id>']/@Category               | Property            |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]             |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                   |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Our records indicate that the subject property is not listed as residential
    """

    Examples:
      | alert_id |
      | HP_002   |

  @HP_004
  Scenario Outline: [HP_004] LSFM HP Property Alert Validation
  Determine whether or not the subject property is in the GR_ASSESSOR table
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/hp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']             |
      | //Category[@Name='PROPERTY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY                |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>              |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                       |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                       |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium                  |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]                 |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                 |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_SUBJECT_DETAIL       |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_SUB_PROP_ADD_STATUS |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational           |
      | //Alert[@Id='<alert_id>']/@Classification         | Collateral              |
      | //Alert[@Id='<alert_id>']/@Category               | Property                |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                 |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                 |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                 |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                 |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                 |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                       |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Subject Property Address could not be found in Public Assessor Data.
    However, the geographic location of the address was determined and nearby market data may be available.
    """

    Examples:
      | alert_id |
      | HP_004   |

  @HP_005
  Scenario Outline: [HP_005] LSFM HP Property Alert Validation
  Need to use the "neighborhood" (Census Tract) use codes and determine the percentage of properties
  that have "mobile home" as the use code.
  This is a configurable alert, so we should output the actual value (percentage)
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/hp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']             |
      | //Category[@Name='PROPERTY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected             |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY             |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>           |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                    |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                    |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium               |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]              |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]              |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_MARKET_ANALYSIS   |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_SUB_PRP_MBL_HOME |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational        |
      | //Alert[@Id='<alert_id>']/@Classification         | Collateral           |
      | //Alert[@Id='<alert_id>']/@Category               | Property             |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]              |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                    |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Subject property located in an area with high density of mobile homes
    """

    Examples:
      | alert_id |
      | HP_005   |

  @HP_006
  Scenario Outline: [HP_006] LSFM HP Property Alert Validation
  Based on subject property recorded sales transaction within the last year
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/hp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']             |
      | //Category[@Name='PROPERTY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                   |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY                   |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                 |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                          |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                          |
      | //Alert[@Id='<alert_id>']/@Severity               | Low                        |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]                    |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                    |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_SUBJECT_REPORT          |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_SUB_PROP_SALES_LAST_YR |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational              |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                      |
      | //Alert[@Id='<alert_id>']/@Category               | Property                   |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                    |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                    |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                    |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                    |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                    |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                          |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Subject property has sold or transferred in the last 1 year
    """

    Examples:
      | alert_id |
      | HP_006   |

  @HP_007
  Scenario Outline: [HP_007] LSFM HP Property Alert Validation
  The exact match for the subject property was not found.
  The market related data will be more relevant for review than the subject specific data
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/hp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']             |
      | //Category[@Name='PROPERTY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY                |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>              |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                       |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                       |
      | //Alert[@Id='<alert_id>']/@Severity               | Low                     |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]                 |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                 |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_SUBJECT_REPORT       |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_SUB_PROP_UNIT_MATCH |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable              |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                   |
      | //Alert[@Id='<alert_id>']/@Category               | Property                |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                 |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                 |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                 |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                 |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                 |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                       |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    No exact match for the subject property was found and therefore some property-specific alerts have been suppressed.
    Market data and a closely matching property have been returned.
    """

    Examples:
      | alert_id |
      | HP_007   |

  @HP_008
  Scenario Outline: [HP_008] LSFM HP Property Alert Validation
  Liens must be similar amount, different lender and within a short period (45 days) of each other
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/hp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']             |
      | //Category[@Name='PROPERTY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected          |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY          |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>        |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                 |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                 |
      | //Alert[@Id='<alert_id>']/@Severity               | High              |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]           |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]           |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_SUBJECT_DETAIL |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_SUB_MULTILIEN |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational     |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud             |
      | //Alert[@Id='<alert_id>']/@Category               | Property          |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]           |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                 |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Possible simultaneous loan closings in sales history - at least 2 active liens with similar loan amounts
    """

    Examples:
      | alert_id |
      | HP_008   |

  @HP_010
  Scenario Outline: [HP_010] LSFM HP Property Alert Validation
  The subject price per sqft is 25% higher than the average sqft of the nearby sales sample
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/hp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']             |
      | //Category[@Name='PROPERTY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected          |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY          |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>        |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                 |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                 |
      | //Alert[@Id='<alert_id>']/@Severity               | High              |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]           |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]           |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_SUBJECT_REPORT |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_PRICE_SQFT    |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational     |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud             |
      | //Alert[@Id='<alert_id>']/@Category               | Property          |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]           |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                 |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    The subject property price per sq ft is 25% higher than the average of the nearby sales
    """

    Examples:
      | alert_id |
      | HP_010   |

  @HP_011
  Scenario Outline: [HP_011] LSFM HP Property Alert Validation
  Subject Property Address could not be found in USPS data or Public Assessor Data.
  The location of the address could not be determined.
  No property or nearby market data is available.
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/hp/<alert_id>.xml
    When the request is sent
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
      | //Alert[@Id='<alert_id>']/@Severity               | Medium             |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]            |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_PROPERTY_DETAIL |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_HP_NOHIT       |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational      |
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
    Subject Property Address could not be found in USPS data or Public Assessor Data.
    The location of the address could not be determined.  No property or nearby market data is available.
    """

    Examples:
      | alert_id |
      | HP_011   |

  @HP_012
  Scenario Outline: [HP_012] LSFM HP Property Alert Validation
  Alert is triggered off of one or more transactions in the past 90 days
  and includes all transactions on the property (i.e.: resale, foreclosure, quit claim, HELOC, Refi, etc.)
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/hp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']             |
      | //Category[@Name='PROPERTY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected              |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY              |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>            |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                     |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                     |
      | //Alert[@Id='<alert_id>']/@Severity               | Low                   |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]               |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]               |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_SUBJECT_DETAIL     |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | HP_90_DAY_TRANS_ALERT |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational         |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                 |
      | //Alert[@Id='<alert_id>']/@Category               | Property              |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]               |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                     |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Subject property has at least one transaction (resale, refinance, quit claim, or other) in the last 90 days
    """

    Examples:
      | alert_id |
      | HP_012   |

  @HP_013
  Scenario Outline: [HP_013] LSFM HP Property Alert Validation
  Valuation engine in LoanSafe is basic indicator of identifying value concerns
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/hp/<alert_id>.xml
    When the request is sent
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
      | //Alert[@Id='<alert_id>']/@Severity               | Medium             |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]            |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_MARKET_ANALYSIS |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_SUBJ_VARIANCE  |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational      |
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
    The appraisal value/estimate is significantly higher than the median value of the nearby sales
    """

    Examples:
      | alert_id |
      | HP_013   |

  @HP_018
  Scenario Outline: [HP_018] LSFM HP Property Alert Validation
  Determine if the property has a foreclosure in the last 3 years
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/hp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']             |
      | //Category[@Name='PROPERTY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                         |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY                         |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                       |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                                |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                                |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium                           |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]                          |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                          |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_SUBJECT_DETAIL                |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | HP_SUBJ_FORECLOSURE_LAST_3_YEARS |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational                    |
      | //Alert[@Id='<alert_id>']/@Classification         | Collateral                       |
      | //Alert[@Id='<alert_id>']/@Category               | Property                         |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                          |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                          |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                          |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                          |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                          |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                                |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Property has foreclosure in last 3 years
    """

    Examples:
      | alert_id |
      | HP_018   |

  @HP_019
  Scenario Outline: [HP_019] LSFM HP Property Alert Validation
  Does the subject property address match to the CondoTel database and show as a KNOWN Condotel?
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/hp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']             |
      | //Category[@Name='PROPERTY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected             |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY             |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>           |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                    |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                    |
      | //Alert[@Id='<alert_id>']/@Severity               | High                 |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]              |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]              |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | CONDOTEL_INFORMATION |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_CONDOTEL         |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational        |
      | //Alert[@Id='<alert_id>']/@Classification         | Collateral           |
      | //Alert[@Id='<alert_id>']/@Category               | Property             |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]              |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                    |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Subject property is located at a site where some units may be classified as condo-hotels
    """

    Examples:
      | alert_id |
      | HP_019   |

  @HP_023
  Scenario Outline: [HP_023] LSFM HP Property Alert Validation
  Subject property has sold or transferred with a value > 0  within the last 90 days
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/hp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']             |
      | //Category[@Name='PROPERTY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected          |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY          |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>        |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                 |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                 |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium            |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]           |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]           |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_SUBJECT_DETAIL |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_HUD_90DAY     |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational     |
      | //Alert[@Id='<alert_id>']/@Classification         | Collateral        |
      | //Alert[@Id='<alert_id>']/@Category               | Property          |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]           |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                 |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Subject property has sold or transferred with a value > 0 within the last 90 days
    """

    Examples:
      | alert_id |
      | HP_023   |

  @HP_024
  Scenario Outline: [HP_024] LSFM HP Property Alert Validation
  Subject property has sold or transferred with a value > 0 within the past 6 months.
  The current value is greater than 100% of the last recorded value.
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/hp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']             |
      | //Category[@Name='PROPERTY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected          |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY          |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>        |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                 |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                 |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium            |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]           |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]           |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_SUBJECT_DETAIL |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_HUD_91_180DAY |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational     |
      | //Alert[@Id='<alert_id>']/@Classification         | Collateral        |
      | //Alert[@Id='<alert_id>']/@Category               | Property          |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]           |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                 |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Subject property has sold or transferred with a value > 0 within the past 6 months.
    The current value is greater than 100% of the last recorded value.
    """

    Examples:
      | alert_id |
      | HP_024   |

  @HP_025
  Scenario Outline: [HP_025] LSFM HP Property Alert Validation
  Subject property has sold or transferred with a value > 0 within the past 12 months.
  The current price has increased more than 5% from the last transaction value.
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/hp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']             |
      | //Category[@Name='PROPERTY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected             |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY             |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>           |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                    |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                    |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium               |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]              |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]              |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_SUBJECT_DETAIL    |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_HUD_181DAY_12MOS |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational        |
      | //Alert[@Id='<alert_id>']/@Classification         | Collateral           |
      | //Alert[@Id='<alert_id>']/@Category               | Property             |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]              |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                    |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Subject property has sold or transferred with a value > 0 within the past 12 months.
    The current price has increased more than 5% from the last transaction value.
    """

    Examples:
      | alert_id |
      | HP_025   |

  @HP_026
  Scenario Outline: [HP_026] LSFM HP Property Alert Validation
  Input value is consistent with the current median value and the last sale (within 12 months) was
  lower than the current median.  Specific logic: If prior sale was below market median value by 10% or
  more and current sale is 95%-110% of market median value.  Market is defined as Nearby Sales.
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/hp/<alert_id>.xml
    When the request is sent
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
      | //Alert[@Id='<alert_id>']/@Severity               | Low                |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]            |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_SUBJECT_DETAIL  |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_CURRVAL_MARKET |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational      |
      | //Alert[@Id='<alert_id>']/@Classification         | Collateral         |
      | //Alert[@Id='<alert_id>']/@Category               | Property           |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]            |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                  |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Prior sale occurred in last 12 months and was below median value for market.
    Current value is consistent with market.
    """

    Examples:
      | alert_id |
      | HP_026   |

  @HP_027
  Scenario Outline: [HP_027] LSFM HP Property Alert Validation
  Input value is higher than the current median value and the last sale (within 12 months)
  was lower than the current median. Specific logic: If prior sale was below market median value by 10% or
  more and current sale is at least 10% higher than market median value. Market is defined as Nearby Sales
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/hp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']             |
      | //Category[@Name='PROPERTY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected          |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY          |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>        |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                 |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                 |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium            |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]           |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]           |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_SUBJECT_DETAIL |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_CURRVAL_HIGH  |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational     |
      | //Alert[@Id='<alert_id>']/@Classification         | Collateral        |
      | //Alert[@Id='<alert_id>']/@Category               | Property          |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]           |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                 |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Prior sale occurred in last 12 months and was below median value for market.
    Current value is higher than market median value.
    """

    Examples:
      | alert_id |
      | HP_027   |

  @HP_032
  Scenario Outline: [HP_032] LSFM HP Property Alert Validation
  Possible property flipping conditions – Subject has sold one or more times
  in the last 12 months with a gain of at least 50% from the lowest sale value
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/hp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']             |
      | //Category[@Name='PROPERTY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected             |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY             |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>           |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                    |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                    |
      | //Alert[@Id='<alert_id>']/@Severity               | High                 |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]              |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]              |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_SUBJECT_DETAIL    |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_HIGH_FLIP_RISK_1 |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational        |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                |
      | //Alert[@Id='<alert_id>']/@Category               | Property             |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]              |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                    |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Possible property flipping conditions Subject has sold one or more times
    in the last 12 months with a gain of at least 50.0% from the lowest sale value
    """

    Examples:
      | alert_id |
      | HP_032   |

  @HP_033
  Scenario Outline: [HP_033] LSFM HP Property Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/hp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']             |
      | //Category[@Name='PROPERTY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected             |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY             |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>           |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                    |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                    |
      | //Alert[@Id='<alert_id>']/@Severity               | High                 |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]              |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]              |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_SUBJECT_DETAIL    |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_HIGH_FLIP_RISK_2 |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational        |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                |
      | //Alert[@Id='<alert_id>']/@Category               | Property             |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]              |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                    |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Possible property flipping conditions Subject has sold one or more times
    in the last 18 months with a gain of at least 75.0% from the lowest sale value
    """

    Examples:
      | alert_id |
      | HP_033   |

  @HP_034
  Scenario Outline: [HP_034] LSFM HP Property Alert Validation
  Possible property flipping conditions – Subject has sold one or more times in the last 24 months
  with a gain of at least 100% from the lowest sale value
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/hp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']             |
      | //Category[@Name='PROPERTY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected             |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY             |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>           |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                    |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                    |
      | //Alert[@Id='<alert_id>']/@Severity               | High                 |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]              |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]              |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_SUBJECT_DETAIL    |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_HIGH_FLIP_RISK_3 |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational        |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                |
      | //Alert[@Id='<alert_id>']/@Category               | Property             |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]              |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                    |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Possible property flipping conditions  Subject has sold one or more times in the last 24 months
    with a gain of at least 100.0% from the lowest sale value
    """

    Examples:
      | alert_id |
      | HP_034   |

  @HP_035
  Scenario Outline: [HP_035] LSFM HP Property Alert Validation
  Collateral Risk Score not available due to missing input. Customer estimate or loan amount are required.
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/hp/<alert_id>.xml
    When the request is sent
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
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_MARKET_ANALYSIS |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | REQ_INPUT_MISSING  |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational      |
      | //Alert[@Id='<alert_id>']/@Classification         | Collateral         |
      | //Alert[@Id='<alert_id>']/@Category               | Property           |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]            |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                  |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Collateral Risk Score not available due to missing input. Customer estimate or loan amount are required.
    """

    Examples:
      | alert_id |
      | HP_035   |

  @HP_036
  Scenario Outline: [HP_036] LSFM HP Property Alert Validation
  Property experienced a distressed event in the last 3 years (either notice of default or foreclosure)
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/hp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']             |
      | //Category[@Name='PROPERTY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected          |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY          |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>        |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                 |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                 |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium            |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]           |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]           |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_SUBJECT_DETAIL |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | DISTRESSED_EVENT  |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational     |
      | //Alert[@Id='<alert_id>']/@Classification         | Collateral        |
      | //Alert[@Id='<alert_id>']/@Category               | Property          |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]           |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                 |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Property experienced a distressed event in the last 3 years (either notice of default or foreclosure)
    """

    Examples:
      | alert_id |
      | HP_036   |

  @HP_037
  Scenario Outline: [HP_037] LSFM HP Property Alert Validation
  Seller on purchase transaction has been identified as a corporate entity or LLC
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/hp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']             |
      | //Category[@Name='PROPERTY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected          |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY          |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>        |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                 |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                 |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium            |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]           |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]           |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_SUBJECT_DETAIL |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | HP_LLC_SELLER     |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational     |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud             |
      | //Alert[@Id='<alert_id>']/@Category               | Property          |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]           |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                 |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Seller on purchase transaction has been identified as a corporate entity or LLC
    """

    Examples:
      | alert_id |
      | HP_037   |

  @HP_042
  Scenario Outline: [HP_042] LSFM HP Property Alert Validation
  The subject property is located in the same zip9 as a Superfund site (an uncontrolled
  or abandoned place where hazardous waste is located) recognized by the EPA.
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/hp/<alert_id>.xml
    When the request is sent
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
      | //Alert[@Id='<alert_id>']/@Severity               | Medium             |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]            |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_MARKET_ANALYSIS |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_SUPERFUND      |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational      |
      | //Alert[@Id='<alert_id>']/@Classification         | Collateral         |
      | //Alert[@Id='<alert_id>']/@Category               | Property           |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]            |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]            |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                  |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    The subject property is located in the same zip9 as a Superfund site (an uncontrolled or
    abandoned place where hazardous waste is located) recognized by the EPA.
    """

    Examples:
      | alert_id |
      | HP_042   |

  @HP_043
  Scenario Outline: [HP_043] LSFM HP Property Alert Validation
  Subject property address results are based on input APN (parcel number).
  Input address does not match the address associated with the APN
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/hp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']             |
      | //Category[@Name='PROPERTY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected          |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY          |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>        |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                 |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                 |
      | //Alert[@Id='<alert_id>']/@Severity               | High              |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]           |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]           |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_SUBJECT_REPORT |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_HP_INPUT_APN  |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational     |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud             |
      | //Alert[@Id='<alert_id>']/@Category               | Property          |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]           |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                 |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Subject property address results are based on input APN (parcel number).
    Input address does not match the address associated with the APN
    """

    Examples:
      | alert_id |
      | HP_043   |

  @HP_045
  Scenario Outline: [HP_045] LSFM HP Property Alert Validation
  Property has transferred in the last year, and value appears high compared to last price or median value.
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/hp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']             |
      | //Category[@Name='PROPERTY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                                   |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY                                   |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                                 |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                                          |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                                          |
      | //Alert[@Id='<alert_id>']/@Severity               | High                                       |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]                                    |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                                    |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | RECENT_SUBJ_RESALE_SUMMARY                 |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_CURRENT_VALUE_HIGH_VS_LAST_12MOS_ALERT |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable                                 |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                                      |
      | //Alert[@Id='<alert_id>']/@Category               | Property                                   |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                                    |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                                    |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                                    |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                                    |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                                    |
      | //Alert[@Id='<alert_id>']/@Rescorable             | Y                                          |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Property has transferred in the last year, and value appears high compared to last price or median value.
    """

    Examples:
      | alert_id |
      | HP_045   |

  @HP_046
  Scenario Outline: [HP_046] LSFM HP Property Alert Validation
  Property value appears high compared to recent area sales.
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/hp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']             |
      | //Category[@Name='PROPERTY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                              |
      | //Category[@Name='PROPERTY']/@Heading             | PROPERTY                              |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                            |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                                     |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                                     |
      | //Alert[@Id='<alert_id>']/@Severity               | High                                  |
      | //Alert[@Id='<alert_id>']/@SubjectId              | [empty]                               |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                               |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | HP_MARKET_ANALYSIS                    |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_PROPERTY_VALUE_HIGH_TO_AREA_ALERT |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable                            |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                                 |
      | //Alert[@Id='<alert_id>']/@Category               | Property                              |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                               |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                               |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                               |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                               |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                               |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                                     |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Property value appears high compared to recent area sales.
    """

    Examples:
      | alert_id |
      | HP_046   |

  @HP_049
    @MADLRVP-10433
    @subject_property_analysis
  Scenario Outline: [HP_049] LSFM HP Property Alert Validation
  Property value appears high compared to recent area sales.
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/hp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
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

  @HP_050
    @MADLRVP-10461
    @subject_property_report_and_details
  Scenario Outline: [HP_050] LSFM HP Property Alert Validation
  Property value appears high compared to recent area sales.
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/hp/<alert_id>.xml
    When the request is sent
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
