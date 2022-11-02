package com.automation.services.utils;

import lombok.experimental.UtilityClass;

@UtilityClass
public class CustomStringUtil {
    /**
     * Removes newline characters from the provided {@link String}.
     *
     * @param str Original string.
     * @return Same string without any newline characters.
     */
    public String removeNewLines(String str) {
        return str
                .replace("\n", " ")
                .replace("\n\r", " ");
    }

    /**
     * Extracts field pattern from expressions e.g.: "[DATE --> MMM dd, yyyy]"
     *
     * @param originalExpectation Bare pattern expression e.g.: [DATE --> MMM dd, yyyy]
     * @return Striped pattern e.g.: "MMM dd, yyyy".
     */
    public String getFieldPattern(String originalExpectation) {
        String indicatorRemovedSubstring = originalExpectation.split(" --> ")[1];
        int i = indicatorRemovedSubstring.lastIndexOf("]");
        return indicatorRemovedSubstring.substring(0, i).strip();
    }
}