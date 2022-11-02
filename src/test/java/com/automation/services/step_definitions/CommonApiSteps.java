package com.automation.services.step_definitions;

import com.automation.services.api.C2DServiceHelper;
import com.automation.services.api.LSCMServiceHelper;
import com.automation.services.api.LSFMServiceHelper;
import com.automation.services.api.LSRMServiceHelper;
import com.automation.services.configuration.Config;
import com.automation.services.pojo.datatable.XPathTable;
import com.automation.services.utils.*;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.DataTableType;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.http.ContentType;
import io.restassured.path.xml.XmlPath;
import io.restassured.response.ValidatableResponse;
import org.apache.commons.lang3.StringUtils;
import org.assertj.core.api.Assertions;
import org.assertj.core.api.SoftAssertions;
import org.jsoup.nodes.Document;

import javax.swing.text.html.HTML;
import java.io.File;
import java.util.List;
import java.util.Map;

public class CommonApiSteps {
    String responseBodyString;
    String xmlRequestBody;
    ValidatableResponse validatableResponse;
    XmlPath responseXml;
    String initialResponseBodyString;
    Document htmlDoc;

    @DataTableType(replaceWithEmptyString = "[empty]")
    public XPathTable xPathTableConvert(Map<String, String> entry) {
        return new XPathTable(
                entry.get("XPath"),
                entry.get("expected")
        );
    }

    @Given("the request XML file is {word}")
    public void getXMLFile(String xmlFilePath) {
        File xmlFile = new File(xmlFilePath);
        xmlRequestBody = FilesUtil.readFile(xmlFile);
    }

    @Given("the request XML filepath is {word}")
    public void loadXMLFileByName(String xmlFilePath) {
        xmlRequestBody = FilesUtil.readXmlSourceFile(xmlFilePath);
        Assertions.assertThat(xmlRequestBody)
                .as("The Content extracted from the \"%s\" path file", xmlFilePath)
                .overridingErrorMessage("\n  expected: Content is Available\n    actual: Content is Empty")
                .isNotEmpty();
    }

    @When("^the (|LSFM|LSRM|LSFM FCRA|LSRM FCRA|LSCM|LSCM FCRA)\\s?request is sent$")
    public void sendRequest(String serviceName) {
        this.validatableResponse = switch (serviceName) {
            case "LSFM", "" -> LSFMServiceHelper.sendValidLSFMRequest(Config.REPORT_PATH, xmlRequestBody);
            case "LSRM" -> LSRMServiceHelper.sendValidLSRMRequest(Config.REPORT_PATH, xmlRequestBody);
            case "LSFM FCRA" -> LSFMServiceHelper.sendValidLsfmFcraRequest(Config.REPORT_PATH, xmlRequestBody);
            case "LSRM FCRA" -> LSRMServiceHelper.sendValidLsrmFcraRequest(Config.REPORT_PATH, xmlRequestBody);
            case "LSCM" -> LSCMServiceHelper.sendValidLscmRequest(Config.REPORT_PATH, xmlRequestBody);
            case "LSCM FCRA" -> LSCMServiceHelper.sendValidLscmFcraRequest(Config.REPORT_PATH, xmlRequestBody);
            default -> throw new IllegalArgumentException("Unable to find service by name %s".formatted(serviceName));
        };

        this.responseBodyString = this.validatableResponse.extract().body().asString();
    }

    @Then("the response has {word} alert {word}")
    public void responseHasAlerts(String categoryName, String alertId) {
        responseXml = XmlPath.from(validatableResponse.extract().body().asString());
        String path = String.format("ReportResults.LSFM.Alerts.Category.findAll{it.@Name=='%s'}.Flagged.Alert.@Id", categoryName);
        List<String> alertIds = responseXml.getList(path);

        Assertions.assertThat(alertIds)
                .as("List of Alerts Ids")
                .contains(alertId);
    }

    @SuppressWarnings("CodeBlock2Expr")
    @And("the response contains xpath")
    public void theResponseContainsXpath(DataTable table) {
        List<String> xpathList = table.asList(String.class);
        SoftAssertions.assertSoftly(softly -> {
            xpathList.forEach(xpath -> {
                boolean wasNodeFound = XPathUtil.isAnyNodeFoundBy(xpath, this.responseBodyString);
                softly.assertThat(wasNodeFound)
                        .as("The response contains node by XPath: \"%s\"", xpath)
                        .overridingErrorMessage("\n  expected: found\n    actual: not found")
                        .isTrue();
            });
        });
    }

