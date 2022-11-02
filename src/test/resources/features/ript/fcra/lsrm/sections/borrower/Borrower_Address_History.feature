@api
@fcra
@lsrm
@section
@borrower
@address_history
Feature: LSRM FCRA - Borrower Section - Address history

  @MADLRVP-10698
  Scenario: [MADLRVP-10698] Verify LSRM FCRA - [search date: 01/02/2018]: Verify IDP_093
    Given the request XML filepath is /ript/fcra/lsrm/sections/borrower/MADLRVP-10698.xml
    When the LSRM FCRA request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER']/Flagged/Alert[@Id='IDP_093'] |
    And the response has xpath
      | XPath                              | expected |
      | //Alert[@Id='IDP_093']/@ExternalId | IDP_093  |
      | //Alert[@Id='IDP_093']/@Active     | 1        |
      | //Alert[@Id='IDP_093']/@Status     | Y        |

  @MADLRVP-10699
  Scenario: [MADLRVP-10699] Verify LSRM FCRA - [no search date] : Verify no IDP_040/IDP_097 are fired
    Given the request XML filepath is /ript/fcra/lsrm/sections/borrower/MADLRVP-10699.xml
    When the LSRM FCRA request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER']/NotFlagged/Alert[@Id='IDP_040'] |
      | //Category[@Name='BORROWER']/NotFlagged/Alert[@Id='IDP_097'] |
    And the response has xpath
      | XPath                              | expected |
      | //Alert[@Id='IDP_040']/@ExternalId | IDP_040  |
      | //Alert[@Id='IDP_040']/@Active     | 1        |
      | //Alert[@Id='IDP_040']/@Status     | N        |
      | //Alert[@Id='IDP_097']/@ExternalId | IDP_097  |
      | //Alert[@Id='IDP_097']/@Active     | 1        |
      | //Alert[@Id='IDP_097']/@Status     | N        |

  @MADLRVP-10702
  Scenario Outline: [MADLRVP-10702] Verify LSRM FCRA - Verify that DIL is displayed for the user with such transaction and a retro date
    Given the request XML filepath is /ript/fcra/lsrm/sections/borrower/MADLRVP-10702.xml
    When the LSRM FCRA request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER']/Flagged/Alert[@Id='<alert_id>']                                              |
      | //BorrowerSection/BorrowerAddressHistory/Properties/Property/History/Transaction[@uniqueID='<unique_id>'] |
    And the response has xpath
      | XPath                                                                          | expected   |
# Flagged Alert
      | //Alert[@Id='<alert_id>']/@ExternalId                                          | <alert_id> |
      | //Alert[@Id='<alert_id>']/@Active                                              | 1          |
      | //Alert[@Id='<alert_id>']/@Status                                              | Y          |
# BorrowerSection
      | //BorrowerSection//Transaction[@uniqueID='<unique_id>']/@transTypeShortDisplay | T/FRCL     |
      | //BorrowerSection//Transaction[@uniqueID='<unique_id>']/@deedTypeShortDisplay  | DIL        |

    Examples:
      | alert_id | unique_id |
      | IDP_097  | 301230    |

  @MADLRVP-10711
  Scenario: [MADLRVP-10711] Verify LSRM FCRA - [search date: 01/02/2013]: Verify IDP_040|IDP_097
    Given the request XML filepath is /ript/fcra/lsrm/sections/borrower/MADLRVP-10711.xml
    When the LSRM FCRA request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER']/Flagged/Alert[@Id='IDP_040'] |
      | //Category[@Name='BORROWER']/Flagged/Alert[@Id='IDP_097'] |
    And the response has xpath
      | XPath                              | expected |
      | //Alert[@Id='IDP_040']/@ExternalId | IDP_040  |
      | //Alert[@Id='IDP_040']/@Active     | 1        |
      | //Alert[@Id='IDP_040']/@Status     | Y        |
      | //Alert[@Id='IDP_097']/@ExternalId | IDP_097  |
      | //Alert[@Id='IDP_097']/@Active     | 1        |
      | //Alert[@Id='IDP_097']/@Status     | Y        |

  @MADLRVP-13317
  Scenario: [MADLRVP-13317] Verify LSRM FCRA - Suppress IDP_093 when IDP_040 fires
    Given the request XML filepath is /ript/fcra/lsrm/sections/borrower/MADLRVP-13317.xml
    When the LSRM FCRA request is sent
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

  @MADLRVP-13653
  Scenario: [MADLRVP-13653] Verify LSRM FCRA - IDP_097 does not suppress IDP_040 and IDP_093
    Given the request XML filepath is /ript/fcra/lsrm/sections/borrower/MADLRVP-13653.xml
    When the LSRM FCRA request is sent
    Then response content type is XML
    And successful LSRM report is received
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

  @MADLRVP-13722
  Scenario: [MADLRVP-13722] Verify LSRM FCRA - suppression of IDP_098 when IDP_097 fires
    Given the request XML filepath is /ript/fcra/lsrm/sections/borrower/MADLRVP-13722.xml
    When the LSRM FCRA request is sent
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
