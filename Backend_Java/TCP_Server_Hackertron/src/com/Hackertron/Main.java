package com.Hackertron;

public class Main {
    public static void main(String[] args) {

        TCPServer tcpServer = new TCPServer(8001);
        tcpServer.start();
    }
}
