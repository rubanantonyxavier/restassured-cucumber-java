package com.automation.services.utils;

import io.qameta.allure.Allure;
import lombok.experimental.UtilityClass;
import org.apache.commons.lang3.StringUtils;
import org.assertj.core.api.Assertions;
import org.assertj.core.api.Condition;
import org.assertj.core.api.SoftAssertions;

@UtilityClass
public class AssertionUtil {
    public void compareWithMultilineString(String xpath, String extractedByXPath, String expectation) {
        Allure.addAttachment("Expected: ", expectation);
        expectation = CustomStringUtil.removeNewLines(expectation);
        expectation = StringUtils.normalizeSpace(expectation);

        String explanation = """
                the same as expected:
                  "%s"
                """.formatted(expectation);

        final String finalExpectation = expectation;
        Condition<String> effectivelySameAsExpected = new Condition<>(str -> {
            str = CustomStringUtil.removeNewLines(str);
            str = StringUtils.normalizeSpace(str);
            return str.equalsIgnoreCase(finalExpectation);
        }, explanation);

        Assertions.assertThat(extractedByXPath)
                .as("Value extracted by XPath query: \"%s\"".formatted(xpath))
                .isNotNull()
                .overridingErrorMessage("\n  expected: \"%s\"\n    actual: \"%s\"",
                        finalExpectation, extractedByXPath)
                .is(effectivelySameAsExpected);
    }

    public void assertHiddenTagContainsExpectedPattern(SoftAssertions softly, String extractedText, String expectedPattern, String key, String value) {
        softly.assertThat(extractedText)
                .as("Expected Pattern in the Response:\n" + expectedPattern)
                .overridingErrorMessage(String.format("\nThe Expected pattern is not displayed in the XML Response for the \n  Key: %s\nValue: %s", key, value))
                .containsPattern(expectedPattern);
    }
}