    @And("the response has xpath")
    public void theResponseHasXpath(List<XPathTable> xPathTable) {
        SoftAssertions.assertSoftly(softly -> {
            xPathTable.forEach(it -> {
                String extractedByXPath = XPathUtil.getByXpath(this.responseBodyString, it.getXpath());
                if (it.getExpectation().startsWith("[MATCH -->")) {
                    String expectedFormat = CustomStringUtil.getFieldPattern(it.getExpectation());
                    softly.assertThat(extractedByXPath)
                            .as(createXPathAssertionMessage(it.getXpath()))
                            .isNotNull()
                            .overridingErrorMessage("\n  expected Format: \"%s\"\n           actual: \"%s\"",
                                    expectedFormat, extractedByXPath)
                            .matches(expectedFormat);
                } else if (it.getExpectation().equals("[NOT EMPTY]")) {
                    softly.assertThat(extractedByXPath)
                            .as(createXPathAssertionMessage(it.getXpath()))
                            .overridingErrorMessage("\n  expected: Text Content is Available\n    actual: Text Content is Not Available")
                            .isNotEmpty();
                } else {
                    softly.assertThat(extractedByXPath)
                            .as(createXPathAssertionMessage(it.getXpath()))
                            .isNotNull()
                            .overridingErrorMessage("\n  expected: \"%s\"\n    actual: \"%s\"",
                                    it.getExpectation(), extractedByXPath)
                            .isEqualTo(it.getExpectation());
                }
            });
        });
    }

    @And("^the response has xpath (.*) with value \\(ignoring newline and spaces\\)$")
    public void theResponseHasXpathWithValue(String xpath, String expectation) {
        String extractedByXPath = XPathUtil.getByXpath(this.responseBodyString, xpath);
        AssertionUtil.compareWithMultilineString(xpath, extractedByXPath, expectation);
    }

    @And("^the response has xpath (.*) with value '(.*)'$")
    public void theResponseHasXpathWithValueUnitedString(String xpath, String expectation) {
        String extractedByXPath = XPathUtil.getByXpath(this.responseBodyString, xpath);

        Assertions.assertThat(extractedByXPath)
                .as(createXPathAssertionMessage(xpath))
                .isNotNull()
                .isEqualTo(expectation);
    }

    @Then("^response content type is (XML|PDF|HTML)$")
    public void responseContentTypeIs(String contentType) {
        switch (contentType) {
            case "PDF" -> {
                validatableResponse.assertThat().contentType("application/pdf");
                ScreenshotUtil.saveAsPdf(validatableResponse.extract().body().asInputStream());
            }
            case "HTML" -> {
                validatableResponse.assertThat().contentType(ContentType.HTML);
                ScreenshotUtil.saveHtmlAsPdf(this.responseBodyString);
                ScreenshotUtil.saveAsHtml(this.responseBodyString);
                this.htmlDoc = HtmlUtil.parseHtml(this.responseBodyString);
            }
            case "XML" -> validatableResponse.assertThat().contentType(ContentType.XML);
        }
    }

    @And("^successful (?:LSFM|LSRM|LSCM) report is received$")
    public void lsfmReportIsSuccessful() {
        String expectation = "true";
        String successAttributeXPath = "//ReportDetails/@success";
        String extractedByXPath = XPathUtil.getByXpath(this.responseBodyString, successAttributeXPath);
        Assertions.assertThat(extractedByXPath)
                .as(createXPathAssertionMessage(successAttributeXPath))
                .isNotNull()
                .overridingErrorMessage(
                        "\n  expected: \"%s\"\n    actual: \"%s\"",
                        expectation,
                        extractedByXPath)
                .isEqualTo(expectation);
    }

    @And("^XML response contains hidden tags under the (.+) section$")
    public void xmlResponseContainsHiddenTagsUnderSection(String sectionName, DataTable dataTable) {
        Map<String, String> map = dataTable.asMap();
        SoftAssertions.assertSoftly(softly -> map.forEach((k, v) -> {
            String expectedPattern = getExpectedPatternInHiddenFields(sectionName, k, v);
            AssertionUtil.assertHiddenTagContainsExpectedPattern(softly, this.responseBodyString, expectedPattern, k, v);
        }));
    }

