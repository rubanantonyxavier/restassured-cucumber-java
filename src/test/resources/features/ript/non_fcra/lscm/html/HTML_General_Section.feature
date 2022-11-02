@api
@non_fcra
@lscm
@html
@general
@section
Feature: LSCM HTML General Section

  @MADLRVP-14166
    @review_comments
  Scenario Outline: [MADLRVP-14166] Verify LSCM HTML - Review Comments section
    Given the request XML filepath is /ript/non_fcra/lscm/html/MADLRVP-14166.xml
    When the LSCM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath with IMAGE content
      | XPath                                              | expected                                                        |
      | <section_xpath>/tr/td[contains(@style,'font')]/img | /PCFRSWebElements/images/ui/collateralManager/comments_icon.gif |
    And the HTML response has xpath with TEXT content
      | XPath                                                    | expected        |
      | <section_xpath>/tr/td[contains(@style,'font')]/text()[2] | Review Comments |
    And the HTML response contains xpath
      | <section_xpath>//textarea |

    Examples:
      | section_xpath                      |
      | //tbody[.//textarea[@id='styled']] |

  @MADLRVP-14184
    @notices
  Scenario: [MADLRVP-14184] Verify LSCM HTML - Notice at the bottom
    Given the request XML filepath is /ript/non_fcra/lscm/html/MADLRVP-14184.xml
    When the LSCM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath //div[@id='disclaimer'] with value (ignoring newline and spaces)
    """
    NOTICES: This report has been produced solely for the benefit and use of CoreLogic's customer subject
    to the terms of the contract between the parties. This report is not an appraisal of the subject property
    and contains no independent valuation or value estimate. With the exception of the party that ordered
    this report, no party receiving a copy of this report may rely on any of the information contained in it.
    CoreLogic shall have no liability to any third party receiving a copy of this report for any claims related
    to any information included in the report. If you are not a customer of CoreLogic and have any questions
    about this report or the information contained in it, please contact the party that ordered this report.
    """
