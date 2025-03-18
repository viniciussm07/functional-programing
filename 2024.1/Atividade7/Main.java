import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Scanner;

class CountryData {
    String country;
    int confirmed;
    int deaths;
    int recovery;
    int active;

    public CountryData(String country, int confirmed, int deaths, int recovery, int active) {
        this.country = country;
        this.confirmed = confirmed;
        this.deaths = deaths;
        this.recovery = recovery;
        this.active = active;
    }
}

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int n1 = scanner.nextInt();
        int n2 = scanner.nextInt();
        int n3 = scanner.nextInt();
        int n4 = scanner.nextInt();

        List<CountryData> countryData = readCSV("dados.csv");  // Substitua pelo caminho do seu arquivo CSV

        if (countryData != null) {
            // Soma de 'Active' onde 'Confirmed' >= n1
            int sumActive = 0;
            for (CountryData cd : countryData) {
                if (cd.confirmed >= n1) {
                    sumActive += cd.active;
                }
            }
            System.out.println(sumActive);

            // Soma de 'Deaths' nos n3 países com menores 'Confirmed' dos n2 países com maiores 'Active'
            List<CountryData> topActiveCountries = new ArrayList<>(countryData);
            topActiveCountries.sort((cd1, cd2) -> Integer.compare(cd2.active, cd1.active));
            if (topActiveCountries.size() > n2) {
                topActiveCountries = topActiveCountries.subList(0, n2);
            }
            topActiveCountries.sort(Comparator.comparingInt(cd -> cd.confirmed));
            int sumDeaths = 0;
            for (int i = 0; i < Math.min(n3, topActiveCountries.size()); i++) {
                sumDeaths += topActiveCountries.get(i).deaths;
            }
            System.out.println(sumDeaths);

            // Os n4 países com maiores 'Confirmed' em ordem alfabética
            List<CountryData> topConfirmedCountries = new ArrayList<>(countryData);
            topConfirmedCountries.sort((cd1, cd2) -> Integer.compare(cd2.confirmed, cd1.confirmed));
            if (topConfirmedCountries.size() > n4) {
                topConfirmedCountries = topConfirmedCountries.subList(0, n4);
            }
            topConfirmedCountries.sort(Comparator.comparing(cd -> cd.country));
            for (CountryData cd : topConfirmedCountries) {
                System.out.println(cd.country);
            }
        }
    }

    private static List<CountryData> readCSV(String filePath) {
        List<CountryData> countryDataList = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] values = line.split(",");
                if (values.length == 5) {
                    CountryData countryData = new CountryData(
                            values[0],
                            Integer.parseInt(values[1]),
                            Integer.parseInt(values[2]),
                            Integer.parseInt(values[3]),
                            Integer.parseInt(values[4])
                    );
                    countryDataList.add(countryData);
                }
            }
        } catch (IOException e) {
            System.err.println("Erro ao ler o arquivo: " + e.getMessage());
        }
        return countryDataList;
    }
}