    @And("^XML response has the (.*) hidden tag under the (.+) section with value \\(ignoring newline and spaces\\)$")
    public void theResponseHasXpathWithValue(String hiddenTag, String sectionName, String expectedValue) {
        String finalExpectedValue = StringUtils.normalizeSpace(CustomStringUtil.removeNewLines(expectedValue));
        String expectedPattern = getExpectedPatternInHiddenFields(sectionName, hiddenTag, finalExpectedValue);
        SoftAssertions.assertSoftly(softly ->
                AssertionUtil.assertHiddenTagContainsExpectedPattern(softly, this.responseBodyString, expectedPattern, hiddenTag, finalExpectedValue));
    }

    @Then("^the HTML response has xpath with TEXT content$")
    public void validateHtmlResponseText(List<XPathTable> xPathTable) {
        SoftAssertions.assertSoftly(softly -> {
            xPathTable.forEach(it -> {
                String extractedText;
                if (it.getXpath().contains("text()"))
                    extractedText = HtmlUtil.getTextByXpathWithTextAttribute(this.htmlDoc, it.getXpath()).trim();
                else
                    extractedText = HtmlUtil.getTextByXpath(this.htmlDoc, it.getXpath()).trim();
                if (it.getExpectation().equals("[NOT EMPTY]")) {
                    softly.assertThat(extractedText)
                            .as(createXPathAssertionMessage(it.getXpath()))
                            .overridingErrorMessage("\n  expected: Text Content is Available\n    actual: Text Content is Not Available")
                            .isNotEmpty();
                } else if (it.getExpectation().startsWith("[DATETIME -->")) {
                    String expectedFormat = CustomStringUtil.getFieldPattern(it.getExpectation());
                    softly.assertThat(DateUtil.isValidDateTimeFormat(expectedFormat, extractedText))
                            .as(createXPathAssertionMessage(it.getXpath()))
                            .overridingErrorMessage("\n  expected format: \"%s\" \n           actual: \"%s\"", expectedFormat, extractedText)
                            .isTrue();
                } else if (it.getExpectation().startsWith("[DATE -->")) {
                    String expectedFormat = CustomStringUtil.getFieldPattern(it.getExpectation());
                    softly.assertThat(DateUtil.isValidDateFormat(expectedFormat, extractedText))
                            .as(createXPathAssertionMessage(it.getXpath()))
                            .overridingErrorMessage("\n  expected format: \"%s\" \n           actual: \"%s\"", expectedFormat, extractedText)
                            .isTrue();
                } else if (it.getExpectation().startsWith("[MATCH -->")) {
                    String expectedFormat = CustomStringUtil.getFieldPattern(it.getExpectation());
                    softly.assertThat(extractedText)
                            .as(createXPathAssertionMessage(it.getXpath()))
                            .overridingErrorMessage("\n  expected to match regex: \"%s\"\n                   actual: \"%s\"", expectedFormat, extractedText)
                            .matches(expectedFormat);
                } else {
                    softly.assertThat(extractedText)
                            .as(createXPathAssertionMessage(it.getXpath()))
                            .overridingErrorMessage("\n  expected: \"%s\"\n    actual: \"%s\"", it.getExpectation(), extractedText)
                            .isEqualTo(it.getExpectation());
                }
            });
        });
    }

    @Then("^the HTML response has xpath with IMAGE content$")
    public void validateHtmlResponseImage(List<XPathTable> xPathTable) {
        SoftAssertions.assertSoftly(softly -> {
            xPathTable.forEach(it -> {
                String extractedImage = HtmlUtil.getImageSourceByXpath(this.htmlDoc, it.getXpath());
                softly.assertThat(extractedImage)
                        .as("Image Source Value extracted by \"%s\" XPath query", it.getXpath())
                        .overridingErrorMessage("\n       expected to end-with: \"%s\"\n    actual value ended-with: \"%s\"", it.getExpectation(), extractedImage)
                        .endsWith(it.getExpectation());
            });
        });
    }

    @Then("^the HTML response has ON-CLICK elements in each XPath that end with the expected content$")
    public void validateHtmlResponseOnClick(List<XPathTable> xPathTable) {
        SoftAssertions.assertSoftly(softly -> {
            xPathTable.forEach(it -> {
                List<String> extractedValues = HtmlUtil.getElementsByXpath(this.htmlDoc, it.getXpath()).eachAttr(HTML.Attribute.HREF.toString());
                extractedValues.forEach(extractedValue -> {
                    softly.assertThat(extractedValue)
                            .as("On-Click URL Value extracted by '%s' XPath query", it.getXpath())
                            .overridingErrorMessage("\n       expected to end-with: '%s'\n    actual value ended-with: '%s'", it.getExpectation(), extractedValue)
                            .endsWith(it.getExpectation());
                });
            });
        });
    }

