@api
@non_fcra
@lsfm
@section
@borrower
@address_history
Feature: LSFM - Borrower Section - Address history

  @MADLRVP-10686 @qa_only
  Scenario: [MADLRVP-10686] Verify LSFM - [search date 01/02/2013] : Verify IDP_040|IDP_097
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/borrower/MADLRVP-10686.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category/Flagged//Alert[@Id='IDP_040'] |
      | //Category/Flagged//Alert[@Id='IDP_097'] |
    And the response has xpath
      | XPath                          | expected |
      | //Alert[@Id='IDP_040']/@Active | 1        |
      | //Alert[@Id='IDP_040']/@Status | Y        |
      | //Alert[@Id='IDP_097']/@Active | 1        |
      | //Alert[@Id='IDP_097']/@Status | Y        |

  @MADLRVP-10688
  Scenario: [MADLRVP-10688] Verify LSFM - [search date=the date of the run the request]: Verify no IDP_098 is fired
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/borrower/MADLRVP-10688.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category/NotFlagged//Alert[@Id='IDP_098'] |
    And the response has xpath
      | XPath                          | expected |
      | //Alert[@Id='IDP_098']/@Active | 1        |
      | //Alert[@Id='IDP_098']/@Status | N        |

  @MADLRVP-10728
  Scenario: [MADLRVP-10728] Verify LSFM 4.1 - Verify 4 owners displayed under Borrower Address History and Properties Section
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/borrower/MADLRVP-10728.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //BorrowerAddressHistory//Property[@currentOwner='EGBUNIKE UGO'] |
    And the response has xpath
      | XPath                                                                             | expected                 |
      | //BorrowerAddressHistory//Property[@currentOwner='EGBUNIKE UGO']/@currentOwner    | EGBUNIKE UGO             |
      | //BorrowerAddressHistory//Property[@currentOwner='EGBUNIKE UGO']/@currentOwner2nd | COBB JAMES H             |
      | //BorrowerAddressHistory//Property[@currentOwner='EGBUNIKE UGO']/@currentOwner3rd | ADEKANMBI JOBA           |
      | //BorrowerAddressHistory//Property[@currentOwner='EGBUNIKE UGO']/@currentOwner4th | KOYFMAN YEVGENIY         |
      | //BorrowerAddressHistory//Property[@currentOwner='EGBUNIKE UGO']/@lastGrantor     | BUFFALO RIVER REALTY LLC |

  @MADLRVP-10690
  Scenario Outline: [MADLRVP-10690] Verify LSFM - Verify that DIL is displayed for the user with such transaction and a retro date
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/borrower/MADLRVP-10690.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category/Flagged//Alert[@Id='<alert_id>']             |
      | //BorrowerSection//Transaction[@uniqueID='<unique_id>'] |
    And the response has xpath
      | XPath                                                                          | expected |
# Flagged Alert
      | //Alert[@Id='<alert_id>']/@Active                                              | 1        |
      | //Alert[@Id='<alert_id>']/@Status                                              | Y        |
