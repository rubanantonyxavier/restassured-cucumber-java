package com.automation.services.utils;

import com.automation.services.configuration.Config;
import com.itextpdf.html2pdf.HtmlConverter;
import io.qameta.allure.Allure;
import lombok.experimental.UtilityClass;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;

@UtilityClass
public class ScreenshotUtil {

    /**
     * Convert the HTML into PDF & attach in Allure Report
     *
     * @param html HTML as String
     * @author Ruban
     */
    public static void saveHtmlAsPdf(String html) {
        if (!Files.exists(Paths.get(Config.SCREENSHOT_PATH)))
            //noinspection ResultOfMethodCallIgnored
            new File(Config.SCREENSHOT_PATH).mkdir();
        String pdfName = "/HTML_Response_PDF_" + RandomUtil.getRandomNumber(99999) + ".pdf";
        try {
            HtmlConverter.convertToPdf(html, new FileOutputStream(Config.SCREENSHOT_PATH + pdfName));
            Allure.addAttachment("HTML Response View in PDF", new FileInputStream(Config.SCREENSHOT_PATH + pdfName));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * Attach HTML File in Allure Report
     *
     * @param html HTML as String
     * @author Ruban
     */
    public static void saveAsHtml(String html) {
        Allure.addAttachment("HTML Response", "HTML", html, ".html");
    }

    /**
     * Attach PDF File in Allure Report
     *
     * @param inputStream PDF as InputStream
     * @author Ruban
     */
    public static void saveAsPdf(InputStream inputStream) {
        Allure.addAttachment("PDF Response", "PDF", inputStream, ".pdf");
    }

    /**
     * Attach Text Content in Allure Report
     *
     * @param content Text as String
     * @author Ruban
     */
    public static void saveAsText(String content) {
        Allure.addAttachment("PDF Text Content", content);
    }
}