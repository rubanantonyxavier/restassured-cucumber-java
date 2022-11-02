@api
@non_fcra
@lsfm
@alerts
@idp
@identity
Feature: LSFM IDP Identity Alerts

  @IDP_011
  Scenario Outline: [IDP_011] LSFM IDP Identity Alert Validation
  Borrower's current address did not match any addresses in their credit history
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='IDENTITY'][@Heading='IDENTITY']             |
      | //Category[@Name='IDENTITY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected              |
      | //Category[@Name='IDENTITY']/@Heading             | IDENTITY              |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>            |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                     |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                     |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium                |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                     |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]               |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | IDP_DATA_VERIFICATION |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_BRWR_ADD_VER      |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational         |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                 |
      | //Alert[@Id='<alert_id>']/@Category               | Identity              |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]               |
      | //Alert[@Id='<alert_id>']/@Rescorable             | Y                     |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Ardur, James - Borrower's current address did not match any addresses in their credit history
    """

    Examples:
      | alert_id |
      | IDP_011  |

  @IDP_012
  Scenario Outline: [IDP_012] LSFM IDP Identity Alert Validation
  Borrower's name did not match a reverse phone number lookup on their current phone number
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='IDENTITY'][@Heading='IDENTITY']             |
      | //Category[@Name='IDENTITY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected              |
      | //Category[@Name='IDENTITY']/@Heading             | IDENTITY              |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>            |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                     |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                     |
      | //Alert[@Id='<alert_id>']/@Severity               | Medium                |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                     |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]               |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | IDP_DATA_VERIFICATION |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_VER_PHONE_MATCH   |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational         |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                 |
      | //Alert[@Id='<alert_id>']/@Category               | Identity              |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]               |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                     |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    GOLDETTA, ROWENA - Borrower's name did not match a reverse phone number lookup on their current phone number
    """

    Examples:
      | alert_id |
      | IDP_012  |

  @IDP_013
  Scenario Outline: [IDP_013] LSFM IDP Identity Alert Validation
  Mismatch was found on borrower's date of birth
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
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
      | //Alert[@Id='<alert_id>']/@Rescorable             | Y                   |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Ardur, James - Mismatch was found on borrower's date of birth
    """

    Examples:
      | alert_id |
      | IDP_013  |

  @IDP_016
  Scenario Outline: [IDP_016] LSFM IDP Identity Alert Validation
  Borrower's first name was not found to be associated with this SSN
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='IDENTITY'][@Heading='IDENTITY']             |
      | //Category[@Name='IDENTITY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                |
      | //Category[@Name='IDENTITY']/@Heading             | IDENTITY                |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>              |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                       |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                       |
      | //Alert[@Id='<alert_id>']/@Severity               | Low                     |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                       |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                 |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | IDP_IDENTITY_DETAIL     |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_SSN_F_NAME_MISMATCH |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational           |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                   |
      | //Alert[@Id='<alert_id>']/@Category               | Identity                |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                 |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                 |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                 |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                 |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                 |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                       |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    ARDUR, HO - Borrower's first name was not found to be associated with this SSN
    """

    Examples:
      | alert_id |
      | IDP_016  |

  @IDP_017
  Scenario Outline: [IDP_017] LSFM IDP Identity Alert Validation
  Borrower's last name was not found to be associated with this SSN
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
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
      | //Alert[@Id='<alert_id>']/@Severity               | Low                 |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                   |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]             |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | IDP_IDENTITY_DETAIL |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_L_NAME_MISMATCH |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational       |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud               |
      | //Alert[@Id='<alert_id>']/@Category               | Identity            |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]             |
      | //Alert[@Id='<alert_id>']/@Rescorable             | Y                   |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    NewG, Gail - Borrower's last name was not found to be associated with this SSN
    """

    Examples:
      | alert_id |
      | IDP_017  |

  @IDP_020
  Scenario Outline: [IDP_020] LSFM IDP Identity Alert Validation
  Insufficient data available to verify borrower's address
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='IDENTITY'][@Heading='IDENTITY']             |
      | //Category[@Name='IDENTITY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected              |
      | //Category[@Name='IDENTITY']/@Heading             | IDENTITY              |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>            |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                     |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                     |
      | //Alert[@Id='<alert_id>']/@Severity               | Low                   |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                     |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]               |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | IDP_DATA_VERIFICATION |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_BRWR_ADD_VER_U    |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational         |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                 |
      | //Alert[@Id='<alert_id>']/@Category               | Identity              |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]               |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                     |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Clintarni, Donald - Insufficient data available to verify borrower's address
    """

    Examples:
      | alert_id |
      | IDP_020  |

  @IDP_021
  Scenario Outline: [IDP_021] LSFM IDP Identity Alert Validation
  Insufficient data available to verify borrower's phone number
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='IDENTITY'][@Heading='IDENTITY']             |
      | //Category[@Name='IDENTITY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected              |
      | //Category[@Name='IDENTITY']/@Heading             | IDENTITY              |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>            |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                     |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                     |
      | //Alert[@Id='<alert_id>']/@Severity               | Low                   |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                     |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]               |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | IDP_DATA_VERIFICATION |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_VER_PHONE_MATCH_U |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational         |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                 |
      | //Alert[@Id='<alert_id>']/@Category               | Identity              |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]               |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                     |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    ZELLARZI, HARVEY - Insufficient data available to verify borrower's phone number
    """

    Examples:
      | alert_id |
      | IDP_021  |

  @IDP_022
  Scenario Outline: [IDP_022] LSFM IDP Identity Alert Validation
  Insufficient data available to verify borrower's date of birth
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
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
      | //Alert[@Id='<alert_id>']/@Severity               | Low                 |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                   |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]             |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | IDP_IDENTITY_DETAIL |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_VER_DOB_U       |
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
    Clintarni, Donald - Insufficient data available to verify borrower's date of birth
    """

    Examples:
      | alert_id |
      | IDP_022  |

  @IDP_025
  Scenario Outline: [IDP_025] LSFM IDP Identity Alert Validation
  Borrower's full name did not match SSN via credit header data.
  If the full name doesn't match, the following alerts will not populate: IDP_016 or IDP_017
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
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
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_SSN_MISMATCH    |
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
    TESTArdmille, TESTKelly -
    Borrower name is not associated with this SSN
    """

    Examples:
      | alert_id |
      | IDP_025  |

  @IDP_026
  Scenario Outline: [IDP_026] LSFM IDP Identity Alert Validation
  Based on SSA death master file
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
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
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_SSN_DECEASED    |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational       |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud               |
      | //Alert[@Id='<alert_id>']/@Category               | Identity            |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]             |
      | //Alert[@Id='<alert_id>']/@Rescorable             | Y                   |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    ZELLARZI, HARVEY - This SSN belongs to a deceased individual
    """

    Examples:
      | alert_id |
      | IDP_026  |

  @IDP_027
  Scenario Outline: [IDP_027] LSFM IDP Identity Alert Validation
  This SSN is invalid
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
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
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_SSN_INVALID     |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational       |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud               |
      | //Alert[@Id='<alert_id>']/@Category               | Identity            |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]             |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]             |
      | //Alert[@Id='<alert_id>']/@Rescorable             | Y                   |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    GOLDUR, HOLLY - This SSN is invalid
    """

    Examples:
      | alert_id |
      | IDP_027  |

  @IDP_030
  Scenario Outline: [IDP_030] LSFM IDP Identity Alert Validation
  Looks at address history (subject property in a state they didn't live) and value shift
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
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
      | //Alert[@Id='<alert_id>']/@AnchorTag              | IDP_BORROWER_DETAIL |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_SSN_SHIFT_STATE |
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
    Castillo, Mary - Borrower is purchasing property in a state where they have not
    lived before and in a significantly lesser value market than previously owned property.
    """

    Examples:
      | alert_id |
      | IDP_030  |

  @IDP_031
  Scenario Outline: [IDP_031] LSFM IDP Identity Alert Validation
  We were unable to obtain any information on the submitted Borrower
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='IDENTITY'][@Heading='IDENTITY']             |
      | //Category[@Name='IDENTITY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected              |
      | //Category[@Name='IDENTITY']/@Heading             | IDENTITY              |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>            |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                     |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                     |
      | //Alert[@Id='<alert_id>']/@Severity               | High                  |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                     |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]               |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | IDP_DATA_VERIFICATION |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_IDP_NOHIT         |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational         |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                 |
      | //Alert[@Id='<alert_id>']/@Category               | Identity              |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]               |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]               |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                     |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    GOLDUR, HOLLY - We were unable to obtain any information on the submitted Borrower
    """

    Examples:
      | alert_id |
      | IDP_031  |

  @IDP_042
  Scenario Outline: [IDP_042] LSFM IDP Identity Alert Validation
  If there is no direct match between input SSN and input Borrower name,
  our Vendor system will adjust borrower input name
  and SSN to provide closely matching SSN.
  Detail will populate within LoanSafe report for input name
  and closely matching SSN including which SSN digits were adjusted
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
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
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_SSN_DIFF        |
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
    Waldana, Linda - A direct match between the Input SSN and Input Borrower Name was not found.
    However, a closely matching SSN that did match the Input Borrower Name was found and returned instead
    """

    Examples:
      | alert_id |
      | IDP_042  |

  @IDP_049
  Scenario Outline: [IDP_049] LSFM IDP Identity Alert Validation
  A direct match between the Input SSN and Input Borrower First and Last Names was not found.
  However, by transposing the names a direct match was returned.
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='IDENTITY'][@Heading='IDENTITY']             |
      | //Category[@Name='IDENTITY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                 |
      | //Category[@Name='IDENTITY']/@Heading             | IDENTITY                 |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>               |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                        |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                        |
      | //Alert[@Id='<alert_id>']/@Severity               | Low                      |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                        |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                  |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | IDP_IDENTITY_DETAIL      |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_FIRST_LAST_TRANSPOSE |
      | //Alert[@Id='<alert_id>']/@AlertType              | Informational            |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                    |
      | //Alert[@Id='<alert_id>']/@Category               | Identity                 |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                  |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                  |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                  |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                  |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                  |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                        |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    A direct match between the Input SSN and Input Borrower First and Last Names was not found.
    However, by transposing the names a direct match was returned.
    """

    Examples:
      | alert_id |
      | IDP_049  |

  @IDP_052
  Scenario Outline: [IDP_052] LSFM IDP Identity Alert Validation
  Comparison between DOB provided on the score request and the earliest date of
  the SSN ""when issued"" range derived from Death Master Tables
  IDP_SSN_VALID_ISSUE_YEAR=Y
  Logic as per Yusef on 2/16. Alert message change required
  1. birth year is before the minimum year issued (ssn5_stats.min_birth_year)
  2. birth year is after the maximum year issued (ssn5_stats.max_birth_year)
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
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
      | //Alert[@Id='<alert_id>']/@SubjectId              | 1                   |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]             |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | IDP_IDENTITY_DETAIL |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_SSN_BEFORE_DOB  |
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
    Marsupial, Martin - Borrowers reported date of birth is outside
    the SSN issue years according to information derived from SSA Death Master Tables
    """

    Examples:
      | alert_id |
      | IDP_052  |

  @IDP_056
  Scenario Outline: [IDP_056] LSFM IDP Identity Alert Validation
  Input SSN is currently on the open/frozen high group file and the credit header vendor has no data. May be random.
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='IDENTITY'][@Heading='IDENTITY']             |
      | //Category[@Name='IDENTITY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                      |
      | //Category[@Name='IDENTITY']/@Heading             | IDENTITY                      |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                    |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                             |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                             |
      | //Alert[@Id='<alert_id>']/@Severity               | High                          |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                             |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                       |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | IDP_IDENTITY_DETAIL           |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_SSN_MAY_BE_RANDOM_NO_DATA |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable                    |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                         |
      | //Alert[@Id='<alert_id>']/@Category               | Identity                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                       |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                       |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                       |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                       |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                       |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N                             |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Ho, Jen - This SSN was found to be on the SSA's frozen high group list and may be randomly issued.
    In addition, no vendor data found on number provided.
    """

    Examples:
      | alert_id |
      | IDP_056  |

  @IDP_059
  Scenario Outline: [IDP_059] LSFM IDP Identity Alert Validation
  This SSN was not found to be in a closed SSN block and therefore may not be issued or has been randomly issued.
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='IDENTITY'][@Heading='IDENTITY']             |
      | //Category[@Name='IDENTITY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected                     |
      | //Category[@Name='IDENTITY']/@Heading             | IDENTITY                     |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>                   |
      | //Alert[@Id='<alert_id>']/@Active                 | 1                            |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                            |
      | //Alert[@Id='<alert_id>']/@Severity               | High                         |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                            |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]                      |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | IDP_IDENTITY_DETAIL          |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_SSN_RANDOM_OR_NOT_ISSUED |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable                   |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud                        |
      | //Alert[@Id='<alert_id>']/@Category               | Identity                     |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]                      |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]                      |
      | //Alert[@Id='<alert_id>']/@Rescorable             | Y                            |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Ardur, James - This SSN was not found to be in a closed SSN block
    and therefore may not be issued or has been randomly issued.
    """

    Examples:
      | alert_id |
      | IDP_059  |

  @IDP_060
  Scenario Outline: [IDP_060] LSFM IDP Identity Alert Validation
  This SSN was not found to be in a closed SSN block and therefore may not be issued or has been randomly issued.
  In addition, no vendor data found on number provided.
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='IDENTITY'][@Heading='IDENTITY']             |
      | //Category[@Name='IDENTITY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                             | expected      |
      | //Category[@Name='IDENTITY']/@Heading             | IDENTITY      |
      | //Alert[@Id='<alert_id>']/@ExternalId             | <alert_id>    |
      | //Alert[@Id='<alert_id>']/@Active                 | 1             |
      | //Alert[@Id='<alert_id>']/@Status                 | Y             |
      | //Alert[@Id='<alert_id>']/@Severity               | High          |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0             |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]       |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | <AnchorTag>   |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | <ExternalTag> |
      | //Alert[@Id='<alert_id>']/@AlertType              | Actionable    |
      | //Alert[@Id='<alert_id>']/@Classification         | Fraud         |
      | //Alert[@Id='<alert_id>']/@Category               | Identity      |
      | //Alert[@Id='<alert_id>']/@LSCResponseType        | [empty]       |
      | //Alert[@Id='<alert_id>']/@LSCResponseReason      | [empty]       |
      | //Alert[@Id='<alert_id>']/@LSCResponseMessage     | [empty]       |
      | //Alert[@Id='<alert_id>']/@LSCResponseCreatedBy   | [empty]       |
      | //Alert[@Id='<alert_id>']/@LSCResponseDateCreated | [empty]       |
      | //Alert[@Id='<alert_id>']/@Rescorable             | N             |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Clintarni, Donald - This SSN was not found to be in a closed SSN block and therefore may not be issued
    or has been randomly issued. In addition, no vendor data found on number provided.
    """

    @dev_only
    Examples:
      | alert_id | AnchorTag | ExternalTag |
      | IDP_060  | [empty]   | [empty]     |

    @qa_only
    Examples:
      | alert_id | AnchorTag           | ExternalTag                          |
      | IDP_060  | IDP_IDENTITY_DETAIL | LSF_SSN_RANDOM_OR_NOT_ISSUED_NO_DATA |

  @IDP_080
  Scenario Outline: [IDP_080] LSFM IDP Identity Alert Validation
  Name and current address are sent to Lexis. When Lexis finds a best match then they return the SSN as well
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
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
      | //Alert[@Id='<alert_id>']/@Active                 | <active>            |
      | //Alert[@Id='<alert_id>']/@Status                 | Y                   |
      | //Alert[@Id='<alert_id>']/@Severity               | Info                |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                   |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]             |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | IDP_IDENTITY_DETAIL |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_LN_RETURNED_SSN |
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
    CARRIN, GREGORY M - Borrower SSN was not provided in the request
    and was obtained based on the name and current address provided
    """

    @qa_only
    Examples:
      | alert_id | active |
      | IDP_080  | 1      |

    @uat_only
    Examples:
      | alert_id | active |
      | IDP_080  | 0      |


  @IDP_100 @ignore
  Scenario Outline: [IDP_100] LSFM IDP Identity Alert Validation
  Alert fires when SSN is not found anywhere and starts with 9
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
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
      | //Alert[@Id='<alert_id>']/@Severity               | Medium              |
      | //Alert[@Id='<alert_id>']/@SubjectId              | 0                   |
      | //Alert[@Id='<alert_id>']/@SubjectType            | [empty]             |
      | //Alert[@Id='<alert_id>']/@AnchorTag              | IDP_IDENTITY_DETAIL |
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_ITIN_NO_HIT     |
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
    Chen,  Yaozu - SSN was submitted as an ITIN. No vendor data found on number provided.
    """

    Examples:
      | alert_id |
      | IDP_100  |

  @IDP_101 @ignore
  Scenario Outline: [IDP_101] LSFM IDP Identity Alert Validation
  IDP_101 fires when SSN starts with 9 and is an existing ssn
    Given the request XML filepath is /ript/non_fcra/lsfm/alerts/idp/<alert_id>.xml
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
      | //Alert[@Id='<alert_id>']/@ExternalTag            | LSF_ITIN_HIT        |
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
    Salinas Oliva, Juan Carlos - SSN was submitted as an ITIN. Vendor data found on number provided.
    """

    Examples:
      | alert_id |
      | IDP_101  |