    @Then("^the HTML response has xpath with (?:MAP|GRAPH) content$")
    public void validateHtmlResponseGraph(List<XPathTable> xPathTable) {
        SoftAssertions.assertSoftly(softly -> {
            xPathTable.forEach(it -> {
                String extractedMapId = HtmlUtil.getIdByXpath(htmlDoc, it.getXpath());
                softly.assertThat(extractedMapId)
                        .as("Map Value extracted by \"%s\" XPath query", it.getXpath())
                        .overridingErrorMessage("\n       expected to start-with: \"%s\"\n    actual value started-with: \"%s\"", it.getExpectation(), extractedMapId)
                        .startsWith(it.getExpectation());
            });
        });
    }

    @And("multiple HTML elements by xpath match regex")
    public void multipleHTMLElementsByXpathMatchRegex(List<XPathTable> xPathTable) {
        SoftAssertions.assertSoftly(softly -> {
            xPathTable.forEach(dataTableItem -> {
                List<String> extractedValues = HtmlUtil.getElementsByXpath(this.htmlDoc, dataTableItem.getXpath()).eachText();
                assertSoftlyMultipleValuesByXPathMatchRegex(
                        softly,
                        dataTableItem.getXpath(),
                        dataTableItem.getExpectation(),
                        extractedValues);
            });
        });
    }

    @And("^the HTML response has xpath (.*) with value \\(ignoring newline and spaces\\)$")
    public void theHTMLResponseHasXpathWithValueIgnoringNewlineAndSpaces(String xpath, String expectation) {
        String extractedByXPath = HtmlUtil.getTextByXpath(this.htmlDoc, xpath);
        AssertionUtil.compareWithMultilineString(xpath, extractedByXPath, expectation);
    }

    @And("the HTML response contains xpath")
    public void theHtmlResponseContainsXpath(DataTable table) {
        List<String> xpathList = table.asList(String.class);
        SoftAssertions.assertSoftly(softly -> {
            xpathList.forEach(xpath -> {
                int elementSize = HtmlUtil.getElementsByXpath(this.htmlDoc, xpath).size();
                softly.assertThat(elementSize)
                        .as("The response contains node by XPath: \"%s\"", xpath)
                        .overridingErrorMessage("\n  expected: found\n    actual: not found")
                        .isGreaterThan(0);
            });
        });
    }

    @And("^multiple HTML elements by xpath (.*) match regex '(.*)'$")
    public void multipleHTMLElementsByXpathMatchRegex(String xpath, String regex) {
        List<String> extractedValues = HtmlUtil.getElementsByXpath(this.htmlDoc, xpath).eachText();

        SoftAssertions.assertSoftly(softly -> {
            assertSoftlyMultipleValuesByXPathMatchRegex(softly, xpath, regex, extractedValues);
        });
    }

    @And("^multiple HTML elements by xpath (.*) has attribute '(\\w+)' with value match '(.+)'$")
    public void multipleHTMLElementsByXpathHasAttributeWithValueMatch(String xpath, String attribute, String expectedPattern) {
        List<String> extractedValues = HtmlUtil.getElementsByXpath(this.htmlDoc, xpath).eachAttr(attribute);

        SoftAssertions.assertSoftly(softly -> {
            assertSoftlyMultipleValuesByXPathMatchRegex(softly, xpath, expectedPattern, extractedValues);
        });
    }

    @And("^multiple HTML elements by xpath (.*) has attribute '(\\w+)' with value '(\\w+)'$")
    public void multipleHTMLElementsByXpathHasAttributeWithValue(String xpath, String attribute, String expectedValue) {
        List<String> extractedValues = HtmlUtil.getElementsByXpath(this.htmlDoc, xpath).eachAttr(attribute);

        Assertions.assertThat(extractedValues)
                .as("'%s' attribute of elements extracted with %s XPath expression", attribute, xpath)
                .containsOnly(expectedValue);
    }

    @And("HTML response doesn't contain any ERROR message")
    public void htmlResponseDoesntContainAnyERRORMessage() {
        String xpathExpr = "/html/body";
        String documentText = HtmlUtil.getTextByXpath(this.htmlDoc, xpathExpr);
        String requestErrorText = "Your data request was unsuccessful";
        Assertions.assertThat(documentText)
                .as("HTML document text")
                .overridingErrorMessage("""
                                        
                         expected: Document to not contain "%s"
                           actual: Document contains "%s"
                        """, requestErrorText, documentText)
                .doesNotContain(requestErrorText);
    }

