@api
@fcra
@lsfm
@section
@income
@employer_data_verification
Feature: LSFM FCRA - Income Detail Section - Employer Data Verification

  @MADLRVP-10436
  Scenario: [MADLRVP-10436] Verify LSFM FCRA - New combo alert INC_010 fires when INC_003, IDP_008, IDP_021 alerts fire
    Given the request XML filepath is /ript/fcra/lsfm/sections/income/MADLRVP-10436.xml
    When the LSFM FCRA request is sent
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

  @MADLRVP-10447
  Scenario: [MADLRVP-10447] Verify LSFM FCRA - Trigger tag is LSF_COMBO_INCOME_MISREP_ALERT
    Given the request XML filepath is /ript/fcra/lsfm/sections/income/MADLRVP-10447.xml
    When the LSFM FCRA request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //Category[@Name='INCOME']/Flagged/Alert[@Id='INC_010'] |
    And the response has xpath
      | XPath                                                | expected                |
      | //Category/Flagged/Alert[@Id='INC_010']/@Status      | Y                       |
      | //Category/Flagged/Alert[@Id='INC_010']/@ExternalTag | LSF_COMBO_INCOME_MISREP |
    