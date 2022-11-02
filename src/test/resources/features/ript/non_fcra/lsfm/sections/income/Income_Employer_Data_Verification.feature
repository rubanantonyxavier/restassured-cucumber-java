@api
@non_fcra
@lsfm
@section
@income
@employer_data_verification
Feature: LSFM - Income Detail Section - Employer Data Verification

  @MADLRVP-10435
  Scenario: [MADLRVP-10435] Verify LSFM - New combo alert INC_010 fires when INC_003, IDP_008, IDP_021 alerts fire
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/income/MADLRVP-10435.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='IDP_008']   |
      | //Category[@Name='IDENTITY']/Flagged/Alert[@Id='IDP_021'] |
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='INC_003']   |
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='INC_010']   |
    And the response has xpath
      | XPath                                                             | expected |
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='IDP_008']/@Status   | Y        |
      | //Category[@Name='IDENTITY']/Flagged/Alert[@Id='IDP_021']/@Status | Y        |
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='INC_003']/@Status   | Y        |
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='INC_010']/@Status   | Y        |

  @MADLRVP-10448 @hidden_tags
  Scenario: [MADLRVP-10448] Verify LSFM - hidden fields for INC_010 alert
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/income/MADLRVP-10448.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //XMLHiddenTags/NameValueData |
    And the response has xpath
      | XPath                                                                         | expected   |
      | //NameValueData[@name='LSF_COMBO_INCOME_MISREP0']/@value                      | Y          |
      | //NameValueData[@name='LSF_COMBO_INCOME_MISREP_BRWR0']/@value                 | 0          |
      | //NameValueData[@name='LSF_COMBO_INCOME_MISREP_SEV0']/@value                  | High       |
      | //NameValueData[@name='LSF_COMBO_INCOME_MISREP_ID0']/@value                   | INC_010    |
      | //NameValueData[@name='LSF_COMBO_INCOME_MISREP_ALERT_CLASSIFICATION0']/@value | Fraud      |
      | //NameValueData[@name='LSF_COMBO_INCOME_MISREP_ALERT_TYPE0']/@value           | Actionable |
      | //NameValueData[@name='LSFM_ALERT_RESCORABLE']/@value                         | N          |
      | //NameValueData[@name='LSF_COMBO_INCOME_MISREP1']/@value                      | N          |
      | //NameValueData[@name='LSF_COMBO_INCOME_MISREP_BRWR1']/@value                 | 1          |
      | //NameValueData[@name='LSF_COMBO_INCOME_MISREP_ID1']/@value                   | INC_010    |
    And the response has xpath //NameValueData[@name='LSF_COMBO_INCOME_MISREP_MSG0']/@value with value (ignoring newline and spaces)
    """
    ARDMILLE, KELLY - Phone and employer information is unable to be verified or has multiple inconsistencies.
    """
    And the response has xpath //NameValueData[@name='LSF_COMBO_INCOME_MISREP_REC0']/@value with value (ignoring newline and spaces)
    """
    Review all income and identity alerts and confirm income and employment information.
    """