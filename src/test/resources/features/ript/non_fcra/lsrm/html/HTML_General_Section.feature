@api
@non_fcra
@lsrm
@html
@general
@section
Feature: LSRM HTML General Section

  @MADLRVP-9318
  Scenario: [MADLRVP-9318] Verify LSRM HTML - Disclaimer at the bottom
    Given the request XML filepath is /ript/non_fcra/lsrm/html/MADLRVP-9318.xml
    When the LSRM request is sent
    Then response content type is HTML
    And HTML response doesn't contain any ERROR message
    And the HTML response has xpath //div[@id='disclaimer'] with value (ignoring newline and spaces)
    """
    NOTICES: This report has been produced solely for the benefit and use of CoreLogic's customer
    subject to the terms of the contract between the parties. This report is not an appraisal of the
    subject property and contains no independent valuation or value estimate. This report may also
    include the optional WatchList Screening feature; in addition to the input borrower name(s), AKA
    (also-known-as) names found, or when available, for the input borrower(s) will be screened
    against the various watch lists available and turned on for the end-user party. The use of AKA
    names for WatchList Screening is only applicable to the input borrower name(s). With the
    exception of the party that ordered this report, no party receiving a copy of this report may
    rely on any of the information contained in it. CoreLogic shall have no liability to any third
    party receiving a copy of this report for any claims related to any information included in the
    report. If you are not a customer of CoreLogic and have any questions about this report or the
    information contained in it, please contact the party that ordered this report.
    This product uses FHFA data but is neither endorsed nor certified by FHFA.
    """




