@api
@non_fcra
@lsfm
@section
@property_detail
@subject_property_report_and_details
Feature: LSFM - Property Detail Section - Subject Property Report And Details

  @MADLRVP-10463
  Scenario Outline: [MADLRVP-10463] Verify LSFM - Retro date retrieves data for the alert HP_050
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/property_detail/MADLRVP-10463.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY'][@Heading='PROPERTY']             |
      | //Category[@Name='PROPERTY']/Flagged//Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                        | expected   |
      | //Alert[@Id='<alert_id>']/@ExternalId        | <alert_id> |
      | //Alert[@Id='<alert_id>']/@Active            | 1          |
      | //Alert[@Id='<alert_id>']/@Status            | Y          |
      | //ReportResults/LSFM/Header/@searchDateRetro | true       |

    Examples:
      | alert_id |
      | HP_050   |

  @MADLRVP-10465 @hidden_tags
  Scenario: [MADLRVP-10465] Verify LSFM - Hidden tags of HP_050
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/property_detail/MADLRVP-10465.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //XMLHiddenTags/NameValueData |
    And the response has xpath
      | XPath                                                                   | expected   |
      | //NameValueData[@name='LSF_PRIVATE_LENDER']/@value                      | Y          |
      | //NameValueData[@name='LSF_PRIVATE_LENDER_SEV']/@value                  | High       |
      | //NameValueData[@name='LSF_PRIVATE_LENDER_ID']/@value                   | HP_050     |
      | //NameValueData[@name='LSF_PRIVATE_LENDER_ALERT_CLASSIFICATION']/@value | Fraud      |
      | //NameValueData[@name='LSF_PRIVATE_LENDER_ALERT_TYPE']/@value           | Actionable |
      | //NameValueData[@name='LSFM_ALERT_RESCORABLE']/@value                   | N          |
    And the response has xpath //NameValueData[@name='LSF_PRIVATE_LENDER_REC']/@value with value (ignoring newline and spaces)
    """
    Verify the private lender's background and obtain a copy of the Note.
    Request proof of deposit from the private loan proceeds.
    Request canceled checks for payment history.
    """
    And the response has xpath //NameValueData[@name='LSF_PRIVATE_LENDER_MSG']/@value with value (ignoring newline and spaces)
    """
    The subject property has had a private lender in the past 20 year(s).
    """

  @MADLRVP-10466 @hidden_tags
  Scenario: [MADLRVP-10466] Verify LSFM - Trigger tag of HP_050
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/property_detail/MADLRVP-10466.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[(@Name='PROPERTY')and(@Heading='PROPERTY')]   |
      | //Category[@Name='PROPERTY']/Flagged/Alert[@Id='HP_050'] |
      | //XMLHiddenTags/NameValueData                            |
    And the response has xpath
      | XPath                                                    | expected |
      | //NameValueData[@name='LSF_PRIVATE_LENDER_ALERT']/@value | Y        |

  @MADLRVP-10669
  Scenario: [MADLRVP-10669] Verify LSFM - RDS_008 is suppressed when HP_007 fires
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/property_detail/MADLRVP-10669.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY']/Flagged/Alert[@Id='HP_007']     |
      | //Category[@Name='BORROWER']/NotFlagged/Alert[@Id='RDS_008'] |
    And the response has xpath
      | XPath                          | expected |
      | //Alert[@Id='HP_007']/@Status  | Y        |
      | //Alert[@Id='RDS_008']/@Status | N        |

  @MADLRVP-10670
  Scenario: [MADLRVP-10670] Verify LSFM - HP_037 is suppressed when HP_007 fires
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/property_detail/MADLRVP-10670.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY']/Flagged/Alert[@Id='HP_007']    |
      | //Category[@Name='PROPERTY']/NotFlagged/Alert[@Id='HP_037'] |
    And the response has xpath
      | XPath                         | expected |
      | //Alert[@Id='HP_007']/@Status | Y        |
      | //Alert[@Id='HP_037']/@Status | N        |

  @MADLRVP-10671
  Scenario: [MADLRVP-10671] Verify LSFM - HP_002 is suppressed when HP_007 fires
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/property_detail/MADLRVP-10671.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY']/Flagged/Alert[@Id='HP_007']    |
      | //Category[@Name='PROPERTY']/NotFlagged/Alert[@Id='HP_002'] |
    And the response has xpath
      | XPath                         | expected |
      | //Alert[@Id='HP_007']/@Status | Y        |
      | //Alert[@Id='HP_002']/@Status | N        |

  @MADLRVP-10672
  Scenario: [MADLRVP-10672] Verify LSFM - Suppression of multiple alerts when HP_007 fires
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/property_detail/MADLRVP-10672.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='PROPERTY']/Flagged/Alert[@Id='HP_007']    |
      | //Category[@Name='PROPERTY']/NotFlagged/Alert[@Id='HP_006'] |
      | //Category[@Name='PROPERTY']/NotFlagged/Alert[@Id='HP_012'] |
      | //Category[@Name='PROPERTY']/NotFlagged/Alert[@Id='HP_013'] |
      | //Category[@Name='PROPERTY']/NotFlagged/Alert[@Id='HP_024'] |
      | //Category[@Name='PROPERTY']/NotFlagged/Alert[@Id='HP_027'] |
      | //Category[@Name='PROPERTY']/NotFlagged/Alert[@Id='HP_034'] |
    And the response has xpath
      | XPath                         | expected |
      | //Alert[@Id='HP_007']/@Status | Y        |
      | //Alert[@Id='HP_006']/@Status | N        |
      | //Alert[@Id='HP_012']/@Status | N        |
      | //Alert[@Id='HP_013']/@Status | N        |
      | //Alert[@Id='HP_024']/@Status | N        |
      | //Alert[@Id='HP_027']/@Status | N        |
      | //Alert[@Id='HP_034']/@Status | N        |

  @MADLRVP-10725
  Scenario: [MADLRVP-10725] Verify LSFM - More Owners are displayed under Subject Property Report Section
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/property_detail/MADLRVP-10725.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ReportResults/LSFM/PropertySection/SubjectProperty             |
      | //ReportResults/LSFM/PropertySection/SubjectProperty/SiteAddress |
      | //ReportResults/LSFM/PropertySection/SubjectProperty/MailAddress |
    And the response has xpath
      | XPath                                              | expected                          |
      | //PropertySection/SubjectProperty/@currentOwner    | EGBUNIKE UGO                      |
      | //PropertySection/SubjectProperty/@currentOwner2nd | COBB JAMES H                      |
      | //PropertySection/SubjectProperty/@currentOwner3rd | ADEKANMBI JOBA                    |
      | //PropertySection/SubjectProperty/@currentOwner4th | KOYFMAN YEVGENIY                  |
      | //SubjectProperty/SiteAddress/@addressID           | [empty]                           |
      | //SubjectProperty/SiteAddress/@carrierRoute        | C063                              |
      | //SubjectProperty/SiteAddress/@city                | CHARLOTTE                         |
      | //SubjectProperty/SiteAddress/@fips                | 37119                             |
      | //SubjectProperty/SiteAddress/@houseNum            | 2629                              |
      | //SubjectProperty/SiteAddress/@msaCode             | 16740                             |
      | //SubjectProperty/SiteAddress/@msaName             | Charlotte-Gastonia-Concord, NC-SC |
      | //SubjectProperty/SiteAddress/@cbsaCode            | 16740                             |
      | //SubjectProperty/SiteAddress/@cbsaName            | Charlotte-Gastonia-Concord, NC-SC |
      | //SubjectProperty/SiteAddress/@postDir             | [empty]                           |
      | //SubjectProperty/SiteAddress/@preDir              | [empty]                           |
      | //SubjectProperty/SiteAddress/@state               | NC                                |
      | //SubjectProperty/SiteAddress/@streetName          | VAIL                              |
      | //SubjectProperty/SiteAddress/@suffix              | AVE                               |
      | //SubjectProperty/SiteAddress/@unitNum             | [empty]                           |
      | //SubjectProperty/SiteAddress/@unitType            | [empty]                           |
      | //SubjectProperty/SiteAddress/@zip                 | 28207                             |
      | //SubjectProperty/SiteAddress/@zip4                | 2015                              |
      | //SubjectProperty/SiteAddress/@streetAddr          | 2629 VAIL AVE                     |
      | //SubjectProperty/SiteAddress/@standardized        | true                              |
      | //SubjectProperty/SiteAddress/@address             | [empty]                           |
      | //SubjectProperty/SiteAddress/@source              | SUBJECT                           |
      | //SubjectProperty/SiteAddress/@dispute             | [empty]                           |
      | //SubjectProperty/SiteAddress/@censusBlock         | 371190024002007                   |
      | //SubjectProperty/SiteAddress/@county              | MECKLENBURG                       |
      | //SubjectProperty/SiteAddress/@addressSuite        | [empty]                           |
      | //SubjectProperty/SiteAddress/@apn                 | [empty]                           |
      | //SubjectProperty/SiteAddress/@fips5               | [empty]                           |
      | //SubjectProperty/SiteAddress/@cityStateZip        | CHARLOTTE, NC 28207               |
      | //SubjectProperty/MailAddress/@addressID           | [empty]                           |
      | //SubjectProperty/MailAddress/@carrierRoute        | [empty]                           |
      | //SubjectProperty/MailAddress/@city                | BROOKLYN                          |
      | //SubjectProperty/MailAddress/@fips                | 0                                 |
      | //SubjectProperty/MailAddress/@houseNum            | 1080                              |
      | //SubjectProperty/MailAddress/@msaCode             | [empty]                           |
      | //SubjectProperty/MailAddress/@msaName             | [empty]                           |
      | //SubjectProperty/MailAddress/@cbsaCode            | [empty]                           |
      | //SubjectProperty/MailAddress/@cbsaName            | [empty]                           |
      | //SubjectProperty/MailAddress/@postDir             | [empty]                           |
      | //SubjectProperty/MailAddress/@preDir              | [empty]                           |
      | //SubjectProperty/MailAddress/@state               | NY                                |
      | //SubjectProperty/MailAddress/@streetName          | BERGEN                            |
      | //SubjectProperty/MailAddress/@suffix              | ST                                |
      | //SubjectProperty/MailAddress/@unitNum             | 238                               |
      | //SubjectProperty/MailAddress/@unitType            | #                                 |
      | //SubjectProperty/MailAddress/@zip                 | 11216                             |
      | //SubjectProperty/MailAddress/@zip4                | 3340                              |
      | //SubjectProperty/MailAddress/@streetAddr          | 1080 BERGEN ST Unit 238           |
      | //SubjectProperty/MailAddress/@standardized        | false                             |
      | //SubjectProperty/MailAddress/@address             | [empty]                           |
      | //SubjectProperty/MailAddress/@source              | [empty]                           |
      | //SubjectProperty/MailAddress/@dispute             | [empty]                           |
      | //SubjectProperty/MailAddress/@censusBlock         | [empty]                           |
      | //SubjectProperty/MailAddress/@county              | [empty]                           |
      | //SubjectProperty/MailAddress/@addressSuite        | [empty]                           |
      | //SubjectProperty/MailAddress/@apn                 | [empty]                           |
      | //SubjectProperty/MailAddress/@fips5               | [empty]                           |
      | //SubjectProperty/MailAddress/@cityStateZip        | BROOKLYN, NY 11216                |

  @MADLRVP-10726
  Scenario: [MADLRVP-10726] Verify LSFM - 3 Owners are displayed under Subject Property Report Section
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/property_detail/MADLRVP-10726.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ReportResults/LSFM/PropertySection/SubjectProperty             |
      | //ReportResults/LSFM/PropertySection/SubjectProperty/SiteAddress |
      | //ReportResults/LSFM/PropertySection/SubjectProperty/MailAddress |
    And the response has xpath
      | XPath                                              | expected           |
      | //PropertySection/SubjectProperty/@currentOwner    | LONG PHILLIP J     |
      | //PropertySection/SubjectProperty/@currentOwner2nd | LONG KAREN E       |
      | //PropertySection/SubjectProperty/@currentOwner3rd | LONG MARK E        |
      | //PropertySection/SubjectProperty/@currentOwner4th | [empty]            |
      | //SubjectProperty/SiteAddress/@addressID           | [empty]            |
      | //SubjectProperty/SiteAddress/@carrierRoute        | R777               |
      | //SubjectProperty/SiteAddress/@city                | BROOKLYN           |
      | //SubjectProperty/SiteAddress/@fips                | 18109              |
      | //SubjectProperty/SiteAddress/@houseNum            | 319                |
      | //SubjectProperty/SiteAddress/@msaCode             | 26900              |
      | //SubjectProperty/SiteAddress/@msaName             | Indianapolis, IN   |
      | //SubjectProperty/SiteAddress/@cbsaCode            | 26900              |
      | //SubjectProperty/SiteAddress/@cbsaName            | Indianapolis, IN   |
      | //SubjectProperty/SiteAddress/@postDir             | [empty]            |
      | //SubjectProperty/SiteAddress/@preDir              | N                  |
      | //SubjectProperty/SiteAddress/@state               | IN                 |
      | //SubjectProperty/SiteAddress/@streetName          | MAIN               |
      | //SubjectProperty/SiteAddress/@suffix              | ST                 |
      | //SubjectProperty/SiteAddress/@unitNum             | [empty]            |
      | //SubjectProperty/SiteAddress/@unitType            | [empty]            |
      | //SubjectProperty/SiteAddress/@zip                 | 46111              |
      | //SubjectProperty/SiteAddress/@zip4                | 9702               |
      | //SubjectProperty/SiteAddress/@streetAddr          | 319 N MAIN ST      |
      | //SubjectProperty/SiteAddress/@standardized        | true               |
      | //SubjectProperty/SiteAddress/@address             | [empty]            |
      | //SubjectProperty/SiteAddress/@source              | SUBJECT            |
      | //SubjectProperty/SiteAddress/@dispute             | [empty]            |
      | //SubjectProperty/SiteAddress/@censusBlock         | 181095105002007    |
      | //SubjectProperty/SiteAddress/@county              | MORGAN             |
      | //SubjectProperty/SiteAddress/@addressSuite        | [empty]            |
      | //SubjectProperty/SiteAddress/@apn                 | [empty]            |
      | //SubjectProperty/SiteAddress/@fips5               | [empty]            |
      | //SubjectProperty/SiteAddress/@cityStateZip        | BROOKLYN, IN 46111 |
      | //SubjectProperty/MailAddress/@addressID           | [empty]            |
      | //SubjectProperty/MailAddress/@carrierRoute        | [empty]            |
      | //SubjectProperty/MailAddress/@city                | BROOKLYN           |
      | //SubjectProperty/MailAddress/@fips                | 0                  |
      | //SubjectProperty/MailAddress/@houseNum            | [empty]            |
      | //SubjectProperty/MailAddress/@msaCode             | [empty]            |
      | //SubjectProperty/MailAddress/@msaName             | [empty]            |
      | //SubjectProperty/MailAddress/@cbsaCode            | [empty]            |
      | //SubjectProperty/MailAddress/@cbsaName            | [empty]            |
      | //SubjectProperty/MailAddress/@postDir             | [empty]            |
      | //SubjectProperty/MailAddress/@preDir              | [empty]            |
      | //SubjectProperty/MailAddress/@state               | IN                 |
      | //SubjectProperty/MailAddress/@streetName          | PO BOX 75          |
      | //SubjectProperty/MailAddress/@suffix              | [empty]            |
      | //SubjectProperty/MailAddress/@unitNum             | [empty]            |
      | //SubjectProperty/MailAddress/@unitType            | [empty]            |
      | //SubjectProperty/MailAddress/@zip                 | 46111              |
      | //SubjectProperty/MailAddress/@zip4                | 75                 |
      | //SubjectProperty/MailAddress/@streetAddr          | PO BOX 75          |
      | //SubjectProperty/MailAddress/@standardized        | false              |
      | //SubjectProperty/MailAddress/@address             | [empty]            |
      | //SubjectProperty/MailAddress/@source              | [empty]            |
      | //SubjectProperty/MailAddress/@dispute             | [empty]            |
      | //SubjectProperty/MailAddress/@censusBlock         | [empty]            |
      | //SubjectProperty/MailAddress/@county              | [empty]            |
      | //SubjectProperty/MailAddress/@addressSuite        | [empty]            |
      | //SubjectProperty/MailAddress/@apn                 | [empty]            |
      | //SubjectProperty/MailAddress/@fips5               | [empty]            |
      | //SubjectProperty/MailAddress/@cityStateZip        | BROOKLYN, IN 46111 |

  @MADLRVP-15485
  Scenario: [MADLRVP-15485] Verify LSFM - SUBJECT PROPERTY SALES AND LOAN HISTORY - Sale/Recording Dates are suppressed after retro date
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/property_detail/MADLRVP-15485.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //PropertySection/SubjectProperty/History/Transaction[@uniqueID='125390583'] |
      | //PropertySection/SubjectProperty/History/Transaction[@uniqueID='125366708'] |
      | //PropertySection/SubjectProperty/History/Transaction[@uniqueID='125265850'] |
      | //PropertySection/SubjectProperty/History/Transaction[@uniqueID='125053581'] |
      | //PropertySection/SubjectProperty/History/Transaction[@uniqueID='124169333'] |
    And the response has xpath
      | XPath                                            | expected         |
      | //Transaction[@uniqueID='125390583']/@saleDate   | 8/27/03          |
      | //Transaction[@uniqueID='125390583']/@recordDate | 2003-08-28-07:00 |
      | //Transaction[@uniqueID='125366708']/@saleDate   | 7/1/03           |
      | //Transaction[@uniqueID='125265850']/@saleDate   | 7/31/02          |
      | //Transaction[@uniqueID='125265850']/@recordDate | 2002-08-02-07:00 |
      | //Transaction[@uniqueID='125053581']/@saleDate   | 6/25/99          |
      | //Transaction[@uniqueID='125053581']/@recordDate | 1999-07-08-07:00 |
      | //Transaction[@uniqueID='124169333']/@saleDate   | 6/26/97          |
      | //Transaction[@uniqueID='124169333']/@recordDate | 1997-06-30-07:00 |

  @MADLRVP-15988
  Scenario: [MADLRVP-15988] Verify LSFM 4.0 - Unit number present in the header of report
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/property_detail/MADLRVP-15988.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ReportResults/LSFM/Header |
    And the response has xpath
      | XPath                          | expected                                    |
      | //LSFM/Header/@propertyAddress | 1255 COLLINS AVE 503, MIAMI BEACH, FL 33139 |
      | //LSFM/Header/@inputUnitNum    | 503                                         |

  @MADLRVP-15990
  Scenario: [MADLRVP-15990] Verify LSFM 4.1 - Unit number present in the header of report
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/property_detail/MADLRVP-15990.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //ReportResults/LSFM/Header |
    And the response has xpath
      | XPath                          | expected                                    |
      | //LSFM/Header/@propertyAddress | 1255 COLLINS AVE 503, MIAMI BEACH, FL 33139 |
      | //LSFM/Header/@inputStreetAddr | 1255 COLLINS AVE 503                        |
      | //LSFM/Header/@inputUnitNum    | 503                                         |

