@api
@non_fcra
@lsfm
@section
@borrower
@undisclosed_debt
Feature: LSFM - Borrower Section - Undisclosed Debt

  @MADLRVP-15950
  Scenario Outline: [MADLRVP-15950] Verify LSFM - Suppress IDP_067 when role is a 'Non Borrowing Owner'
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/borrower/MADLRVP-15950.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
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

  @MADLRVP-15952
  Scenario Outline: [MADLRVP-15952] Verify LSFM - Suppression of IDP_067 for roles that contains "borrower" or "aka"
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/borrower/MADLRVP-15952.xml
    When the LSFM request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category/Flagged/Alert[@Id='<alert_id>'][1] |
      | //Category/Flagged/Alert[@Id='<alert_id>'][2] |
    And the response has xpath
      | XPath                                    | expected   |
      | //Flagged/Alert[@Id='<alert_id>'][1]/@ExternalId | <alert_id> |
      | //Flagged/Alert[@Id='<alert_id>'][1]/@Active     | 1          |
      | //Flagged/Alert[@Id='<alert_id>'][1]/@Status     | Y          |
      | //Flagged/Alert[@Id='<alert_id>'][2]/@ExternalId | <alert_id> |
      | //Flagged/Alert[@Id='<alert_id>'][2]/@Active     | 1          |
      | //Flagged/Alert[@Id='<alert_id>'][2]/@Status     | Y          |
    And the response has xpath //Flagged/Alert[@Id='<alert_id>'][starts-with(@Message,'ARDMILLE')]/@Message with value (ignoring newline and spaces)
    """
    ARDMILLE, KELLY - Suspicious sale. Borrower's last name Matches
    Loan Actor (Closing Agent) for this transaction.
    """
    And the response has xpath //Flagged/Alert[@Id='<alert_id>'][starts-with(@Message,'GAGLESTON')]/@Message with value (ignoring newline and spaces)
    """
    GAGLESTON, GAIL - Suspicious sale.  Borrower's last name Matches
    Loan Actor (Notary),Loan Actor (Other) for this transaction.
    """

    Examples:
      | alert_id |
      | IDP_067  |
