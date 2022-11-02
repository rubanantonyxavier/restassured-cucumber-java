@api
@non_fcra
@lscm
@section
@property_detail
@subject_property_report
Feature: LSCM - Property Detail Section - Subject Property Report

  @MADLRVP-15190
  Scenario: [MADLRVP-15190] Verify LSCM - HP_013 and HP_025 are suppressed when HP_007 fires
    Given the request XML filepath is /ript/non_fcra/lscm/sections/property_detail/MADLRVP-15190.xml
    When the LSCM request is sent
    Then response content type is XML
    And successful LSCM report is received
    And the response contains xpath
      | //Category/Flagged/Alert[@Id='HP_007']    |
      | //Category/NotFlagged/Alert[@Id='HP_013'] |
      | //Category/NotFlagged/Alert[@Id='HP_025'] |
    And the response has xpath
      | XPath                         | expected |
      | //Alert[@Id='HP_007']/@Status | Y        |
      | //Alert[@Id='HP_013']/@Status | N        |
      | //Alert[@Id='HP_025']/@Status | N        |

  @MADLRVP-15191
  Scenario: [MADLRVP-15191] Verify LSCM - HP_012 is suppressed when HP_007 fires
    Given the request XML filepath is /ript/non_fcra/lscm/sections/property_detail/MADLRVP-15191.xml
    When the LSCM request is sent
    Then response content type is XML
    And successful LSCM report is received
    And the response contains xpath
      | //Category/Flagged/Alert[@Id='HP_007']    |
      | //Category/NotFlagged/Alert[@Id='HP_012'] |
    And the response has xpath
      | XPath                         | expected |
      | //Alert[@Id='HP_007']/@Status | Y        |
      | //Alert[@Id='HP_012']/@Status | N        |

  @MADLRVP-15192
  Scenario: [MADLRVP-15192] Verify LSCM - The suppression of alerts if HP_007 is fired
    Given the request XML filepath is /ript/non_fcra/lscm/sections/property_detail/MADLRVP-15192.xml
    When the LSCM request is sent
    Then response content type is XML
    And successful LSCM report is received
    And the response contains xpath
      | //Category/Flagged/Alert[@Id='HP_007']    |
      | //Category/NotFlagged/Alert[@Id='HP_002'] |
      | //Category/NotFlagged/Alert[@Id='HP_003'] |
      | //Category/NotFlagged/Alert[@Id='HP_008'] |
      | //Category/NotFlagged/Alert[@Id='HP_029'] |
      | //Category/NotFlagged/Alert[@Id='HP_036'] |
      | //Category/NotFlagged/Alert[@Id='HP_037'] |
      | //Category/NotFlagged/Alert[@Id='LS_007'] |
      | //Category/NotFlagged/Alert[@Id='LS_011'] |
    And the response has xpath
      | XPath                         | expected |
      | //Alert[@Id='HP_007']/@Status | Y        |
      | //Alert[@Id='HP_007']/@Active | 1        |
      | //Alert[@Id='HP_002']/@Status | N        |
      | //Alert[@Id='HP_002']/@Active | 1        |
      | //Alert[@Id='HP_003']/@Status | N        |
      | //Alert[@Id='HP_003']/@Active | 1        |
      | //Alert[@Id='HP_008']/@Status | N        |
      | //Alert[@Id='HP_008']/@Active | 1        |
      | //Alert[@Id='HP_029']/@Status | N        |
      | //Alert[@Id='HP_029']/@Active | 1        |
      | //Alert[@Id='HP_036']/@Status | N        |
      | //Alert[@Id='HP_036']/@Active | 1        |
      | //Alert[@Id='HP_037']/@Status | N        |
      | //Alert[@Id='HP_037']/@Active | 1        |
      | //Alert[@Id='LS_007']/@Status | N        |
      | //Alert[@Id='LS_007']/@Active | 1        |
      | //Alert[@Id='LS_011']/@Status | N        |
      | //Alert[@Id='LS_011']/@Active | 1        |

  @MADLRVP-15193
  Scenario: [MADLRVP-15193] Verify LSCM - Subject Property is added with yearBuilt input
    Given the request XML filepath is /ript/non_fcra/lscm/sections/property_detail/MADLRVP-15193.xml
    When the LSCM request is sent
    Then response content type is XML
    And successful LSCM report is received
    And the response contains xpath
      | //ReportInput/CollateralManagerRequest/Subject |
    And the response has xpath
      | XPath                                         | expected           |
      | //CollateralManagerRequest/Subject/@yearBuilt | [MATCH --> \\d{4}] |

  @MADLRVP-15195
  Scenario: [MADLRVP-15195] Verify LSCM - Trigger tag of HP_049 is LSF_SUBJ_STANDARDIZED_ZIP_DIFFERENT_ALERT
    Given the request XML filepath is /ript/non_fcra/lscm/sections/property_detail/MADLRVP-15195.xml
    When the LSCM request is sent
    Then response content type is XML
    And successful LSCM report is received
    And the response contains xpath
      | //Category/Flagged/Alert[@Id='HP_049'] |
    And the response has xpath
      | XPath                              | expected                            |
      | //Alert[@Id='HP_049']/@Status      | Y                                   |
      | //Alert[@Id='HP_049']/@Active      | 1                                   |
      | //Alert[@Id='HP_049']/@ExternalTag | LSF_SUBJ_STANDARDIZED_ZIP_DIFFERENT |

  @MADLRVP-15197 @hidden_tags
  Scenario: [MADLRVP-15197] Verify LSCM - Hidden tags of HP_050
    Given the request XML filepath is /ript/non_fcra/lscm/sections/property_detail/MADLRVP-15197.xml
    When the LSCM request is sent
    Then response content type is XML
    And successful LSCM report is received
    And XML response contains hidden tags under the ALERT DETAIL section
      | LSF_PRIVATE_LENDER     | Y      |
      | LSF_PRIVATE_LENDER_SEV | High   |
      | LSF_PRIVATE_LENDER_ID  | HP_050 |
    And XML response has the LSF_PRIVATE_LENDER_MSG hidden tag under the ALERT DETAIL section with value (ignoring newline and spaces)
    """
    The subject property has had a private lender in the past 20 year(s).
    """
    And XML response has the LSF_PRIVATE_LENDER_REC hidden tag under the ALERT DETAIL section with value (ignoring newline and spaces)
    """
    Verify the private lender's background and obtain a copy of the Note.
    Request proof of deposit from the private loan proceeds.
    Request canceled checks for payment history.
    """

  @MADLRVP-15198
  Scenario: [MADLRVP-15198] Verify LSCM - HP_001 updated with Message
    Given the request XML filepath is /ript/non_fcra/lscm/sections/property_detail/MADLRVP-15198.xml
    When the LSCM request is sent
    Then response content type is XML
    And successful LSCM report is received
    And the response contains xpath
      | //Category/Flagged/Alert[@Id='HP_001'] |
    And the response has xpath
      | XPath                         | expected |
      | //Alert[@Id='HP_001']/@Status | Y        |
      | //Alert[@Id='HP_001']/@Active | 1        |
    And the response has xpath //Alert[@Id='HP_001']/@Message with value (ignoring newline and spaces)
    """
    Subject property is located in a zip code
    and county declared as a FEMA Disaster Area,
    with a disaster type that could impact property condition.
    """

  @MADLRVP-15199
  Scenario: [MADLRVP-15199] Verify LSCM - Unit number present in the header of report
    Given the request XML filepath is /ript/non_fcra/lscm/sections/property_detail/MADLRVP-15199.xml
    When the LSCM request is sent
    Then response content type is XML
    And successful LSCM report is received
    And the response contains xpath
      | //ReportResults/CollateralManager/Header |
    And the response has xpath
      | XPath                                       | expected                                    |
      | //CollateralManager/Header/@propertyAddress | 1255 COLLINS AVE 503, MIAMI BEACH, FL 33139 |

  @MADLRVP-15216
  Scenario: [MADLRVP-15216] Verify LSCM - APN in Property Detail and Header
    Given the request XML filepath is /ript/non_fcra/lscm/sections/property_detail/MADLRVP-15216.xml
    When the LSCM request is sent
    Then response content type is XML
    And successful LSCM report is received
    And the response contains xpath
      | //ReportResults/CollateralManager/Header                                 |
      | //ReportResults/CollateralManager/PropertyDetail/SubjectPropertyAnalysis |
    And the response has xpath
      | XPath                                         | expected    |
      | //CollateralManager/Header/@apn               | 013-180-014 |
      | //PropertyDetail/SubjectPropertyAnalysis/@apn | 013-180-014 |
