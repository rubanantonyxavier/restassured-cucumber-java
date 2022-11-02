@api
@non_fcra
@lsfm
@html
@fraud
@alerts
Feature: LSFM HTML FRAUD ALERTS section

  @MADLRVP-9133
  Scenario: [MADLRVP-9133] Verify LSFM HTML - FRAUD ALERTS section
    Given the request XML filepath is /ript/non_fcra/lsfm/html/MADLRVP-9133.xml
    When the request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with IMAGE content
      | XPath                                                       | expected                                               |
      | //div[@id='FM_fraudAlert']/img[@alt='Fraud Alerts Section'] | /PCFRSWebElements/images/ui/lsfm/fraud_alert_white.gif |
      | //div[@id='FM_fraudAlert']//div[@class='FM_Score_Bar']/img  | /PCFRSWebElements/images/ui/lsfm/fraud_scale_9.gif     |
    And the HTML response has xpath with TEXT content
      | XPath                                             | expected                               |
      | //div[@class='FM_Number_Score FM_Not_Rescorable'] | [MATCH --> Fraud Risk Score: \\d{1,3}] |
      | //tr[@class='FM_ReasonCodes']//b                  | TOP SCORE CONTRIBUTORS                 |
      | //tr[@class='FM_ReasonCodes']//tr[1]/td[1]        | [NOT EMPTY]                            |
      | //tr[@class='FM_ReasonCodes']//tr[1]/td[2]        | [NOT EMPTY]                            |
# FM_fraudAlerts table header
      | //div[@id='FM_fraudAlerts']//tbody//th[1]                  | [empty]                      |
      | //div[@id='FM_fraudAlerts']//tbody//th[2]                  | Severity                     |
      | //div[@id='FM_fraudAlerts']//tbody//th[3]                  | Message                      |
      | //div[@id='FM_fraudAlerts']//tbody//th[4]                  | Recommendation               |
# FM_fraudAlerts table first column
      | (//div[@id='FM_fraudAlerts']//td[@class='title'])[1]/a/div | FRAUD SCORE RISK             |
      | (//div[@id='FM_fraudAlerts']//td[@class='title'])[2]/a/div | OCCUPANCY & UNDISCLOSED DEBT |
      | (//div[@id='FM_fraudAlerts']//td[@class='title'])[3]/a/div | INCOME EMPLOYMENT            |
      | (//div[@id='FM_fraudAlerts']//td[@class='title'])[4]/a/div | IDENTITY                     |
      | (//div[@id='FM_fraudAlerts']//td[@class='title'])[5]/a/div | PROPERTY                     |
      | (//div[@id='FM_fraudAlerts']//td[@class='title'])[6]/a/div | MARKET                       |
      | (//div[@id='FM_fraudAlerts']//td[@class='title'])[7]/a/div | THIRD PARTY                  |
    And multiple HTML elements by xpath //td[contains(@class, 'severity')] match regex '(Low|Medium|High|Info|—)'
# FM_fraudAlerts table. High severity messages are red
    And multiple HTML elements by xpath //td[@class='severity'][contains(text(), 'High')]/following-sibling::*[1] has attribute 'class' with value 'highAlert'
    And multiple HTML elements by xpath match regex
      | XPath                                                       | expected        |
#  All Severity and Recommendation fields are not empty
      | //table[@class='FM_fraudAlert']//tr/td[3]                   | [\w\W]+         |
      | //table[@class='FM_fraudAlert']//tr/td[4]                   | [\w\W]+         |
#  No alert Severity and Recommendation columns
      | //td[@class='severity dfltcursor']/following-sibling::td[1] | No Alerts Found |
      | //td[@class='severity dfltcursor']/following-sibling::td[2] | —               |
