/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.concurrent.ThreadLocalRandom;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.Cookie;
import javax.servlet.http.Part;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;




/**
 *
 * @author LENOVO T440S
 */
public class Importer_Projet extends HttpServlet {


 int opportunite_id=0;
 int service_id=0;
 int type_projet_id=0;
 int adm_id=0;
 int allocation_id=0;
 int client_id=0;
 int type_allocation_id=0;    
static String nom_projet;
static String opportunite;
static String service;
static String date_debut;
static String date_fin;
static String type_projet;
static String ADM;
static String allocation_cours;
static String type_allocation;
static String client;
static String budget;
static final String CHEMIN="C:\\fichiers";
static final int TAILLE_TAMPON=102400;//10 ko
 private final String UPLOAD_DIRECTORY = "C:/fichiers";
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nom=null;
   Cookie[] cookies=request.getCookies();
   if(cookies!=null){
       for(Cookie cookie:cookies){
           if(cookie.getName().equals("nom"))
           {
               nom=cookie.getValue();
           }
       }
       if(nom==null){
           response.sendRedirect("login.jsp");
       }
   }
        
        
        
          Part filePart=request.getPart("file");
        
        Part part=request.getPart("file");
        String nomFichier=getNomFichier(part);
        
        
      
        
        
        
        int random=ThreadLocalRandom.current().nextInt(1,100000000);       
        String path="C:\\fichiers\\helloe"+random+""+nomFichier ;
        if(nomFichier!=null && !nomFichier.isEmpty()){        
            nomFichier=nomFichier.substring(nomFichier.lastIndexOf('/')+1).substring(nomFichier.lastIndexOf('\\')+1);
            ecrireFichier(part,nomFichier,"C:\\fichiers\\helloe"+random);                 
        }
        
        
        

           XSSFWorkbook workbook = new XSSFWorkbook("C:\\fichiers\\helloe"+random+""+nomFichier);
     Sheet firstSheet = workbook.getSheetAt(0);
        Iterator<Row> iterator = firstSheet.iterator();
         
        while (iterator.hasNext()) {
            
            Row nextRow = iterator.next();
            if (nextRow.getRowNum() == 0) {
              continue;
            }
            Iterator<Cell> cellIterator = nextRow.cellIterator();
             
            while (cellIterator.hasNext()) {
                Cell cell = cellIterator.next();
                 
                 
                switch (cell.getCellType()) {
                    case Cell.CELL_TYPE_STRING:
                        cell.getStringCellValue();
                        break;
                    case Cell.CELL_TYPE_BOOLEAN:
                        System.out.print(cell.getBooleanCellValue());
                        break;
                    case Cell.CELL_TYPE_NUMERIC:
                        if(DateUtil.isCellDateFormatted(cell)){
                         Date date=cell.getDateCellValue();
                         
                         
                         System.out.println(date);
                        }
                        else{
                        System.out.print(cell.getNumericCellValue());
                        }
                        break;
                }
                
            }
            Cell cell=nextRow.getCell(0);
            if(cell==null)
            {
                break;
            }
            else
            {
             nom_projet=nextRow.getCell(0).getStringCellValue();
            }
            Cell cell1=nextRow.getCell(1);
            if(cell1==null)
            {
                 request.setAttribute("erreur", "veuillez remplir le champ opportunite de fichier exceel ");        
         RequestDispatcher rd=request.getRequestDispatcher("ProjetA.jsp");
         rd.forward(request,response);
            }
            else 
            {
             opportunite=nextRow.getCell(1).getStringCellValue();
            }
            Cell cell2=nextRow.getCell(2);
            if(cell2==null)
            {
                 request.setAttribute("erreur", "veuillez remplir le champ service de fichier exceel ");        
         RequestDispatcher rd=request.getRequestDispatcher("ProjetA.jsp");
         rd.forward(request,response);
            }
            else 
            {
            service=nextRow.getCell(2).getStringCellValue();
            }
                Cell c1 =nextRow.getCell(3,Row.MissingCellPolicy.RETURN_BLANK_AS_NULL);
                if(c1==null||c1.getCellTypeEnum()==CellType.STRING)
                {
                    date_debut=null;
                }
                else
                {
               Date date1=nextRow.getCell(3).getDateCellValue();               
                date_debut=new SimpleDateFormat("yyyy/MM/dd").format(date1);
                }
                Cell c2 =nextRow.getCell(4,Row.MissingCellPolicy.RETURN_BLANK_AS_NULL);
                if(c2==null||c2.getCellTypeEnum()==CellType.STRING)
                {
                    date_fin=null;
                }
                else{
                   Date date2=nextRow.getCell(4).getDateCellValue();               
                date_fin=new SimpleDateFormat("yyyy/MM/dd").format(date2);
                }
                Cell cell5=nextRow.getCell(5);
                if(cell5==null)
                {
                    request.setAttribute("erreur", "veuillez remplir le champ type projet de fichier exceel ");        
         RequestDispatcher rd=request.getRequestDispatcher("ProjetA.jsp");
         rd.forward(request,response);
                }
                else
                {
                type_projet=nextRow.getCell(5).getStringCellValue();
                }
                 Cell cell6=nextRow.getCell(6);
                if(cell6==null)
                {
                    request.setAttribute("erreur", "veuillez remplir le champ ADM de fichier exceel ");        
         RequestDispatcher rd=request.getRequestDispatcher("ProjetA.jsp");
         rd.forward(request,response);
                }
                else
                {
                ADM=nextRow.getCell(6).getStringCellValue();
                }
                 Cell cell7=nextRow.getCell(7);
                if(cell7==null)
                {
                    request.setAttribute("erreur", "veuillez remplir le champ allocation_cours de fichier exceel ");        
         RequestDispatcher rd=request.getRequestDispatcher("ProjetA.jsp");
         rd.forward(request,response);
                }
                else
                {
                allocation_cours=nextRow.getCell(7).getStringCellValue();  
                }
                 Cell cell8=nextRow.getCell(8);
                if(cell8==null)
                {
                    request.setAttribute("erreur", "veuillez remplir le champ type allocation de fichier exceel ");        
         RequestDispatcher rd=request.getRequestDispatcher("ProjetA.jsp");
         rd.forward(request,response);
                }
                else
                {
                type_allocation=nextRow.getCell(8).getStringCellValue();
                }
                 Cell cell9=nextRow.getCell(9);
                if(cell9==null)
                {
                    request.setAttribute("erreur", "veuillez remplir le champ Client de fichier exceel ");        
         RequestDispatcher rd=request.getRequestDispatcher("ProjetA.jsp");
         rd.forward(request,response);
                }
                else
                {
                client=nextRow.getCell(9).getStringCellValue();
                }
             Cell cell10=nextRow.getCell(10);
            if(cell10==null)
            {
                budget="0";
            }
            else{
                double value=nextRow.getCell(10).getNumericCellValue();
                budget=String.valueOf(value);
            }
                 try {
             Helper.getId("opportunite_id", "chance","chance" ,opportunite);
          opportunite_id=Helper.id;
          Helper.getId("service_id", "service","chance" ,service);
          service_id=Helper.id;
          Helper.getId("type_projet_id", "type_projet","info" ,type_projet);
          type_projet_id=Helper.id;
          Helper.getId("adm_id", "adm","info" ,ADM);
          adm_id=Helper.id;
          Helper.getId("allocation_id", "allocation_cours","info" ,allocation_cours);
          allocation_id=Helper.id;
          Helper.getId("type_allocation_id", "type_allocation","info" ,type_allocation);
          type_allocation_id=Helper.id;
          Helper.getId("client_id", "client","client" ,client);
         client_id=Helper.id;
          
     } catch (ClassNotFoundException ex) {
         ex.printStackTrace();
     } catch (SQLException ex) {
        ex.printStackTrace();
     }
                
                
                try {
                    InsertRowInDB(nom_projet,opportunite_id,service_id,date_debut,date_fin,type_projet_id,adm_id,allocation_id,type_allocation_id,client_id,budget,nom);
                   
                } catch (SQLException ex) {
                    
                    ex.printStackTrace();
                } catch (ClassNotFoundException ex) {
                    ex.printStackTrace();
                }
        }
         
