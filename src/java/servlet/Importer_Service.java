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
import static servlet.Importer_Opportunite.id_merge;




/**
 *
 * @author LENOVO T440S
 */
public class Importer_Service extends HttpServlet {
    
int  client_id=0;       
int  adm_id=0;
int  status_id=0;
int proprietaire_id=0;    
static String id_merge;
static String chance;
static String client;
static String proprietaire;
static String date_debut;
static String date_fin;
static String ADM;
static String status;
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
                id_merge="NA";
            }
            else
            {
             id_merge=nextRow.getCell(0).getStringCellValue();
            }
            Cell cell1=nextRow.getCell(1);
            if(cell1==null)
            {
                break;
            }
                else{
                chance=nextRow.getCell(1).getStringCellValue();
            }
                Cell cell2=nextRow.getCell(2);
            if(cell2==null)
            {
                request.setAttribute("erreur", "veuillez le champ Client du fichier exceel ");        
         RequestDispatcher rd=request.getRequestDispatcher("ServiceA.jsp");
         rd.forward(request,response);
            }
            else
            {
             client=nextRow.getCell(2).getStringCellValue();
               
            }
            Cell cell3=nextRow.getCell(3);
            if(cell3==null)
            {
                request.setAttribute("erreur", "veuillez le champ Proprietaire du fichier exceel ");        
         RequestDispatcher rd=request.getRequestDispatcher("ServiceA.jsp");
         rd.forward(request,response);
            }
            else
            {
            proprietaire=nextRow.getCell(3).getStringCellValue();
            }
                Cell c1 =nextRow.getCell(4,Row.MissingCellPolicy.RETURN_BLANK_AS_NULL);
                if(c1==null||c1.getCellTypeEnum()==CellType.STRING)
                {
                    date_debut=null;
                }
                else
                {
               Date date1=nextRow.getCell(4).getDateCellValue();
                
                date_debut=new SimpleDateFormat("yyyy/MM/dd").format(date1);
                }
                Cell c2 =nextRow.getCell(5,Row.MissingCellPolicy.RETURN_BLANK_AS_NULL);
                if(c2==null||c2.getCellTypeEnum()==CellType.STRING)
                {
                    date_fin=null;
                }
                else
                {
                Date date2=nextRow.getCell(5).getDateCellValue();
                
                date_fin=new SimpleDateFormat("yyyy/MM/dd").format(date2);
                }
                Cell cell6=nextRow.getCell(6);
            if(cell6==null)
            {
                request.setAttribute("erreur", "veuillez le champ ADM du fichier exceel ");        
         RequestDispatcher rd=request.getRequestDispatcher("ServiceA.jsp");
         rd.forward(request,response);
            }
            else
            {
                ADM=nextRow.getCell(6).getStringCellValue();
            }
            Cell cell7=nextRow.getCell(7);
            if(cell7==null)
            {
                request.setAttribute("erreur", "veuillez le champ Status du fichier exceel ");        
         RequestDispatcher rd=request.getRequestDispatcher("ServiceA.jsp");
         rd.forward(request,response);
            }
            else
            {
                status=nextRow.getCell(7).getStringCellValue();  
            }      
                 try {
             Helper.getId("client_id", "client","client" ,client);
          client_id=Helper.id;
          Helper.getId("adm_id", "adm","info" ,ADM);
          adm_id=Helper.id;
          Helper.getId("proprietaire_id", "proprietaire","info" ,proprietaire);
          proprietaire_id=Helper.id;
          Helper.getId("statuo_id", "statuso","info" ,status);
          status_id=Helper.id;
          
     } catch (ClassNotFoundException ex) {
        ex.printStackTrace();
     } catch (SQLException ex) {
         ex.printStackTrace();
     }
                
                
                try {
                    InsertRowInDB(id_merge,chance, client_id, proprietaire_id, date_debut,date_fin,adm_id,status_id,nom);
                   
                } catch (SQLException ex) {
                    
                    ex.printStackTrace();
                } catch (ClassNotFoundException ex) {
                    ex.printStackTrace();
                }
        }
         
        workbook.close();
        Path filetodelete=Paths.get("C:\\fichiers\\helloe"+random+""+nomFichier);
        Files.delete(filetodelete);
        response.sendRedirect("ServiceA.jsp");
        
        
    }
    
    public void InsertRowInDB(String id,String chance,int client,int proprietaire,String date_debut,String date_fin,int ADM,int status,String createur) throws SQLException, ClassNotFoundException{

        Class.forName("com.mysql.jdbc.Driver");
                // loads driver
                Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/staffing", "root", "root");
        String selectsql="SELECT chance from service where chance=?";
                PreparedStatement statement =  c.prepareStatement(selectsql);// gets a new connection
                statement.setString(1, Importer_Service.chance);
                ResultSet rs = statement.executeQuery();
                String duplicate = null;
                while (rs.next())
                {
                    duplicate = rs.getString(1);
                }
                if(duplicate==null){
        
        String sql="Insert into service(id_merge,chance,client_id,proprietaire_id,date_debut,date_fin,adm_id,statuso_id,createur) values(?,?,?,?,?,?,?,?,?)";
     statement =  c.prepareStatement(sql);
        statement.setString(1, id_merge);
               statement.setString(2, chance);
               statement.setInt(3, client);
               statement.setInt(4, proprietaire);
                statement.setString(5, date_debut);
                statement.setString(6, date_fin);
                statement.setInt(7,ADM);
                statement.setInt(8,status);
                statement.setString(9,createur);
    statement.executeUpdate();
                }
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

