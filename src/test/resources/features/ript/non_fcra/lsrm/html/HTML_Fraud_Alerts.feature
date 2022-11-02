@api
@non_fcra
@lsrm
@html
@fraud
@alerts
Feature: LSRM HTML FRAUD ALERTS section

  @MADLRVP-9284
  Scenario: [MADLRVP-9284] Verify LSRM HTML - FRAUD ALERTS section
    Given the request XML filepath is /ript/non_fcra/lsrm/html/MADLRVP-9284.xml
    When the LSRM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with IMAGE content
      | XPath                                                       | expected                                               |
      | //div[@id='FM_fraudAlert']/img[@alt='Fraud Alerts Section'] | /PCFRSWebElements/images/ui/lsrm/fraud_alert_white.gif |
      | //div[@id='FM_fraudAlert']//div[@class='FM_Score_Bar']/img  | /PCFRSWebElements/images/ui/lsrm/fraud_scale_9.gif     |
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

  @appraisal_review_alerts
  @MADLRVP-9973
  Scenario: [MADLRVP-9973] Verify LSRM HTML - FRAUD ALERTS - Appraisal Review Alerts
    Given the request XML filepath is /ript/non_fcra/lsrm/html/MADLRVP-9973.xml
    When the LSRM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with IMAGE content
      | XPath                                  | expected                                                    |
      | //img[@alt='Appraisal Alerts Section'] | /PCFRSWebElements/images/ui/lsrm/collateral_alert_white.gif |
    And the HTML response has xpath with TEXT content
      | XPath                                             | expected                                       |
      | //td[@class='FM_Number']                          | [MATCH --> Collateral Risk Score:\\s*\\d{1,3}] |
      | (//table[@class='FM_fraudAlert'])[2]//th[2]       | Severity                                       |
      | (//table[@class='FM_fraudAlert'])[2]//th[3]       | Message                                        |
      | (//table[@class='FM_fraudAlert'])[2]//th[4]       | Recommendation                                 |
      | (//table[@class='FM_fraudAlert'])[2]//tr[2]//div  | PROPERTY                                       |
      | (//table[@class='FM_fraudAlert'])[2]//tr[2]/td[2] | [NOT EMPTY]                                    |
      | (//table[@class='FM_fraudAlert'])[2]//tr[2]/td[3] | [NOT EMPTY]                                    |
      | (//table[@class='FM_fraudAlert'])[2]//tr[2]/td[4] | [NOT EMPTY]                                    |
