@api
@fcra
@lsfm
@section
@borrower
@address_history
Feature: LSFM FCRA - Borrower Section - Address history

  @MADLRVP-10687
  Scenario: [MADLRVP-10687] Verify LSFM FCRA - [search date 01/02/2018]: Verify IDP_093 is fired
    Given the request XML filepath is /ript/fcra/lsfm/sections/borrower/MADLRVP-10687.xml
    When the LSFM FCRA request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category/Flagged//Alert[@Id='IDP_093'] |
    And the response has xpath
      | XPath                          | expected |
      | //Alert[@Id='IDP_093']/@Active | 1        |
      | //Alert[@Id='IDP_093']/@Status | Y        |

  @MADLRVP-10689
  Scenario: [MADLRVP-10689] Verify LSFM FCRA - [14/05/2015]: Verify IDP_097
    Given the request XML filepath is /ript/fcra/lsfm/sections/borrower/MADLRVP-10689.xml
    When the LSFM FCRA request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category/Flagged//Alert[@Id='IDP_097'] |
    And the response has xpath
      | XPath                          | expected |
      | //Alert[@Id='IDP_097']/@Active | 1        |
      | //Alert[@Id='IDP_097']/@Status | Y        |

  @MADLRVP-13310
  Scenario: [MADLRVP-13310] Verify LSFM FCRA - Suppress IDP_093 when IDP_040 fires
    Given the request XML filepath is /ript/fcra/lsfm/sections/borrower/MADLRVP-13310.xml
    When the LSFM FCRA request is sent
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

  @MADLRVP-13652
  Scenario Outline: [MADLRVP-13652] Verify LSFM FCRA - IDP_097 fires for 2 borrowers
    Given the request XML filepath is /ript/fcra/lsfm/sections/borrower/MADLRVP-13652.xml
    When the LSFM FCRA request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='BORROWER']/Flagged/Alert[@Id='<alert_id>'][1]                  |
      | //Category[@Name='BORROWER']/Flagged/Alert[@Id='<alert_id>'][2]                  |
      | //BorrowerSection/BorrowerAddressHistory/Properties/Property/History/Transaction |
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
      | //Transaction[@uniqueID='739437290']/@seller2               | BENNETT SANDRA K |
      | //Transaction[@uniqueID='739437290']/@transTypeShortDisplay | T/FRCL           |
      | //Transaction[@uniqueID='737703223']/@seller                | ALLEN JEFF J JR  |
      | //Transaction[@uniqueID='737703223']/@transTypeShortDisplay | T/FRCL           |

    Examples:
      | alert_id |
      | IDP_097  |

  @MADLRVP-13721
  Scenario: [MADLRVP-13721] Verify LSFM FCRA - suppression of IDP_098 when IDP_097 fires
    Given the request XML filepath is /ript/fcra/lsfm/sections/borrower/MADLRVP-13721.xml
    When the LSFM FCRA request is sent
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
