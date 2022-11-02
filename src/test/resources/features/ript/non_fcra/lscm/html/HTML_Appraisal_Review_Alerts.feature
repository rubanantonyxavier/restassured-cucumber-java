@api
@non_fcra
@lscm
@html
@appraisal_review_alerts
Feature: LSCM HTML APPRAISAL REVIEW ALERTS section

  @MADLRVP-14164
  Scenario Outline: [MADLRVP-14164] Verify LSCM HTML - APPRAISAL REVIEW ALERTS section
    Given the request XML filepath is /ript/non_fcra/lscm/html/MADLRVP-14164.xml
    When the LSCM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with IMAGE content
      | XPath               | expected                                                                  |
      | <section_xpath>/img | /PCFRSWebElements/images/ui/collateralManager//collateral_alert_white.gif |
    And multiple HTML elements by xpath <section_xpath>//td/div match regex '(FRAUD SCORE RISK|OCCUPANCY & UNDISCLOSED DEBT|INCOME EMPLOYMENT|IDENTITY|PROPERTY|MARKET|THIRD PARTY)'
    And multiple HTML elements by xpath <section_xpath>//td[@class='severity'] match regex '(LOW|MEDIUM|HIGH|INFO|—)'
    And the HTML response has xpath with TEXT content
      | XPath                            | expected    |
      | <section_xpath>//td[@class='']/a | [NOT EMPTY] |
      | <section_xpath>//tr/td[4]        | [NOT EMPTY] |

    Examples:
      | section_xpath                   |
      | //div[@id='CM_collateralAlert'] |