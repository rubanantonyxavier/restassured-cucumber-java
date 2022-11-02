@api
@non_fcra
@lsrm
@section
@identity
@best_match
Feature: LSRM - Identity Section - Best Match

  #noinspection CucumberTableInspection
  Scenario Outline: [<request>] LSRM - New IDP_096 alert is fired when Lexis Nexis returns the verified date as <verified_date_pattern>
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/identity/<request>.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category/Flagged//Alert[@Id='IDP_096']    |
      | //Category/NotFlagged//Alert[@Id='IDP_013'] |
    And the response has xpath
      | XPath                          | expected |
      | //Alert[@Id='IDP_096']/@Active | 1        |
      | //Alert[@Id='IDP_096']/@Status | Y        |
      | //Alert[@Id='IDP_013']/@Active | 1        |
      | //Alert[@Id='IDP_013']/@Status | N        |

    @MADLRVP-10707
    Examples:
      | request       | verified_date_pattern |
      | MADLRVP-10707 | //YYYY                |

    @MADLRVP-10705
    Examples:
      | request       | verified_date_pattern |
      | MADLRVP-10705 | mm//YYYY              |

  @MADLRVP-10706 @IDP_013
  Scenario Outline: [MADLRVP-10706] LSRM - Regression - Fire IDP_013 when Lexis Nexis returns different mm/dd/YYYY
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/identity/MADLRVP-10706.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected            |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>          |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                   |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                   |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium              |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                   |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]             |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | IDP_IDENTITY_DETAIL |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_VER_DOB         |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational       |
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
    ARDUR, HO - Mismatch was found on borrower's date of birth
    """

    Examples:
      | alert_id |
      | IDP_013  |

  @MADLRVP-10708 @hidden_tags
  Scenario: [MADLRVP-10708] LSRM - IDP_096 - Verify trigger tag
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/identity/MADLRVP-10708.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //XMLHiddenTags/NameValueData |
    And the response has xpath
      | XPath                                                         | expected |
      | //NameValueData[@name='LSF_VER_DOB_INCOMPLETE_ALERT0']/@value | Y        |

  @MADLRVP-10709 @hidden_tags
  Scenario: [MADLRVP-10709] LSRM - IDP_096 - Verify hidden tag
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/identity/MADLRVP-10709.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //XMLHiddenTags/NameValueData |
    And the response has xpath
      | XPath                                                                        | expected   |
      | //NameValueData[@name='LSF_VER_DOB_INCOMPLETE0']/@value                      | Y          |
      | //NameValueData[@name='LSF_VER_DOB_INCOMPLETE_BRWR0']/@value                 | 0          |
      | //NameValueData[@name='LSF_VER_DOB_INCOMPLETE_SEV0']/@value                  | Medium     |
      | //NameValueData[@name='LSF_VER_DOB_INCOMPLETE_ID0']/@value                   | IDP_096    |
      | //NameValueData[@name='LSF_VER_DOB_INCOMPLETE_ALERT_CLASSIFICATION0']/@value | Fraud      |
      | //NameValueData[@name='LSF_VER_DOB_INCOMPLETE_ALERT_TYPE0']/@value           | Actionable |
    And the response has xpath //NameValueData[@name='LSF_VER_DOB_INCOMPLETE_MSG0']/@value with value (ignoring newline and spaces)
    """
    Samuelonen, Susanne - Input and on-file date of birth are not a complete match.
    The verified date may not include the entire date MM/DD/YYYY or it shows a different day of month than the input data.
    """
    And the response has xpath //NameValueData[@name='LSF_VER_DOB_INCOMPLETE_REC0']/@value with value (ignoring newline and spaces)
    """
    Review other sources to validate complete date of birth.
    """