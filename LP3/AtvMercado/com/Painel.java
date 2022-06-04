package com;

import javax.swing.JFrame;
import javax.swing.JOptionPane;

public abstract class Painel {

    public static String inputUsuario(String mensagem){
        JFrame f = new JFrame();
        return JOptionPane.showInputDialog(f, mensagem, "Responda abaixo", JOptionPane.QUESTION_MESSAGE);
    }

    public static void mensagem(String mensagem, String titulo){
        JFrame f = new JFrame();
        JOptionPane.showMessageDialog(f, mensagem, titulo, JOptionPane.NO_OPTION);
    }

    public static void finalizarCompra(Double valor){
        JFrame f = new JFrame();
        String[] escolhas = {"Débito", "Crédito", "Fiado"};
        JOptionPane.showOptionDialog(f, "O Total de sua compra ficou: R$"+valor+"\nQual o método de pagamento?",
                                    "Finalizar Compra", JOptionPane.YES_NO_CANCEL_OPTION, JOptionPane.PLAIN_MESSAGE,
                                    null, escolhas, "Débito");
    }

    public static void mensagem(String mensagem){
        JFrame f = new JFrame();
        JOptionPane.showMessageDialog(f, mensagem, "", JOptionPane.NO_OPTION);
    }

    public static String mensagemInicial(){
        JFrame f = new JFrame();
        return JOptionPane.showInputDialog(f,"Digite a opção desejada:\n"+ 
                                            "1 - Adicionar item na lista\n"+
                                            "2 - Adicionar item na cesta\n"+
                                            "3 - Ver lista\n"+
                                            "4 - Ver cesta\n"+
                                            "5 - Remover item da lista\n"+
                                            "6 - Remover item da cesta\n"+
                                            "7 - Ver extrato\n"+
                                            "8 - Fazer compra\n"+
                                            "0 - Sair", "Menu inicial", JOptionPane.PLAIN_MESSAGE);
    }

    public static void erro(String mensagem){
        JFrame f = new JFrame();
        JOptionPane.showMessageDialog(f, mensagem, "Erro", JOptionPane.WARNING_MESSAGE);
    }

    public static void finalizandoPrograma(){
        JFrame f = new JFrame();
        JOptionPane.showMessageDialog(f, "Finalizando programa", "Fim", JOptionPane.NO_OPTION);
    }
}
