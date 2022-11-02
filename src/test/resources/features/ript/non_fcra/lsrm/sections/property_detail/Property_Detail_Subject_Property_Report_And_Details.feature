@api
@non_fcra
@lsrm
@section
@property_detail
@subject_property_report_and_details
Feature: LSRM - Property Detail Section - Subject Property Report And Details

  @MADLRVP-10675
  Scenario: [MADLRVP-10675] Verify LSRM 4.0 - HP_002 is suppressed when HP_007 fires
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/property_detail/MADLRVP-10675.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category/Flagged/Alert[@Id='HP_007']    |
      | //Category/NotFlagged/Alert[@Id='HP_002'] |
    And the response has xpath
      | XPath                         | expected |
      | //Alert[@Id='HP_007']/@Status | Y        |
      | //Alert[@Id='HP_002']/@Status | N        |

  @MADLRVP-10674
  Scenario: [MADLRVP-10674] Verify LSRM 4.0 - HP_037 is suppressed when HP_007 fires
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/property_detail/MADLRVP-10674.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category/Flagged/Alert[@Id='HP_007']    |
      | //Category/NotFlagged/Alert[@Id='HP_037'] |
    And the response has xpath
      | XPath                         | expected |
      | //Alert[@Id='HP_007']/@Status | Y        |
      | //Alert[@Id='HP_037']/@Status | N        |

  @MADLRVP-10673
  Scenario: [MADLRVP-10673] Verify LSRM 4.0 - RDS_008 is suppressed when HP_007 fires
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/property_detail/MADLRVP-10673.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category/Flagged/Alert[@Id='HP_007']     |
      | //Category/NotFlagged/Alert[@Id='RDS_008'] |
    And the response has xpath
      | XPath                          | expected |
      | //Alert[@Id='HP_007']/@Status  | Y        |
      | //Alert[@Id='RDS_008']/@Status | N        |

  @MADLRVP-10471 @hidden_tags
  Scenario: [MADLRVP-10471] Verify LSRM 4.0 - Check hidden tags of HP_050
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/property_detail/MADLRVP-10471.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //XMLHiddenTags/NameValueData |
    And the response has xpath
      | XPath                                                                   | expected   |
      | //NameValueData[@name='LSF_PRIVATE_LENDER']/@value                      | Y          |
      | //NameValueData[@name='LSF_PRIVATE_LENDER_SEV']/@value                  | High       |
      | //NameValueData[@name='LSF_PRIVATE_LENDER_ID']/@value                   | HP_050     |
      | //NameValueData[@name='LSF_PRIVATE_LENDER_ALERT_CLASSIFICATION']/@value | Fraud      |
      | //NameValueData[@name='LSF_PRIVATE_LENDER_ALERT_TYPE']/@value           | Actionable |
      | //NameValueData[@name='LSRM_ALERT_RESCORABLE']/@value                   | N          |
    And the response has xpath //NameValueData[@name='LSF_PRIVATE_LENDER_MSG']/@value with value (ignoring newline and spaces)
    """
    The subject property has had a private lender in the past 22 year(s).
    """
    And the response has xpath //NameValueData[@name='LSF_PRIVATE_LENDER_REC']/@value with value (ignoring newline and spaces)
    """
    Verify the private lender's background and obtain a copy of the Note.
    Request proof of deposit from the private loan proceeds.
    Request canceled checks for payment history.
    """

  @MADLRVP-10469
  Scenario: [MADLRVP-10469] Verify LSRM 4.0 - Check new key PRIVATE_PARTY_LENDER - Default value
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/property_detail/MADLRVP-10469.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category/Flagged/Alert[@Id='HP_050']                               |
      | //InputParameter[@inputName='PRIVATE_PARTY_LENDER'][@inputValue='2'] |
    And the response has xpath
      | XPath                         | expected |
      | //Alert[@Id='HP_050']/@Status | Y        |
    And the response has xpath //Alert[@Id='HP_050']/@Message with value (ignoring newline and spaces)
    """
    The subject property has had a private lender in the past 2 year(s).
    """

  @MADLRVP-10467
  Scenario Outline: [MADLRVP-10467] LSRM 4.0 - Fire HP_050 alert
  Property value appears high compared to recent area sales.
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/property_detail/MADLRVP-10467.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']             |
      | //Category[@Name='PROPERTY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                     | expected           |
      | //Category[@Name='PROPERTY']/@Heading     | PROPERTY           |
      | //Alert[@Id='<alert_id>']/@ExternalId     | <alert_id>         |
      | //Alert[@Id='<alert_id>']/@Active         | 1                  |
      | //Alert[@Id='<alert_id>']/@Status         | Y                  |
      | //Alert[@Id='<alert_id>']/@Severity       | High               |
      | //Alert[@Id='<alert_id>']/@AnchorTag      | HP_SUBJECT_REPORT  |
      | //Alert[@Id='<alert_id>']/@ExternalTag    | LSF_PRIVATE_LENDER |
      | //Alert[@Id='<alert_id>']/@AlertType      | Actionable         |
      | //Alert[@Id='<alert_id>']/@Classification | Fraud              |
      | //Alert[@Id='<alert_id>']/@Category       | Property           |
      | //Alert[@Id='<alert_id>']/@Rescorable     | N                  |
    And the response has xpath //Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    The subject property has had a private lender in the past 22 year(s).
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

  @MADLRVP-10676
  Scenario: [MADLRVP-10676] Verify LSRM 4.0 - Verify suppression of multiple alerts when HP_007 fires
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/property_detail/MADLRVP-10676.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category/Flagged/Alert[@Id='HP_007']    |
      | //Category/NotFlagged/Alert[@Id='HP_006'] |
      | //Category/NotFlagged/Alert[@Id='HP_012'] |
      | //Category/NotFlagged/Alert[@Id='HP_013'] |
      | //Category/NotFlagged/Alert[@Id='HP_024'] |
      | //Category/NotFlagged/Alert[@Id='HP_027'] |
      | //Category/NotFlagged/Alert[@Id='HP_034'] |
    And the response has xpath
      | XPath                         | expected |
      | //Alert[@Id='HP_007']/@Status | Y        |
      | //Alert[@Id='HP_006']/@Status | N        |
      | //Alert[@Id='HP_012']/@Status | N        |
      | //Alert[@Id='HP_013']/@Status | N        |
      | //Alert[@Id='HP_024']/@Status | N        |
      | //Alert[@Id='HP_027']/@Status | N        |
      | //Alert[@Id='HP_034']/@Status | N        |

  @MADLRVP-10729
  Scenario: [MADLRVP-10729] Verify LSRM 4.0 - Verify suppression of multiple alerts when HP_007 fires
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/property_detail/MADLRVP-10729.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //PropertySection/SubjectProperty             |
      | //PropertySection/SubjectProperty/SiteAddress |
      | //PropertySection/SubjectProperty/MailAddress |
    And the response has xpath
      | XPath                                       | expected                          |
      | //SubjectProperty/@currentOwner             | EGBUNIKE UGO                      |
      | //SubjectProperty/@currentOwner2nd          | COBB JAMES H                      |
      | //SubjectProperty/@currentOwner3rd          | ADEKANMBI JOBA                    |
      | //SubjectProperty/@currentOwner4th          | KOYFMAN YEVGENIY                  |
      | //SubjectProperty/@lastGrantor              | BUFFALO RIVER REALTY LLC          |
      | //SubjectProperty/SiteAddress/@addressID    | [empty]                           |
      | //SubjectProperty/SiteAddress/@carrierRoute | C063                              |
      | //SubjectProperty/SiteAddress/@city         | CHARLOTTE                         |
      | //SubjectProperty/SiteAddress/@fips         | 37119                             |
      | //SubjectProperty/SiteAddress/@houseNum     | 2629                              |
      | //SubjectProperty/SiteAddress/@msaCode      | 16740                             |
      | //SubjectProperty/SiteAddress/@msaName      | Charlotte-Gastonia-Concord, NC-SC |
      | //SubjectProperty/SiteAddress/@cbsaCode     | 16740                             |
      | //SubjectProperty/SiteAddress/@cbsaName     | Charlotte-Gastonia-Concord, NC-SC |
      | //SubjectProperty/SiteAddress/@postDir      | [empty]                           |
      | //SubjectProperty/SiteAddress/@preDir       | [empty]                           |
      | //SubjectProperty/SiteAddress/@state        | NC                                |
      | //SubjectProperty/SiteAddress/@streetName   | VAIL                              |
      | //SubjectProperty/SiteAddress/@suffix       | AVE                               |
      | //SubjectProperty/SiteAddress/@unitNum      | [empty]                           |
      | //SubjectProperty/SiteAddress/@unitType     | [empty]                           |
      | //SubjectProperty/SiteAddress/@zip          | 28207                             |
      | //SubjectProperty/SiteAddress/@zip4         | 2015                              |
      | //SubjectProperty/SiteAddress/@streetAddr   | 2629 VAIL AVE                     |
      | //SubjectProperty/SiteAddress/@standardized | true                              |
      | //SubjectProperty/SiteAddress/@address      | [empty]                           |
      | //SubjectProperty/SiteAddress/@source       | SUBJECT                           |
      | //SubjectProperty/SiteAddress/@dispute      | [empty]                           |
      | //SubjectProperty/SiteAddress/@censusBlock  | 371190024002007                   |
      | //SubjectProperty/SiteAddress/@county       | MECKLENBURG                       |
      | //SubjectProperty/SiteAddress/@addressSuite | [empty]                           |
      | //SubjectProperty/SiteAddress/@apn          | [empty]                           |
      | //SubjectProperty/SiteAddress/@fips5        | [empty]                           |
      | //SubjectProperty/SiteAddress/@cityStateZip | CHARLOTTE, NC 28207               |
      | //SubjectProperty/MailAddress/@addressID    | [empty]                           |
      | //SubjectProperty/MailAddress/@carrierRoute | [empty]                           |
      | //SubjectProperty/MailAddress/@city         | BROOKLYN                          |
      | //SubjectProperty/MailAddress/@fips         | 0                                 |
      | //SubjectProperty/MailAddress/@houseNum     | 1080                              |
      | //SubjectProperty/MailAddress/@msaCode      | [empty]                           |
      | //SubjectProperty/MailAddress/@msaName      | [empty]                           |
      | //SubjectProperty/MailAddress/@cbsaCode     | [empty]                           |
      | //SubjectProperty/MailAddress/@cbsaName     | [empty]                           |
      | //SubjectProperty/MailAddress/@postDir      | [empty]                           |
      | //SubjectProperty/MailAddress/@preDir       | [empty]                           |
      | //SubjectProperty/MailAddress/@state        | NY                                |
      | //SubjectProperty/MailAddress/@streetName   | BERGEN                            |
      | //SubjectProperty/MailAddress/@suffix       | ST                                |
      | //SubjectProperty/MailAddress/@unitNum      | 238                               |
      | //SubjectProperty/MailAddress/@unitType     | #                                 |
      | //SubjectProperty/MailAddress/@zip          | 11216                             |
      | //SubjectProperty/MailAddress/@zip4         | 3340                              |
      | //SubjectProperty/MailAddress/@streetAddr   | 1080 BERGEN ST Unit 238           |
      | //SubjectProperty/MailAddress/@standardized | false                             |
      | //SubjectProperty/MailAddress/@address      | [empty]                           |
      | //SubjectProperty/MailAddress/@source       | [empty]                           |
      | //SubjectProperty/MailAddress/@dispute      | [empty]                           |
      | //SubjectProperty/MailAddress/@censusBlock  | [empty]                           |
      | //SubjectProperty/MailAddress/@county       | [empty]                           |
      | //SubjectProperty/MailAddress/@addressSuite | [empty]                           |
      | //SubjectProperty/MailAddress/@apn          | [empty]                           |
      | //SubjectProperty/MailAddress/@fips5        | [empty]                           |
      | //SubjectProperty/MailAddress/@cityStateZip | BROOKLYN, NY 11216                |

  @MADLRVP-15486
  Scenario: [MADLRVP-15486] Verify LSRM - SUBJECT PROPERTY SALES AND LOAN HISTORY - Sale/Recording Dates are suppressed after retro date
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/property_detail/MADLRVP-15486.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //PropertySection/SubjectProperty/History/Transaction[@uniqueID='147000095'] |
      | //PropertySection/SubjectProperty/History/Transaction[@uniqueID='147248594'] |
      | //PropertySection/SubjectProperty/History/Transaction[@uniqueID='147294841'] |
    And the response has xpath
      | XPath                                            | expected         |
      | //Transaction[@uniqueID='147000095']/@saleDate   | 1/26/93          |
      | //Transaction[@uniqueID='147000095']/@recordDate | 1993-03-02-08:00 |
      | //Transaction[@uniqueID='147248594']/@saleDate   | 10/1/85          |
      | //Transaction[@uniqueID='147294841']/@saleDate   | 10/1/83          |

  @MADLRVP-15989
  Scenario: [MADLRVP-15989] Verify LSRM - Unit number present in the header of report
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/property_detail/MADLRVP-15989.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //ReportResults/LSRM/LSFMResults/Header |
    And the response has xpath
      | XPath                           | expected                                    |
      | //LSRM//Header/@propertyAddress | 1255 COLLINS AVE 503, MIAMI BEACH, FL 33139 |
      | //LSRM//Header/@inputUnitNum    | 503                                         |
