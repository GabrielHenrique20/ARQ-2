//Arthur Martinho Medeiros Oliveira - 813168
//Caio Gomes Altantara Gloria - 763989
//Daniel Salgado Magalhães - 821429
//Gabriel Henrique Vieira de Oliveira - 775799

import java.io.*;

public class EP4 {
    public static void main(String[] args) throws Exception {
        char X = ' ', Y = ' ';

        //abre o arquivo para leitura
        String arquivo = "arquivo.ula";
        String arquivoSaida = "arquivoHexa.hex";

        try (BufferedReader br = new BufferedReader(new FileReader(arquivo));
        BufferedWriter bw = new BufferedWriter(new FileWriter(arquivoSaida))) {

            String linha;
            while (!((linha = br.readLine()).equals("inicio:"))) {
            }

            // Lê cada linha do arquivo até atingir o final
            while (!((linha = br.readLine()).equals("fim."))) {
                if(linha.charAt(0) == 'X'){
                    X = linha.charAt(2);
                }
                if(linha.charAt(0) == 'Y'){
                    Y = linha.charAt(2);
                }
                if(linha.charAt(0) == 'W'){
                    String S = extrairParteSelecionada(linha);
                    char SHexa = conversorS(S);
                    String operacao = "";
                    operacao+=X;
                    operacao+=Y;
                    operacao+=SHexa;
                    bw.write(operacao);
                    bw.newLine();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //função para obter valor de S;
    public static String extrairParteSelecionada(String entrada) {
        int indiceInicial = entrada.indexOf("="); // Encontra o índice do caractere "="
        int indiceFinal = entrada.indexOf(";"); // Encontra o índice do caractere ";"

        // Verifica se ambos os caracteres foram encontrados
        if (indiceInicial != -1 && indiceFinal != -1) {
            // Adiciona 1 ao índice inicial para ignorar o caractere "="
            // Retorna a parte selecionada da string
            return entrada.substring(indiceInicial + 1, indiceFinal);
        } else {
            // Retorna uma string vazia se os caracteres não forem encontrados
            return "";
        }
    }

    //método de conversão
    public static char conversorS(String S){
        char SHexa = 'z';

        if(S.equals("nB")){
            SHexa = '0';
            return SHexa;
        }
        if(S.equals("nAeBn")){
            SHexa = '1';
            return SHexa;
        }
        if(S.equals("nAeB")){
            SHexa = '2';
            return SHexa;
        }
        if(S.equals("Lzero")){
            SHexa = '3';
            return SHexa;
        }
        if(S.equals("AeBn")){
            SHexa = '4';
            return SHexa;
        }
        if(S.equals("nA")){
            SHexa = '5';
            return SHexa;
        }
        if(S.equals("AxB")){
            SHexa = '6';
            return SHexa;
        }
        if(S.equals("AenB")){
            SHexa = '7';
            return SHexa;
        }
        if(S.equals("nAonB")){
            SHexa = '8';
            return SHexa;
        }
        if(S.equals("nAxnB")){
            SHexa = '9';
            return SHexa;
        }
        if(S.equals("Bcopia")){
            SHexa = 'A';
            return SHexa;
        }
        if(S.equals("AeB")){
            SHexa = 'B';
            return SHexa;
        }
        if(S.equals("Lum")){
            SHexa = 'C';
            return SHexa;
        }
        if(S.equals("AonB")){
            SHexa = 'D';
            return SHexa;
        }
        if(S.equals("AoB")){
            SHexa = 'E';
            return SHexa;
        }
        if(S.equals("Acopia")){
            SHexa = 'F';
            return SHexa;
        }

        return SHexa;
    }
}