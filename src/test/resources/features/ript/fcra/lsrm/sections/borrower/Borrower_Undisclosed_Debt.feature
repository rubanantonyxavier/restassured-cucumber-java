@api
@fcra
@lsrm
@section
@borrower
@undisclosed_debt
Feature: LSRM FCRA - Borrower Section - Undisclosed Debt

  @MADLRVP-13776
  Scenario Outline: [MADLRVP-13776] Verify LSRM FCRA - IDP_067 is suppressed when other loan actor has a role that contains "borrower" or "AKA"
    Given the request XML filepath is /ript/fcra/lsrm/sections/borrower/MADLRVP-13776.xml
    When the LSRM FCRA request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category/NotFlagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                 | expected   |
      | //Alert[@Id='<alert_id>']/@ExternalId | <alert_id> |
      | //Alert[@Id='<alert_id>']/@Active     | 1          |
      | //Alert[@Id='<alert_id>']/@Status     | N          |

    Examples:
      | alert_id |
      | IDP_067  |

  @MADLRVP-14522
  Scenario Outline: [MADLRVP-14522] Verify LSRM FCRA - Suppress IDP_067 when role is a 'Non Borrowing Owner'
    Given the request XML filepath is /ript/fcra/lsrm/sections/borrower/MADLRVP-14522.xml
    When the LSRM FCRA request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //Category/Flagged/Alert[@Id='<alert_id>'] |
    And the response has xpath
      | XPath                                         | expected   |
      | //Flagged/Alert[@Id='<alert_id>']/@ExternalId | <alert_id> |
      | //Flagged/Alert[@Id='<alert_id>']/@Active     | 1          |
      | //Flagged/Alert[@Id='<alert_id>']/@Status     | Y          |
    And the response has xpath //Flagged/Alert[@Id='<alert_id>']/@Message with value (ignoring newline and spaces)
    """
    Ardmille, Kelly - Suspicious sale.
    Borrower's last name matches Loan Actor (Attorney) for this transaction.
    """

    Examples:
      | alert_id |
      | IDP_067  |