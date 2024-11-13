import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.nio.charset.StandardCharsets;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

public class pretty_print_html {
    public static void main(String[] args) {
        File inputFile = new File("output.html");
        File outputFile = new File("output_pretty.html");

        try {
            // Read and parse the input file
            Document doc = Jsoup.parse(inputFile, "UTF-8");
            Element bodyContent = doc.body();

            // Generate pretty-printed output
            String prettyPrintedHtml = bodyContent.html();

            // Write the pretty-printed output to the output file using UTF-8 charset
            try (BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outputFile),
                    StandardCharsets.UTF_8))) {
                writer.write(prettyPrintedHtml);
            }

            System.out.println("Pretty printed output.html without html, head, and body tags has been successfully generated");

        } catch (IOException e) {
            System.err.println("Error: " + e);
        }
    }
}