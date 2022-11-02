@api
@non_fcra
@lsfm
@section
@identity
@ssn_related
Feature: LSFM - Identity Section - SSN Related

  @MADLRVP-10472 @hidden_tags
  Scenario: [MADLRVP-10472] LSFM - Check that IDP_INPUT_SSN# is populated with the masked SSN
    Given the request XML filepath is /ript/non_fcra/lsfm/sections/identity/MADLRVP-10472.xml
    When the request is sent
    Then response content type is XML
    And successful LSFM report is received
    And the response contains xpath
      | //XMLHiddenTags/NameValueData |
    And the response has xpath
      | XPath                                          | expected                 |
      | //NameValueData[@name='IDP_INPUT_SSN0']/@value | [MATCH --> XXX-XX-\d{4}] |
