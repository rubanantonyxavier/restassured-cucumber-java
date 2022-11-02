@api
@non_fcra
@lsrm
@section
@borrower
@address_history
Feature: LSRM - Borrower Section - Address history

  @MADLRVP-10700
  Scenario: [MADLRVP-10700] Verify LSRM - [29/12/2020]: Verify IDP_098
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/borrower/MADLRVP-10700.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER']/Flagged/Alert[@Id='IDP_098'] |
    And the response has xpath
      | XPath                              | expected |
      | //Alert[@Id='IDP_098']/@ExternalId | IDP_098  |
      | //Alert[@Id='IDP_098']/@Active     | 1        |
      | //Alert[@Id='IDP_098']/@Status     | Y        |

  @MADLRVP-10701
  Scenario: [MADLRVP-10701] Verify LSRM - [22/10/2021]: Verify IDP_098 is not fired
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/borrower/MADLRVP-10701.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER']/NotFlagged/Alert[@Id='IDP_098'] |
    And the response has xpath
      | XPath                              | expected |
      | //Alert[@Id='IDP_098']/@ExternalId | IDP_098  |
      | //Alert[@Id='IDP_098']/@Active     | 1        |
      | //Alert[@Id='IDP_098']/@Status     | N        |

  @MADLRVP-10730
  Scenario: [MADLRVP-10730] Verify LSRM - Verify 4 owners displayed under Borrower Address History and Properties Section
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/borrower/MADLRVP-10730.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //BorrowerAddressHistory/Properties/Property[@currentOwner='EGBUNIKE UGO']   |
      | //BorrowerAddressHistory//Property[@currentOwner='EGBUNIKE UGO']/SiteAddress |
      | //BorrowerAddressHistory//Property[@currentOwner='EGBUNIKE UGO']/MailAddress |
    And the response has xpath
      | XPath                                                                             | expected                          |
      | //BorrowerAddressHistory//Property[@currentOwner='EGBUNIKE UGO']/@currentOwner2nd | COBB JAMES H                      |
      | //BorrowerAddressHistory//Property[@currentOwner='EGBUNIKE UGO']/@currentOwner3rd | ADEKANMBI JOBA                    |
      | //BorrowerAddressHistory//Property[@currentOwner='EGBUNIKE UGO']/@currentOwner4th | KOYFMAN YEVGENIY                  |
      | //BorrowerAddressHistory//Property[@currentOwner='EGBUNIKE UGO']/@lastGrantor     | BUFFALO RIVER REALTY LLC          |
      | //Property[@currentOwner='EGBUNIKE UGO']/SiteAddress/@addressID                   | [empty]                           |
      | //Property[@currentOwner='EGBUNIKE UGO']/SiteAddress/@carrierRoute                | C063                              |
      | //Property[@currentOwner='EGBUNIKE UGO']/SiteAddress/@city                        | CHARLOTTE                         |
      | //Property[@currentOwner='EGBUNIKE UGO']/SiteAddress/@fips                        | 37119                             |
      | //Property[@currentOwner='EGBUNIKE UGO']/SiteAddress/@houseNum                    | 2629                              |
      | //Property[@currentOwner='EGBUNIKE UGO']/SiteAddress/@msaCode                     | 16740                             |
      | //Property[@currentOwner='EGBUNIKE UGO']/SiteAddress/@msaName                     | Charlotte-Gastonia-Concord, NC-SC |
      | //Property[@currentOwner='EGBUNIKE UGO']/SiteAddress/@cbsaCode                    | 16740                             |
      | //Property[@currentOwner='EGBUNIKE UGO']/SiteAddress/@cbsaName                    | Charlotte-Gastonia-Concord, NC-SC |
      | //Property[@currentOwner='EGBUNIKE UGO']/SiteAddress/@postDir                     | [empty]                           |
      | //Property[@currentOwner='EGBUNIKE UGO']/SiteAddress/@preDir                      | [empty]                           |
      | //Property[@currentOwner='EGBUNIKE UGO']/SiteAddress/@state                       | NC                                |
      | //Property[@currentOwner='EGBUNIKE UGO']/SiteAddress/@streetName                  | VAIL                              |
      | //Property[@currentOwner='EGBUNIKE UGO']/SiteAddress/@suffix                      | AVE                               |
      | //Property[@currentOwner='EGBUNIKE UGO']/SiteAddress/@unitNum                     | [empty]                           |
      | //Property[@currentOwner='EGBUNIKE UGO']/SiteAddress/@unitType                    | [empty]                           |
      | //Property[@currentOwner='EGBUNIKE UGO']/SiteAddress/@zip                         | 28207                             |
      | //Property[@currentOwner='EGBUNIKE UGO']/SiteAddress/@zip4                        | 2015                              |
      | //Property[@currentOwner='EGBUNIKE UGO']/SiteAddress/@streetAddr                  | 2629 VAIL AVE                     |
      | //Property[@currentOwner='EGBUNIKE UGO']/SiteAddress/@standardized                | true                              |
      | //Property[@currentOwner='EGBUNIKE UGO']/SiteAddress/@address                     | [empty]                           |
      | //Property[@currentOwner='EGBUNIKE UGO']/SiteAddress/@source                      | [empty]                           |
      | //Property[@currentOwner='EGBUNIKE UGO']/SiteAddress/@dispute                     | [empty]                           |
      | //Property[@currentOwner='EGBUNIKE UGO']/SiteAddress/@censusBlock                 | 371190024002007                   |
      | //Property[@currentOwner='EGBUNIKE UGO']/SiteAddress/@county                      | MECKLENBURG                       |
      | //Property[@currentOwner='EGBUNIKE UGO']/SiteAddress/@addressSuite                | [empty]                           |
      | //Property[@currentOwner='EGBUNIKE UGO']/SiteAddress/@apn                         | [empty]                           |
      | //Property[@currentOwner='EGBUNIKE UGO']/SiteAddress/@fips5                       | [empty]                           |
      | //Property[@currentOwner='EGBUNIKE UGO']/SiteAddress/@cityStateZip                | CHARLOTTE, NC 28207               |
      | //Property[@currentOwner='EGBUNIKE UGO']/MailAddress/@addressID                   | [empty]                           |
      | //Property[@currentOwner='EGBUNIKE UGO']/MailAddress/@carrierRoute                | [empty]                           |
      | //Property[@currentOwner='EGBUNIKE UGO']/MailAddress/@city                        | BROOKLYN                          |
      | //Property[@currentOwner='EGBUNIKE UGO']/MailAddress/@fips                        | 0                                 |
      | //Property[@currentOwner='EGBUNIKE UGO']/MailAddress/@houseNum                    | 1080                              |
      | //Property[@currentOwner='EGBUNIKE UGO']/MailAddress/@msaCode                     | [empty]                           |
      | //Property[@currentOwner='EGBUNIKE UGO']/MailAddress/@msaName                     | [empty]                           |
      | //Property[@currentOwner='EGBUNIKE UGO']/MailAddress/@cbsaCode                    | [empty]                           |
      | //Property[@currentOwner='EGBUNIKE UGO']/MailAddress/@cbsaName                    | [empty]                           |
      | //Property[@currentOwner='EGBUNIKE UGO']/MailAddress/@postDir                     | [empty]                           |
      | //Property[@currentOwner='EGBUNIKE UGO']/MailAddress/@preDir                      | [empty]                           |
      | //Property[@currentOwner='EGBUNIKE UGO']/MailAddress/@state                       | NY                                |
      | //Property[@currentOwner='EGBUNIKE UGO']/MailAddress/@streetName                  | BERGEN                            |
      | //Property[@currentOwner='EGBUNIKE UGO']/MailAddress/@suffix                      | ST                                |
      | //Property[@currentOwner='EGBUNIKE UGO']/MailAddress/@unitNum                     | 238                               |
      | //Property[@currentOwner='EGBUNIKE UGO']/MailAddress/@unitType                    | #                                 |
      | //Property[@currentOwner='EGBUNIKE UGO']/MailAddress/@zip                         | 11216                             |
      | //Property[@currentOwner='EGBUNIKE UGO']/MailAddress/@zip4                        | 3340                              |
      | //Property[@currentOwner='EGBUNIKE UGO']/MailAddress/@streetAddr                  | 1080 BERGEN ST Unit 238           |
      | //Property[@currentOwner='EGBUNIKE UGO']/MailAddress/@standardized                | false                             |
      | //Property[@currentOwner='EGBUNIKE UGO']/MailAddress/@address                     | [empty]                           |
      | //Property[@currentOwner='EGBUNIKE UGO']/MailAddress/@source                      | [empty]                           |
      | //Property[@currentOwner='EGBUNIKE UGO']/MailAddress/@dispute                     | [empty]                           |
      | //Property[@currentOwner='EGBUNIKE UGO']/MailAddress/@censusBlock                 | [empty]                           |
      | //Property[@currentOwner='EGBUNIKE UGO']/MailAddress/@county                      | [empty]                           |
      | //Property[@currentOwner='EGBUNIKE UGO']/MailAddress/@addressSuite                | [empty]                           |
      | //Property[@currentOwner='EGBUNIKE UGO']/MailAddress/@apn                         | [empty]                           |
      | //Property[@currentOwner='EGBUNIKE UGO']/MailAddress/@fips5                       | [empty]                           |
      | //Property[@currentOwner='EGBUNIKE UGO']/MailAddress/@cityStateZip                | BROOKLYN, NY 11216                |

  @MADLRVP-13316
  Scenario: [MADLRVP-13316] Verify LSRM - Suppress IDP_093 when IDP_040 fires
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/borrower/MADLRVP-13316.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER']/Flagged/Alert[@Id='IDP_040']    |
      | //Category[@Name='BORROWER']/NotFlagged/Alert[@Id='IDP_093'] |
    And the response has xpath
      | XPath                              | expected |
      | //Alert[@Id='IDP_040']/@ExternalId | IDP_040  |
      | //Alert[@Id='IDP_040']/@Active     | 1        |
      | //Alert[@Id='IDP_040']/@Status     | Y        |
      | //Alert[@Id='IDP_093']/@ExternalId | IDP_093  |
      | //Alert[@Id='IDP_093']/@Active     | 1        |
      | //Alert[@Id='IDP_093']/@Status     | N        |

  @MADLRVP-13318
  Scenario: [MADLRVP-13318] Verify LSRM - Fire IDP_093 and IDP_040 in the same report for different borrowers
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/borrower/MADLRVP-13318.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER']/Flagged/Alert[@Id='IDP_040'] |
      | //Category[@Name='BORROWER']/Flagged/Alert[@Id='IDP_093'] |
    And the response has xpath
      | XPath                              | expected |
      | //Alert[@Id='IDP_040']/@ExternalId | IDP_040  |
      | //Alert[@Id='IDP_040']/@Active     | 1        |
      | //Alert[@Id='IDP_040']/@Status     | Y        |
      | //Alert[@Id='IDP_093']/@ExternalId | IDP_093  |
      | //Alert[@Id='IDP_093']/@Active     | 1        |
      | //Alert[@Id='IDP_093']/@Status     | Y        |
    And the response has xpath //Alert[@Id='IDP_040']/@Message with value (ignoring newline and spaces)
    """
    WEYCHECK, MOHAMMED - Borrower has had one or more foreclosures,
    or deed in lieu of foreclosure filings in the past 7 years
    """
    And the response has xpath //Alert[@Id='IDP_093']/@Message with value (ignoring newline and spaces)
    """
    Becker, Daniel A - Borrower's previously owned
    property had an NOD and a Foreclosure.
    """

  @MADLRVP-13650
  Scenario Outline: [MADLRVP-13650] Verify LSRM - IDP_097 fires for 2 borrowers
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/borrower/MADLRVP-13650.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER']/Flagged/Alert[@Id='<alert_id>'][1]                  |
      | //Category[@Name='BORROWER']/Flagged/Alert[@Id='<alert_id>'][2]                  |
      | //BorrowerSection/BorrowerAddressHistory/Properties/Property/History/Transaction |
      | //BorrowerSection//Transaction[@uniqueID='738677738']                            |
      | //BorrowerSection//Transaction[@uniqueID='57355432']                             |
      | //BorrowerSection//Transaction[@uniqueID='736969670']                            |
      | //BorrowerSection//Transaction[@uniqueID='732935681']                            |
    And the response has xpath
      | XPath                                                       | expected            |
      | //Flagged/Alert[@Id='<alert_id>'][1]/@ExternalId            | <alert_id>          |
      | //Flagged/Alert[@Id='<alert_id>'][1]/@Active                | 1                   |
      | //Flagged/Alert[@Id='<alert_id>'][1]/@Status                | Y                   |
      | //Flagged/Alert[@Id='<alert_id>'][2]/@ExternalId            | <alert_id>          |
      | //Flagged/Alert[@Id='<alert_id>'][2]/@Active                | 1                   |
      | //Flagged/Alert[@Id='<alert_id>'][2]/@Status                | Y                   |
      | //Transaction[@uniqueID='738677738']/@seller2               | AGAMALIAN ARTAK     |
      | //Transaction[@uniqueID='738677738']/@transTypeShortDisplay | T/FRCL              |
      | //Transaction[@uniqueID='57355432']/@seller2                | LASKIN MELISSA A    |
      | //Transaction[@uniqueID='57355432']/@transTypeShortDisplay  | T/FRCL              |
      | //Transaction[@uniqueID='736969670']/@seller                | ALVAREZ ORLANDO     |
      | //Transaction[@uniqueID='736969670']/@transTypeShortDisplay | T/FRCL              |
      | //Transaction[@uniqueID='732935681']/@seller                | ALVAREZ ORLANDO COC |
      | //Transaction[@uniqueID='732935681']/@transTypeShortDisplay | T/FRCL              |

    Examples:
      | alert_id |
      | IDP_097  |


  @MADLRVP-13651
  Scenario Outline: [MADLRVP-13651] Verify LSRM - IDP_097 fires for 3 borrowers
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/borrower/MADLRVP-13651.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER']/Flagged/Alert[@Id='<alert_id>'][1]                  |
      | //Category[@Name='BORROWER']/Flagged/Alert[@Id='<alert_id>'][2]                  |
      | //Category[@Name='BORROWER']/Flagged/Alert[@Id='<alert_id>'][3]                  |
      | //BorrowerSection/BorrowerAddressHistory/Properties/Property/History/Transaction |
      | //BorrowerSection//Transaction[@uniqueID='738677738']                            |
      | //BorrowerSection//Transaction[@uniqueID='57355432']                             |
      | //BorrowerSection//Transaction[@uniqueID='743747509']                            |
      | //BorrowerSection//Transaction[@uniqueID='737594827']                            |
    And the response has xpath
      | XPath                                                       | expected                 |
      | //Flagged/Alert[@Id='<alert_id>'][1]/@ExternalId            | <alert_id>               |
      | //Flagged/Alert[@Id='<alert_id>'][1]/@Active                | 1                        |
      | //Flagged/Alert[@Id='<alert_id>'][1]/@Status                | Y                        |
      | //Flagged/Alert[@Id='<alert_id>'][2]/@ExternalId            | <alert_id>               |
      | //Flagged/Alert[@Id='<alert_id>'][2]/@Active                | 1                        |
      | //Flagged/Alert[@Id='<alert_id>'][2]/@Status                | Y                        |
      | //Flagged/Alert[@Id='<alert_id>'][3]/@ExternalId            | <alert_id>               |
      | //Flagged/Alert[@Id='<alert_id>'][3]/@Active                | 1                        |
      | //Flagged/Alert[@Id='<alert_id>'][3]/@Status                | Y                        |
      | //Transaction[@uniqueID='738677738']/@seller2               | AGAMALIAN ARTAK          |
      | //Transaction[@uniqueID='738677738']/@transTypeShortDisplay | T/FRCL                   |
      | //Transaction[@uniqueID='57355432']/@seller2                | LASKIN MELISSA A         |
      | //Transaction[@uniqueID='57355432']/@transTypeShortDisplay  | T/FRCL                   |
      | //Transaction[@uniqueID='743747509']/@seller2               | ARRIAGA JUAN M & NANCY S |
      | //Transaction[@uniqueID='743747509']/@transTypeShortDisplay | T/FRCL                   |
      | //Transaction[@uniqueID='737594827']/@seller                | AGUIRRE ARACELI          |
      | //Transaction[@uniqueID='737594827']/@transTypeShortDisplay | T/FRCL                   |

    Examples:
      | alert_id |
      | IDP_097  |

  @MADLRVP-13720
  Scenario: [MADLRVP-13720] Verify LSRM - suppression of IDP_098 when IDP_097 fires
    Given the request XML filepath is /ript/non_fcra/lsrm/sections/borrower/MADLRVP-13720.xml
    When the LSRM request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER']/Flagged/Alert[@Id='IDP_097']    |
      | //Category[@Name='BORROWER']/NotFlagged/Alert[@Id='IDP_098'] |
    And the response has xpath
      | XPath                                         | expected |
      | //Flagged/Alert[@Id='IDP_097']/@ExternalId    | IDP_097  |
      | //Flagged/Alert[@Id='IDP_097']/@Active        | 1        |
      | //Flagged/Alert[@Id='IDP_097']/@Status        | Y        |
      | //NotFlagged/Alert[@Id='IDP_098']/@ExternalId | IDP_098  |
      | //NotFlagged/Alert[@Id='IDP_098']/@Active     | 1        |
      | //NotFlagged/Alert[@Id='IDP_098']/@Status     | N        |
