package com.Hackertron;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;

public class TCPServer extends Thread
{
    private ServerSocket serverSocket;
    private ArrayList<Socket> clientList;
    private int port;

    public TCPServer(int port)
    {
        this.port = port;
        clientList = new ArrayList<Socket>();
    }


    @Override
    public void run()
    {
        try { serverSocket = new ServerSocket(port); }
        catch (IOException e) {
            e.printStackTrace(); }

        while (!isInterrupted())
        {
            listen();
        }
    }

    private void listen()
    {
        try (Socket newClient = serverSocket.accept())
        {
            clientList.add(newClient);
            System.out.println( newClient.getInetAddress().getHostName()+" connected");
            System.out.println(clientList.size()+" connected");
        } catch (IOException e)
        {
            e.printStackTrace();
        }
    }

    private void shutDown()
    {
        try
        {
            serverSocket.close();
        } catch (IOException e)
        {
            e.printStackTrace();
        }
    }
}