        workbook.close();
        Path filetodelete=Paths.get("C:\\fichiers\\helloe"+random+""+nomFichier);
        Files.delete(filetodelete);
        response.sendRedirect("ProjetA.jsp");
        
    }
    
    public void InsertRowInDB(String nom_projet,int opportunite,int service,String date_debut,String date_fin,int type_projet,int ADM,int allocation_cours,int type_allocation,int client,String budget,String createur) throws SQLException, ClassNotFoundException{

        Class.forName("com.mysql.jdbc.Driver");
                // loads driver
                Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/staffing", "root", "root");
         String selectsql="SELECT nom_projet from projet where nom_projet=?";
                PreparedStatement statement =  c.prepareStatement(selectsql);// gets anew connection
                statement.setString(1, Importer_Projet.nom_projet);
                ResultSet rs = statement.executeQuery();
                String duplicate = null;
                while (rs.next())
                {
                    duplicate = rs.getString(1);
                }
                if(duplicate==null){
        
        String sql="Insert into projet(nom_projet,opportunite_id,service_id,date_debut,date_fin,type_projet_id,adm_id,allocation_id,type_allocation_id,client_id,budget,createur) values(?,?,?,?,?,?,?,?,?,?,?,?)";
        statement =  c.prepareStatement(sql);
        statement.setString(1, nom_projet);
               statement.setInt(2,opportunite);
               statement.setInt(3,service);               
                statement.setString(4,date_debut);
                statement.setString(5,date_fin);
                statement.setInt(6,type_projet);
                statement.setInt(7,ADM);
                statement.setInt(8,allocation_cours);
                statement.setInt(9,type_allocation);
                statement.setInt(10,client);
                statement.setString(11,budget);
                statement.setString(12,createur);
                }
    statement.executeUpdate();
    
    statement.close();
                c.close();
                
                
    }
     private static String getNomFichier(Part part)
    {
        /* boucle sur chacun des paramètres de l'en-tete ""content-disposition*/
        for(String contentDisposition : part.getHeader("content-disposition").split(";"))
        {
            /*Recherche de l'éventuelle présence du paramètre 'filename'*/
            if(contentDisposition.trim().startsWith("filename")){
                /* si "filename" est present alors renvoi sa valeur c'est a dire le nom de fichier*/
                return contentDisposition.substring(contentDisposition.indexOf('=')+1).trim().replace("\"", "");
            }
        }
        /* si rien n'est trouvé*/
    return null;
    }

private void ecrireFichier(Part part,String nomFichier,String chemin) throws IOException{
BufferedInputStream entree=null;
BufferedOutputStream sortie=null;
try
{
entree=new BufferedInputStream(part.getInputStream(),TAILLE_TAMPON);
sortie=new BufferedOutputStream(new FileOutputStream(new File(chemin+nomFichier)),TAILLE_TAMPON);
byte[] tampon=new byte[TAILLE_TAMPON];
int longueur;
while((longueur=entree.read(tampon))>0){
    sortie.write(tampon,0,longueur);
}


}finally{
    try{
        sortie.close();
    }catch(IOException e){
        e.printStackTrace();
    }
    try
    {
        entree.close();
    }catch(IOException e)
    {
        e.printStackTrace();
    }
}
}
 
}

