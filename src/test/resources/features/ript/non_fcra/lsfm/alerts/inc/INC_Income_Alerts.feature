@api
@non_fcra
@lsfm
@alerts
@inc
@income
Feature: LSFM INC Income Alerts

  @INC_001
  Scenario Outline: [INC_001] LSFM INC Income Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/inc/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='INCOME'][@Heading='INCOME EMPLOYMENT']   |
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected          |
      | //Category[@Name='INCOME']/@Heading               | INCOME EMPLOYMENT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>        |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                 |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                 |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium            |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                 |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]           |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | <AnchorTag>       |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_VAL_EMPLR     |
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
    Ardmille, Kelly - Employer name or address did not match
    a reverse phone number lookup on the employer's phone number.
    """

    @qa_only
    Examples:
      | alert_id | AnchorTag     |
      | INC_001  | IV_EMP_DETAIL |

    @dev_only
    Examples:
      | alert_id | AnchorTag           |
      | INC_001  | IV_EMP_VERIFICATION |

  @INC_002
  Scenario Outline: [INC_002] LSFM INC Income Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/inc/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='INCOME'][@Heading='INCOME EMPLOYMENT']   |
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                      |
      | //Category[@Name='INCOME']/@Heading               | INCOME EMPLOYMENT             |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                    |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                             |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                             |
      | //Alert[@Id='<alert_id>']/@Severity               | High                          |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                             |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                       |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | NeighborhoodIncomeGraphAnchor |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_STATED_INCOME             |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational                 |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                         |
      | //Alert[@Id='<alert_id>']/@Category               | Income                        |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                       |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                       |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                       |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                       |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                       |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                             |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    The disclosed 1003 income is significantly higher than
    the neighborhood incomes of where the borrower(s) have lived
    """

    Examples:
      | alert_id |
      | INC_002  |

  @INC_003
  Scenario Outline: [INC_003] LSFM INC Income Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/inc/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='INCOME'][@Heading='INCOME EMPLOYMENT']   |
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected             |
      | //Category[@Name='INCOME']/@Heading               | INCOME EMPLOYMENT    |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>           |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                    |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                    |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium               |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                    |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]              |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | IV_EMP_DETAIL        |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_EMPLYR_CELLPHONE |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational        |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                |
      | //Alert[@Id='<alert_id>']/@Category               | Income               |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]              |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]              |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                    |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Ardmille, Kelly - Borrower is not self-employed
    and employer phone number is a cell phone.
    """

    Examples:
      | alert_id |
      | INC_003  |

  @INC_004
  Scenario Outline: [INC_004] LSFM INC Income Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/inc/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='INCOME'][@Heading='INCOME EMPLOYMENT']   |
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected               |
      | //Category[@Name='INCOME']/@Heading               | INCOME EMPLOYMENT      |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>             |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                      |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                      |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium                 |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 1                      |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | BUS_SEARCH             |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_NOT_SELF_BUS_FOUND |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable             |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                  |
      | //Alert[@Id='<alert_id>']/@Category               | Income                 |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                      |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Chambers, Angela - Borrower may be associated
    with a business although did not show self-employed
    """

    Examples:
      | alert_id |
      | INC_004  |

  @INC_005
  Scenario Outline: [INC_005] LSFM INC Income Alert Validation
  Input employer name and location match to Fannie Mae's fictitious employers in miscdata
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/inc/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='INCOME'][@Heading='INCOME EMPLOYMENT']   |
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                 |
      | //Category[@Name='INCOME']/@Heading               | INCOME EMPLOYMENT        |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>               |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                        |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                        |
      | //Alert[@Id='<alert_id>']/@Severity               | High                     |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                        |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                  |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | IV_EMP_DETAIL            |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | FNMA_FICTITIOUS_EMPLOYER |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable               |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                    |
      | //Alert[@Id='<alert_id>']/@Category               | Income                   |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                  |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                  |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                  |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                  |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                  |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                        |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Clintarni, Donald - Employer A1 Data Programming is a possible match
    with Fannie Mae's list of suspected fictitious employers - A1 Data Programming,
    E Dalewood St, West Covina, CA.
    """

    Examples:
      | alert_id |
      | INC_005  |

  @INC_006
  Scenario Outline: [INC_006] LSFM INC Income Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/inc/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='INCOME'][@Heading='INCOME EMPLOYMENT']   |
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected            |
      | //Category[@Name='INCOME']/@Heading               | INCOME EMPLOYMENT   |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>          |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                   |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                   |
      | //Alert[@Id='<alert_id>']/@Severity               | High                |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                   |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]             |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | MRB_SEARCH          |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_MRB_MATCH_ALERT |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable          |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud               |
      | //Alert[@Id='<alert_id>']/@Category               | Income              |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]             |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                   |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Ardmille, Kelly - Employer name provided is a possible match to
    a company name with a SIC Code for marijuana-registered business.
    """

    Examples:
      | alert_id |
      | INC_006  |

  @INC_008
  Scenario Outline: [INC_008] LSFM INC Income Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/inc/<alert_id>_<env>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='INCOME'][@Heading='INCOME EMPLOYMENT']   |
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected          |
      | //Category[@Name='INCOME']/@Heading               | INCOME EMPLOYMENT |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>        |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                 |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                 |
      | //Alert[@Id='<alert_id>']/@Severity               | High              |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                 |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]           |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | [empty]           |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | <ExternalTag>     |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable        |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud             |
      | //Alert[@Id='<alert_id>']/@Message                | <Message>         |
      | //Alert[@Id='<alert_id>']/@Category               | Income            |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]           |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]           |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                 |

    @qa_only
    Examples:
      | alert_id | env | ExternalTag                   | Message                                                                                       |
      | INC_008  | QA  | LSF_REISSUE_EMPLOYER_MISMATCH | Gagleston, GAIL -  Borrower employer provided is different from the report you are reissuing. |

    @dev_only
    Examples:
      | alert_id | env | ExternalTag | Message                                                                                       |
      | INC_008  | DEV | [empty]     | ARDMILLE, Kelly -  Borrower employer provided is different from the report you are reissuing. |

  @INC_009
  Scenario Outline: [INC_009] LSFM INC Income Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/inc/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='INCOME'][@Heading='INCOME EMPLOYMENT']   |
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                   |
      | //Category[@Name='INCOME']/@Heading               | INCOME EMPLOYMENT          |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                 |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                          |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                          |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium                     |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                          |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                    |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | IV_EMP_DETAIL              |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_EMPLYR_CELLPHONE_MODEL |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational              |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                      |
      | //Alert[@Id='<alert_id>']/@Category               | Income                     |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                    |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                    |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                    |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                    |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                    |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                          |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Ardmille, Kelly - Borrower is listed as W2 or
    self-employed and employer Phone Number is a Cell Phone.
    """

    Examples:
      | alert_id |
      | INC_009  |

  @INC_010
  @MADLRVP-10446
  @employer_data_verification
  Scenario Outline: [INC_010] LSFM INC Income Alert Validation
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/inc/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='INCOME'][@Heading='INCOME EMPLOYMENT']   |
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                |
      | //Category[@Name='INCOME']/@Heading               | INCOME EMPLOYMENT       |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>              |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                       |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                       |
      | //Alert[@Id='<alert_id>']/@Severity               | High                    |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                       |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                 |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | IV_EMP_DETAIL           |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_COMBO_INCOME_MISREP |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable              |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                   |
      | //Alert[@Id='<alert_id>']/@Category               | Income                  |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                 |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                 |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                 |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                 |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                 |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                       |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    ARDMILLE, KELLY - Phone and employer information is unable to be verified or has multiple inconsistencies.
    """

    Examples:
      | alert_id |
      | INC_010  |