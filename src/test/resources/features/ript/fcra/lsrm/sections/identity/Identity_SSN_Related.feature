@api
@fcra
@lsrm
@section
@identity
@ssn_related
Feature: LSRM FCRA - Identity Section - SSN Related

  @MADLRVP-10473 @hidden_tags
  Scenario: [MADLRVP-10473] LSRM FCRA - Check that IDP_INPUT_SSN# is populated with the masked SSN
    Given the request XML filepath is /ript/fcra/lsrm/sections/identity/MADLRVP-10473.xml
    When the LSRM FCRA request is sent
    Then response content type is XML
    And successful LSRM report is received
    And the response contains xpath
      | //XMLHiddenTags/NameValueData |
    And the response has xpath
      | XPath                                          | expected                 |
      | //NameValueData[@name='IDP_INPUT_SSN0']/@value | [MATCH --> XXX-XX-\d{4}] |