    @When("^the C2D request is sent with (ORDER|CONTRACT|CONTRACT2) User$")
    public void sendC2dRequest(String user) {
        validatableResponse = C2DServiceHelper.sendValidC2DRequest(xmlRequestBody, user);
        responseBodyString = validatableResponse.extract().body().asString();
        initialResponseBodyString = this.responseBodyString;
    }

    @Then("^extract the content of xpath (.*) from XML response$")
    public void extractContentFromXML(String xpath) {
        String extractedByXPath = XPathUtil.getByXpath(this.initialResponseBodyString, xpath);
        if (extractedByXPath != null) {
            responseBodyString = extractedByXPath.replace("<![CDATA[", "").replace("]]>", "");
            this.htmlDoc = HtmlUtil.parseHtml(this.responseBodyString);
        } else {
            Assertions.fail("No content available in Xpath - " + xpath);
        }
    }

    @And("the PDF response has value")
    public void validatePdfResponse(List<String> expectedValue) {
        String pdfContent = PdfUtil.getPdfTextContent(validatableResponse);
        ScreenshotUtil.saveAsText(pdfContent);
        SoftAssertions.assertSoftly(softly -> {
            expectedValue.forEach(it -> {
                softly.assertThat(pdfContent)
                        .overridingErrorMessage("The Expected Text - \"%s\" is not displayed in PDF content", it)
                        .contains(it);
            });
        });
    }

    /**
     * Assembles consistent XPath assertion message.
     *
     * @param xpath XPath query.
     * @return assertion message to put into AssertJ expression.
     */
    private String createXPathAssertionMessage(String xpath) {
        return "Value extracted by XPath query: \"%s\"".formatted(xpath);
    }

    /**
     * Softly asserts that all the values extracted by an XPath query match given Regex expression.
     *
     * @param softly          Soft assertion accumulator.
     * @param xpath           XPath query. It is used for assertion messages.
     * @param expectedPattern Regex expression.
     * @param extractedValues A list of string values extracted using the XPath query.
     */
    private void assertSoftlyMultipleValuesByXPathMatchRegex(
            SoftAssertions softly,
            String xpath,
            String expectedPattern,
            List<String> extractedValues) {
        extractedValues.forEach(it -> {

            String assertionMessage = """
                                    
                    expected to match regex: "%s"
                                     actual: "%s"
                    """.formatted(expectedPattern, it);

            softly.assertThat(it)
                    .as(createXPathAssertionMessage(xpath))
                    .overridingErrorMessage(assertionMessage)
                    .matches(expectedPattern);
        });
    }

    /**
     * To get the Expected Pattern in Hidden Fields for provided Section
     *
     * @param sectionName name of Section
     * @param key         Attribute Key
     * @param value       Attribute value
     * @return String of Expected Pattern
     */
    private String getExpectedPatternInHiddenFields(String sectionName, String key, String value) {
        String startSectionName, pattern;
        if (sectionName.equals("ALERT TRIGGERS"))
            startSectionName = "ALERT_TRIGGERS";
        else
            startSectionName = sectionName;

        if (value.contains("(") || value.contains(")"))
            value = value.replaceAll("\\(", "\\\\(").replaceAll("\\)", "\\\\)");

        if (sectionName.equals("IDENTITYPRO")) {
            pattern = "<!-- START: %s -->[\\w\\W\\s\\S]*<==\\d{2,4}>%s</==\\d{2,4}><##\\d{2,4}>%s</##\\d{2,4}>"
                    .formatted(startSectionName, key, value);
        } else if (sectionName.equals("REPORTDELIM")) {
            pattern = "<!--<\\$\\$%s>[\\w\\W\\s\\S]*<==\\d{1,2}>%s</==\\d{1,2}><##\\d{1,2}>%s</##\\d{1,2}>[\\w\\W\\s\\S]*</\\$\\$%s>-->"
                    .formatted(startSectionName, key, value, sectionName);
        } else {
            pattern = "<!-- START: %s -->[\\w\\W\\s\\S]*<==\\d{2,4}>%s</==\\d{2,4}><##\\d{2,4}>%s</##\\d{2,4}>[\\w\\W\\s\\S]*<!-- END: %s -->"
                    .formatted(startSectionName, key, value, sectionName);
        }

        return pattern;
    }
}
