package com.automation.services.utils;

import lombok.SneakyThrows;
import lombok.experimental.UtilityClass;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;

@UtilityClass
public class FilesUtil {
    /**
     * Get the String content from the provided File
     *
     * @param file file to get the String
     * @return String body
     */
    @SneakyThrows(IOException.class)
    public String readFile(File file) {
        return Files.readString(file.toPath(), StandardCharsets.UTF_8);
    }

    /**
     * Read a file from {@code test/resources/xmls}
     *
     * @param xmlFilePath file path relatively to {@code test/resources/xmls}
     * @return File text
     */
    @SneakyThrows(IOException.class)
    public static String readXmlSourceFile(String xmlFilePath) {
        return Files.readString(Paths.get("src/test/resources/xmls/", xmlFilePath));
    }
}