# BorrowerSection
      | //BorrowerSection//Transaction[@uniqueID='<unique_id>']/@transTypeShortDisplay | T/FRCL   |
      | //BorrowerSection//Transaction[@uniqueID='<unique_id>']/@deedTypeShortDisplay  | DIL      |

    Examples:
      | alert_id | unique_id |
      | IDP_097  | 301230    |

  @MADLRVP-13309
  Scenario: [MADLRVP-13309] Verify LSFM - Suppress IDP_093 when IDP_040 fires
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/borrower/MADLRVP-13309.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
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

  @MADLRVP-13311
  Scenario: [MADLRVP-13311] Verify LSFM - Fire IDP_093 and IDP_040 in the same report for different borrowers
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/borrower/MADLRVP-13311.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
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

  @MADLRVP-13647
  Scenario Outline: [MADLRVP-13647] Verify LSFM - IDP_097 fires for 3 borrowers
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/borrower/MADLRVP-13647.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER']/Flagged/Alert[@Id='<alert_id>'][1]                  |
      | //Category[@Name='BORROWER']/Flagged/Alert[@Id='<alert_id>'][2]                  |
      | //Category[@Name='BORROWER']/Flagged/Alert[@Id='<alert_id>'][3]                  |
      | //BorrowerSection/BorrowerAddressHistory/Properties/Property/History/Transaction |
      | //BorrowerSection//Transaction[@uniqueID='732924508']                            |
      | //BorrowerSection//Transaction[@uniqueID='739437290']                            |
      | //BorrowerSection//Transaction[@uniqueID='737703223']                            |
    And the response has xpath
      | XPath                                                       | expected         |
      | //Flagged/Alert[@Id='<alert_id>'][1]/@ExternalId            | <alert_id>       |
      | //Flagged/Alert[@Id='<alert_id>'][1]/@Active                | 1                |
      | //Flagged/Alert[@Id='<alert_id>'][1]/@Status                | Y                |
      | //Flagged/Alert[@Id='<alert_id>'][2]/@ExternalId            | <alert_id>       |
      | //Flagged/Alert[@Id='<alert_id>'][2]/@Active                | 1                |
      | //Flagged/Alert[@Id='<alert_id>'][2]/@Status                | Y                |
      | //Flagged/Alert[@Id='<alert_id>'][3]/@ExternalId            | <alert_id>       |
      | //Flagged/Alert[@Id='<alert_id>'][3]/@Active                | 1                |
      | //Flagged/Alert[@Id='<alert_id>'][3]/@Status                | Y                |
      | //Transaction[@uniqueID='732924508']/@seller2               | BAYAN GRACE      |
      | //Transaction[@uniqueID='732924508']/@transTypeShortDisplay | T/FRCL           |
      | //Transaction[@uniqueID='739437290']/@seller2               | BENNETT SANDRA K |
      | //Transaction[@uniqueID='739437290']/@transTypeShortDisplay | T/FRCL           |
      | //Transaction[@uniqueID='737703223']/@seller                | ALLEN JEFF J JR  |
      | //Transaction[@uniqueID='737703223']/@transTypeShortDisplay | T/FRCL           |

    Examples:
      | alert_id |
      | IDP_097  |

  @MADLRVP-13649
  Scenario: [MADLRVP-13649] Verify LSFM - IDP_097 does not suppress IDP_040 and IDP_093
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/borrower/MADLRVP-13649.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER']/Flagged/Alert[@Id='IDP_097']                        |
      | //Category[@Name='BORROWER']/Flagged/Alert[@Id='IDP_040']                        |
      | //Category[@Name='BORROWER']/Flagged/Alert[@Id='IDP_093']                        |
      | //BorrowerSection/BorrowerAddressHistory/Properties/Property/History/Transaction |
      | //BorrowerSection//Transaction[@uniqueID='743747509']                            |
      | //BorrowerSection//Transaction[@uniqueID='645639538']                            |
    And the response has xpath
      | XPath                                                       | expected                 |
      | //Flagged/Alert[@Id='IDP_097']/@ExternalId                  | IDP_097                  |
      | //Flagged/Alert[@Id='IDP_097']/@Active                      | 1                        |
      | //Flagged/Alert[@Id='IDP_097']/@Status                      | Y                        |
      | //Flagged/Alert[@Id='IDP_040']/@ExternalId                  | IDP_040                  |
      | //Flagged/Alert[@Id='IDP_040']/@Active                      | 1                        |
      | //Flagged/Alert[@Id='IDP_040']/@Status                      | Y                        |
      | //Flagged/Alert[@Id='IDP_093']/@ExternalId                  | IDP_093                  |
      | //Flagged/Alert[@Id='IDP_093']/@Active                      | 1                        |
      | //Flagged/Alert[@Id='IDP_093']/@Status                      | Y                        |
      | //Transaction[@uniqueID='743747509']/@seller2               | ARRIAGA JUAN M & NANCY S |
      | //Transaction[@uniqueID='743747509']/@transTypeShortDisplay | T/FRCL                   |
      | //Transaction[@uniqueID='645639538']/@seller2               | CARTER KEVIN             |
      | //Transaction[@uniqueID='645639538']/@transTypeShortDisplay | T/FRCL                   |

  @MADLRVP-13719
  Scenario: [MADLRVP-13719] Verify LSFM - suppression of IDP_098 when IDP_097 fires
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/borrower/MADLRVP-13719.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
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