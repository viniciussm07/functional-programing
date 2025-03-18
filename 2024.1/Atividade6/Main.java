import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Scanner;
import java.util.stream.Collectors;

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

    @Override
    public String toString() {
        return "CountryData{" +
                "country='" + country + '\'' +
                ", confirmed=" + confirmed +
                ", deaths=" + deaths +
                ", recovery=" + recovery +
                ", active=" + active +
                '}';
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
            int sumActive = countryData.stream()
                    .filter(cd -> cd.confirmed >= n1)
                    .mapToInt(cd -> cd.active)
                    .sum();
            System.out.println(sumActive);

            // Soma de 'Deaths' nos n3 países com menores 'Confirmed' dos n2 países com maiores 'Active'
            int sumDeaths = countryData.stream()
                    .sorted(Comparator.comparingInt(cd -> -cd.active))
                    .limit(n2)
                    .sorted(Comparator.comparingInt(cd -> cd.confirmed))
                    .limit(n3)
                    .mapToInt(cd -> cd.deaths)
                    .sum();
            System.out.println(sumDeaths);

            // Os n4 países com maiores 'Confirmed' em ordem alfabética
            List<String> topConfirmedCountries = countryData.stream()
                    .sorted(Comparator.comparingInt(cd -> -cd.confirmed))
                    .limit(n4)
                    .map(cd -> cd.country)
                    .sorted()
                    .collect(Collectors.toList());
            topConfirmedCountries.forEach(System.out::println);
        }
    }

    private static List<CountryData> readCSV(String filePath) {
        List<CountryData> countryDataList = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
            countryDataList = br.lines()
                    .map(line -> line.split(","))
                    .map(values -> new CountryData(
                            values[0],
                            Integer.parseInt(values[1]),
                            Integer.parseInt(values[2]),
                            Integer.parseInt(values[3]),
                            Integer.parseInt(values[4])
                    ))
                    .collect(Collectors.toList());
        } catch (IOException e) {
            System.err.println("Erro ao ler o arquivo: " + e.getMessage());
        }
        return countryDataList;
    }
}
