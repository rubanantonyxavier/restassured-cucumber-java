package com.automation.services.utils;

import lombok.SneakyThrows;
import lombok.experimental.UtilityClass;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.*;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

@UtilityClass
public class XPathUtil {

    /**
     * Get a value by XPath from XML document.
     *
     * @param xmlDoc    XML document.
     * @param xpathExpr XPath expression.
     * @return Value found by XPath expression or {@link null} if not any node can be found by the XPath query.
     */
    @SneakyThrows
    public static String getByXpath(String xmlDoc, String xpathExpr) {
        XPath xPath = XPathFactory.newInstance().newXPath();
        Document xmlDocument = parseXml(xmlDoc);

        XPathExpression xPathExpression = xPath.compile(xpathExpr);
        return isAnyNodeFoundBy(xPathExpression, xmlDocument)
                ? xPathExpression.evaluate(xmlDocument).trim()
                : null;
    }

    /**
     * Evaluates if any node can be found in xmlDocument by the xPathExpression.
     *
     * @param xPathExpression Compiled XPath expression.
     * @param xmlDocument     xml document.
     * @return true if any node can be found in xmlDocument by the xPathExpression.
     * @throws XPathExpressionException If the expression cannot be evaluated.
     */
    private static boolean isAnyNodeFoundBy(XPathExpression xPathExpression, Document xmlDocument) throws XPathExpressionException {
        return (boolean) xPathExpression.evaluate(xmlDocument, XPathConstants.BOOLEAN);
    }

    /**
     * Evaluates if any node can be found in xmlDoc by the xpathExpr.
     *
     * @param xpathExpr Compiled XPath expression.
     * @param xmlDoc    xml document.
     * @return true if any node can be found in xmlDoc by the xpathExpr.
     */
    @SneakyThrows
    public static boolean isAnyNodeFoundBy(String xpathExpr, String xmlDoc) {
        XPath xPath = XPathFactory.newInstance().newXPath();
        Document xmlDocument = parseXml(xmlDoc);
        XPathExpression xPathExpression = xPath.compile(xpathExpr);
        return isAnyNodeFoundBy(xPathExpression, xmlDocument);
    }

    /**
     * Parse XML in {@link String} representation into {@link Document} object.
     *
     * @param xmlString XML in {@link String} representation. Usually request or response body.
     * @return {@link Document} representation of input XML.
     * @throws ParserConfigurationException - if a DocumentBuilder cannot be created which satisfies the configuration requested.
     * @throws SAXException                 - when unable to parse XML.
     * @throws IOException                  - when unable to parse XML.
     */
    private static Document parseXml(String xmlString) throws ParserConfigurationException, IOException, SAXException {
        DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
        builderFactory.setExpandEntityReferences(false);
        ByteArrayInputStream is = new ByteArrayInputStream(xmlString.getBytes(StandardCharsets.UTF_8));
        DocumentBuilder documentBuilder = builderFactory.newDocumentBuilder();

        return documentBuilder.parse(is);
    }
}
