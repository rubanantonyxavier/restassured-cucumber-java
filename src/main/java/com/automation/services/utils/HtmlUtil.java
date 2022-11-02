package com.automation.services.utils;

import lombok.experimental.UtilityClass;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.TextNode;
import org.jsoup.select.Elements;

@UtilityClass
public class HtmlUtil {

    /**
     * To parse the HTML string into Jsoup Document
     *
     * @param html HTML as String
     * @return Jsoup Document of HTML
     * @author Ruban
     */
    public static Document parseHtml(String html) {
        return Jsoup.parse(html);
    }

    /**
     * Get Text value by XPath from HTML document
     *
     * @param htmlDoc   HTML as Document
     * @param xpathExpr XPath expression
     * @return Text Value found by XPath expression
     * @author Ruban
     */
    public static String getTextByXpath(Document htmlDoc, String xpathExpr) {
        return htmlDoc.selectXpath(xpathExpr).text();
    }

    /**
     * Get Text value by XPath with Text attribute from HTML document
     *
     * @param htmlDoc   HTML as Document
     * @param xpathExpr XPath with Text attribute expression
     * @return Text Value found by XPath expression
     * @author Ruban
     */
    public static String getTextByXpathWithTextAttribute(Document htmlDoc, String xpathExpr) {
        return htmlDoc.selectXpath(xpathExpr, TextNode.class).get(0).text();
    }

    /**
     * Get Image Source value by XPath from HTML document
     *
     * @param htmlDoc   HTML as Document
     * @param xpathExpr XPath expression
     * @return Image Source Value found by XPath expression
     * @author Ruban
     */
    public static String getImageSourceByXpath(Document htmlDoc, String xpathExpr) {
        return htmlDoc.selectXpath(xpathExpr).attr("src");
    }

    /**
     * Get On-Click URL value by XPath from HTML document
     *
     * @param htmlDoc   HTML as Document
     * @param xpathExpr XPath expression
     * @return On-Click URL Value found by XPath expression
     * @author Ruban
     */
    public static String getOnClickUrlByXpath(Document htmlDoc, String xpathExpr) {
        return htmlDoc.selectXpath(xpathExpr).attr("href");
    }

    /**
     * Get ID by XPath from HTML document
     *
     * @param htmlDoc   HTML as Document
     * @param xpathExpr XPath expression
     * @return ID Value found by XPath expression
     * @author Ruban
     */
    public static String getIdByXpath(Document htmlDoc, String xpathExpr) {
        return htmlDoc.selectXpath(xpathExpr).attr("id");
    }

    /**
     * Get Elements by XPath from HTML document
     *
     * @param htmlDoc   HTML as Document
     * @param xpathExpr XPath expression
     * @return Elements found by XPath expression
     * @author Ruban
     */
    public static Elements getElementsByXpath(Document htmlDoc, String xpathExpr) {
        return htmlDoc.selectXpath(xpathExpr);
    }
}
