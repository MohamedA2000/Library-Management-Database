package com.mycompany.coelab5;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class COELab5 {

    public static void main(String[] args) throws SQLException {
        Connection c = null;
        Statement stmt = null;
        ResultSet rs = null;
        
        Scanner input = new Scanner(System.in);
        String choice = "";
        
        try {
            Class.forName("org.sqlite.JDBC");
            c = DriverManager.getConnection("jdbc:sqlite:/Users/mohamedabuomar/Desktop/sqlite-tools-osx-x86-3400100/test.db");
            
            while (!choice.equals("0")) {
                System.out.println("Choose a query (type 0 to quit):");
                System.out.println("1. Display All books in our library");
                System.out.println("2.Display the fines posted by a certain customer, and the amount (choose customer id 345) ");
                System.out.println("3. Search All current available books");
                System.out.println("4. Search when a book will be returned (choose bookid == 2568)");
                System.out.println("5. Display All customer information with the books they've checked out");
                System.out.println("6. Display Books published in a certain year (choose year ==2008)");
                System.out.println("7. Search for books of a specific genre (Dystopian)");
                System.out.println("8. Search for books of a specific format(Paperback)");
                System.out.println("9. FInd books available in a certain aisle # (1)");
                System.out.println("10. Seach if a book is available or not (The Hobbit)");
                
                System.out.println("Enter 0 to quit");

                System.out.println("\n");

                
                System.out.print("Enter your choice: ");
                choice = input.nextLine();                
                switch (choice) {
                    case "1":
                        stmt = c.createStatement();
                        rs = stmt.executeQuery("SELECT * from Books");
                        while (rs.next()) {
                             System.out.println(rs.getString("Title")+" "+rs.getString("Author"));
//                              System.out.println();

                        }
                        System.out.println("\n");
                        break;
                  case "2":
                    System.out.println("Enter customer ID (choose 345):");
                    int customerID = input.nextInt();
                    input.nextLine(); // consume the newline character
                    stmt = c.createStatement();
                    rs = stmt.executeQuery("SELECT * FROM Fines WHERE Customer_ID = " + customerID + " AND Fine_Status = 'Unpaid'");
                    while (rs.next()) {
                        System.out.println("Fine ID: " + rs.getInt("Fine_ID") + ", Amount: $" + rs.getDouble("Fine_Amount") + ", Customer ID: " + rs.getInt("Customer_ID"));
                    }
                    System.out.println("\n");
                    break;
                
                case "3":
                    stmt = c.createStatement();
                    rs = stmt.executeQuery("SELECT * FROM Borrows WHERE date_returned IS NOT NULL");
                    while (rs.next()) {
                        System.out.println("Borrow ID: " + rs.getInt("Borrow_ID"));
                        System.out.println("Customer ID: " + rs.getInt("Customer_ID"));
                        System.out.println("Book ID: " + rs.getInt("Book_ID"));
                        System.out.println("Borrow Date: " + rs.getString("date_borrowed"));
                        System.out.println("Return Date: " + rs.getString("date_returned"));
                        System.out.println();
                    }
                    break;
                case "4":
                    System.out.println("Enter book ID (choose 2568):");
                    int bookID = input.nextInt();
                     input.nextLine(); // consume the newline character
                    stmt = c.createStatement();
                    rs = stmt.executeQuery("SELECT due_date FROM borrows WHERE book_id = " + bookID + " AND date_returned IS NULL");
                    while (rs.next()) {
                        System.out.println("Due Date: " + rs.getString("due_date"));
                    }
                    break;
                case "5":
                    stmt = c.createStatement();
                    rs = stmt.executeQuery("SELECT customers.customer_id, customers.first_name, customers.last_name, customers.email, books.title FROM borrows INNER JOIN customers ON borrows.customer_id = customers.customer_id INNER JOIN books ON borrows.book_id = books.book_id");
                    while (rs.next()) {
                        System.out.println("Customer ID: " + rs.getInt("customer_id"));
                        System.out.println("First Name: " + rs.getString("first_name"));
                        System.out.println("Last Name: " + rs.getString("last_name"));
                        System.out.println("Email: " + rs.getString("email"));
                        System.out.println("Book Title: " + rs.getString("title"));
                        System.out.println();
                    }
                    break;
                case "6":
                    System.out.println("Enter the year (choose 2008):");
                    int year = input.nextInt();
                    input.nextLine(); // consume the newline character
                    stmt = c.createStatement();
                    rs = stmt.executeQuery("SELECT * FROM books WHERE publication_date >= '" + year + "' AND publication_date <= '" + (year + 1) + "'");
                    while (rs.next()) {
                        System.out.println("Title: " + rs.getString("Title"));
                        System.out.println("Author: " + rs.getString("Author"));
                        System.out.println("Publication Date: " + rs.getString("publication_date"));
                        System.out.println("Genre: " + rs.getString("Genre"));
                        System.out.println("Book Format: " + rs.getString("Book_Type"));
                        System.out.println();
                    }
                    break;
                case "7":
                    System.out.println("Enter the genre (Choose 'Dystopian'):");
                    String genre = input.nextLine();
                    stmt = c.createStatement();
                    rs = stmt.executeQuery("SELECT * FROM Books WHERE genre = '" + genre + "'");
                    while (rs.next()) {
                        System.out.println("Title: " + rs.getString("Title"));
                        System.out.println("Author: " + rs.getString("Author"));
                        System.out.println("Publication Date: " + rs.getString("publication_date"));
                        System.out.println("Genre: " + rs.getString("Genre"));
                        System.out.println();
                    }
                    break;
                case "8":
                    System.out.println("Enter the book type(Paperback):");
                    String bookType = input.nextLine();
                    stmt = c.createStatement();
                    rs = stmt.executeQuery("SELECT * FROM books WHERE Book_Type = '" + bookType + "'");
                    while (rs.next()) {
                        System.out.println("Title: " + rs.getString("Title"));
                        System.out.println("Author: " + rs.getString("Author"));
                        System.out.println("Publication Date: " + rs.getString("publication_date"));
                        System.out.println("Genre: " + rs.getString("Genre"));
                        System.out.println("Book Format: " + rs.getString("Book_Type"));

                        System.out.println();
                    }
                    break;
                case "9":
                    System.out.println("Enter the aisle number(1):");
                    int aisleNumber = input.nextInt();
                    input.nextLine(); // consume the newline character
                    stmt = c.createStatement();
                    rs = stmt.executeQuery("SELECT * FROM books WHERE aisle_number = " + aisleNumber);
                    while (rs.next()) {
                        System.out.println("Title: " + rs.getString("Title"));
                        System.out.println("Author: " + rs.getString("Author"));
                        System.out.println("Publication Date: " + rs.getString("publication_date"));
                        System.out.println("Genre: " + rs.getString("Genre"));
                        System.out.println("Book Format: " + rs.getString("Book_Type"));
                        System.out.println("Aisle Number: " + rs.getInt("Aisle_Number"));
                        
                        System.out.println();
                    }
                    break;
                case "10":
                    System.out.println("Enter the book title (The Hobbit):");
                    String bookTitle = input.nextLine();
                    stmt = c.createStatement();
                    rs = stmt.executeQuery("SELECT * FROM books WHERE title = '" + bookTitle + "'");
                    while (rs.next()) {
                        System.out.println("Title: " + rs.getString("Title"));
                        System.out.println("Available: " + rs.getBoolean("Available"));
                        System.out.println("Aisle Number: " + rs.getInt("Aisle_Number"));

                        System.out.println();
                    }
                    break;


                    

                    case "0":
                        System.out.println("Exiting program...");
                        break;
                    default:
                        System.out.println("Invalid choice!");
                        break;
                }
                
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
            }
            
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
        } finally {
            if (c != null) {
                c.close();
            }
        }
    }
}
