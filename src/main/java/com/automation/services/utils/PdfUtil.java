package com.automation.services.utils;

import io.restassured.response.ValidatableResponse;
import lombok.SneakyThrows;
import lombok.experimental.UtilityClass;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;
import org.apache.tika.metadata.Metadata;
import org.apache.tika.parser.ParseContext;
import org.apache.tika.parser.pdf.PDFParser;
import org.apache.tika.sax.BodyContentHandler;

import java.io.InputStream;

@UtilityClass
public class PdfUtil {

    /**
     * Get Text content from PDF using Apache PDF Box
     * @author Ruban
     * @param validatableResponse Validatable PDF Response
     * @return Text Content from PDF
     */
    @SneakyThrows
    public static String getPdfTextContent(ValidatableResponse validatableResponse) {
        String pdfText;
        try (InputStream inputStream = validatableResponse.extract().body().asInputStream();
             PDDocument pdfDoc = PDDocument.load(inputStream)) {
            pdfText = new PDFTextStripper().getText(pdfDoc);
        }
        return pdfText;
    }

    /**
     * Get Text content from PDF using Apache Tika
     * @author Ruban
     * @param validatableResponse Validatable PDF Response
     * @return Text Content from PDF
     */
    @SneakyThrows
    public static String getPdfTextContentTika(ValidatableResponse validatableResponse) {
        String pdfText;
        try (InputStream inputStream = validatableResponse.extract().body().asInputStream()) {
            BodyContentHandler handler = new BodyContentHandler();
            new PDFParser().parse(inputStream, handler, new Metadata(), new ParseContext());
            pdfText = handler.toString();
        }
        return pdfText;
    }

}
