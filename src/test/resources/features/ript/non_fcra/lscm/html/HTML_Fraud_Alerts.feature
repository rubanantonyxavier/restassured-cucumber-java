@api
@non_fcra
@lscm
@html
@fraud
@alerts
Feature: LSCM HTML FRAUD ALERTS section

  @MADLRVP-14165
  Scenario Outline: [MADLRVP-14165] Verify LSCM HTML - FRAUD ALERTS section
    Given the request XML filepath is /ript/non_fcra/lscm/html/MADLRVP-14165.xml
    When the LSCM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with IMAGE content
      | XPath               | expected                                                            |
      | <section_xpath>/img | /PCFRSWebElements/images/ui/collateralManager/fraud_alert_white.gif |
    And multiple HTML elements by xpath <section_xpath>//td/div match regex '(FRAUD SCORE RISK|OCCUPANCY & UNDISCLOSED DEBT|INCOME EMPLOYMENT|IDENTITY|PROPERTY|MARKET|THIRD PARTY)'
    And multiple HTML elements by xpath <section_xpath>//td[@class='severity'] match regex '(LOW|MEDIUM|HIGH|INFO|—)'
# CM_fraudAlerts table. High severity messages are red
    And multiple HTML elements by xpath //div[@id='CM_fraudAlert']//tr[./td[@class='severity'][contains(.,'HIGH')]]/td[./a] has attribute 'class' with value 'highAlert'
    And the HTML response has xpath with TEXT content
      | XPath                            | expected    |
      | <section_xpath>//td[@class='']/a | [NOT EMPTY] |
      | <section_xpath>//tr/td[4]        | [NOT EMPTY] |

    Examples:
      | section_xpath              |
      | //div[@id='CM_fraudAlert'] |