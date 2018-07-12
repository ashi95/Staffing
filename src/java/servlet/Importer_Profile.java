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
public class Importer_Profile extends HttpServlet {
 int civilite_id=0;
 int departement_id=0;
 int anapec_id=0;
 int sortie_id=0;
 int pole_id=0;
 int metier_id=0;
 int position_id=0;
 int status_id=0;
 int seniorite_id=0;
 int active_id=0;
 int er_id=0;
 int polyv_id=0;
 int mec_id=0;
 int vend_id=0;    
static String civilite;
static String nom_complet;
static String anapec;
static String date_debut;
static String date_fin;
static String raison_sortie;
static String experience;
static String pole;
static String metier;
static String position;
static String status;
static String seniorite;
static String email;
static String id_metier;
static String date_naissance;
static String date_embauche;
static String date_changement_contrat;
static String active;
static String date_creation;
static String derniere_modification;
static String leader;
static String hierarchical_manager;
static String functional_manager;
static String t1_er;
static String t1_polyv;
static String t1_mec;
static String t1_vend;
static final String CHEMIN="C:\\fichiers";
static final int TAILLE_TAMPON=102400;//10 ko
 private final String UPLOAD_DIRECTORY = "C:/fichiers";
 Row.MissingCellPolicy MCP=Row.MissingCellPolicy.RETURN_BLANK_AS_NULL;
 
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
             civilite=nextRow.getCell(1).getStringCellValue();
             if(civilite.contains("Male")||civilite.contains("1"))
             {
                 civilite="Mr";
             }
             else if (civilite.contains("Female")||civilite.contains("2"))
             {
                 civilite="Mme";
             }
             Cell cell=nextRow.getCell(2);
             Cell cell1=nextRow.getCell(3);
            if(cell==null||cell1==null)
            {
                break;
            }
            else{
                nom_complet=nextRow.getCell(2).getStringCellValue().concat(" "+nextRow.getCell(3).getStringCellValue());
            }
               Cell c1 =nextRow.getCell(6,Row.MissingCellPolicy.RETURN_BLANK_AS_NULL);
                if(c1==null||c1.getCellTypeEnum()==CellType.STRING)
                {
                    date_debut=null;
                }
                else{
               Date date1=nextRow.getCell(6).getDateCellValue();
                
                date_debut=new SimpleDateFormat("yyyy/MM/dd").format(date1);
                }
                Cell c2 =nextRow.getCell(21,Row.MissingCellPolicy.RETURN_BLANK_AS_NULL);
                if(c2==null||c2.getCellTypeEnum()==CellType.STRING)
                {
                    
                
                date_fin=null;
                }
                else{
                Date date2=nextRow.getCell(21,Row.MissingCellPolicy.RETURN_BLANK_AS_NULL).getDateCellValue();
                
                date_fin=new SimpleDateFormat("yyyy/MM/dd").format(date2);
                }
                position= nextRow.getCell(11).getStringCellValue();
                position=position.substring(6);
                position=position.replace(" (CPOld)", "");
                position=position.replace("(CP15)", "");
                
              
                Cell cell3=nextRow.getCell(4);
            if(cell3==null)
            {
                email="NA";
            }
            else{
                email=nextRow.getCell(4).getStringCellValue(); 
            }
                Cell c3 =nextRow.getCell(14,Row.MissingCellPolicy.RETURN_BLANK_AS_NULL);
                if(c3==null||c3.getCellTypeEnum()==CellType.STRING)
                {
                    date_naissance=null;
                }
                else
                {
                Date date3=nextRow.getCell(14).getDateCellValue();
                
                date_naissance=new SimpleDateFormat("yyyy/MM/dd").format(date3);
                }
                Cell c4 =nextRow.getCell(18,Row.MissingCellPolicy.RETURN_BLANK_AS_NULL);
                if(c4==null||c4.getCellTypeEnum()==CellType.STRING)
                {
                date_embauche=null;
                }
                else
                {
                Date date4=nextRow.getCell(18).getDateCellValue();
                
                date_embauche=new SimpleDateFormat("yyyy/MM/dd").format(date4);
                }
                
                Cell c5 =nextRow.getCell(24,Row.MissingCellPolicy.RETURN_BLANK_AS_NULL);
                if(c5==null||c5.getCellTypeEnum()==CellType.STRING)
                {
                    date_creation=null;
                }
                else
                {
                 Date date5=nextRow.getCell(24).getDateCellValue();
                 date_creation=new SimpleDateFormat("yyyy/MM/dd").format(date5);
                }
                Cell c6 =nextRow.getCell(25,Row.MissingCellPolicy.RETURN_BLANK_AS_NULL);
                if(c6==null||c6.getCellTypeEnum()==CellType.STRING)
                {
                    derniere_modification=null;
                }
                else
                {
                 Date date6=nextRow.getCell(25).getDateCellValue();               
                derniere_modification=new SimpleDateFormat("yyyy/MM/dd").format(date6);
                }
                Cell cell4=nextRow.getCell(9);
            if(cell4==null)
            {
                hierarchical_manager="NA";
            }
            else
            {
                hierarchical_manager=nextRow.getCell(9).getStringCellValue();
            }
            Cell cell5=nextRow.getCell(10);
            if(cell5==null)
            {
                functional_manager="NA";
            }
            else
            {
                functional_manager=nextRow.getCell(10).getStringCellValue();
            }
            Cell cell6=nextRow.getCell(12);
            if(cell6==null)
            {
                id_metier="0";
            }
            else
            {
                double value=nextRow.getCell(12).getNumericCellValue();
                id_metier=String.valueOf(value);
            }
                active=nextRow.getCell(22).getStringCellValue();
                if(active.contains("true"))
                {
                    active="vrai";
                }
                else if (active.contains("false"))
                {
                    active="faux";
                }
                  try {
             Helper.getId("civilite_id", "civilite","info" ,civilite);
          civilite_id=Helper.id;
          Helper.getId("anapec_id", "anapec","info" ,anapec);
          anapec_id=Helper.id;
          Helper.getId("sortie_id", "raison_sortie","info" ,anapec);
          sortie_id=Helper.id;
          Helper.getId("pole_id", "pole","info" ,pole);
          pole_id=Helper.id;
          Helper.getId("metier_id", "metier","info" ,metier);
          metier_id=Helper.id;
          Helper.getId("position_id", "position","info" ,position);
          position_id=Helper.id;
          Helper.getId("status_id", "status","info" ,status);
          status_id=Helper.id;
          Helper.getId("seniorite_id", "seniorite","info" ,seniorite);
          seniorite_id=Helper.id;
          Helper.getId("er_id", "t1_er","info" ,t1_er);
          er_id=Helper.id;
          Helper.getId("polyv_id", "t1_polyv","info" ,t1_polyv);
          polyv_id=Helper.id;
          Helper.getId("mec_id", "t1_mec","info" ,t1_mec);
          mec_id=Helper.id;
          Helper.getId("vend_id", "t1_vend","info" ,t1_vend);
          vend_id=Helper.id;
          Helper.getId("active_id", "active","info" ,active);
          active_id=Helper.id;

          
          
     } catch (ClassNotFoundException ex) {
         ex.printStackTrace();
     } catch (SQLException ex) {
         ex.printStackTrace();
     }
                
                try {
                    InsertRowInDB(civilite_id,nom_complet,date_debut,date_fin,position_id,email,date_naissance,date_embauche,active_id,date_creation,derniere_modification,hierarchical_manager,functional_manager,id_metier);
                   
                } catch (SQLException ex) {
                    ex.printStackTrace();
                } catch (ClassNotFoundException ex) {
                    ex.printStackTrace();
                }
        }
         
        workbook.close();
        Path filetodelete=Paths.get("C:\\fichiers\\helloe"+random+""+nomFichier);
        Files.delete(filetodelete);
        response.sendRedirect("ProfileA.jsp");
     
    }
    
    public void InsertRowInDB(int civilite,String nom_complet,String date_debut,String date_fin,int position,String email,String date_naissance,String date_embauche,int active,String date_creation,String derniere_modification,String hierarchical_manager,String functional_manager,String id_metier) throws SQLException, ClassNotFoundException{

      Class.forName("com.mysql.jdbc.Driver");
                // loads driver
             Connection    c = DriverManager.getConnection("jdbc:mysql://localhost:3306/staffing", "root", "root");
                
         String selectsql="SELECT nom_complet from profile where nom_complet=?";
                PreparedStatement statement =  c.prepareStatement(selectsql);// gets a new connection
                statement.setString(1, Importer_Profile.nom_complet);
                ResultSet rs = statement.executeQuery();
                String duplicate = null;
                while (rs.next())
                {
                    duplicate = rs.getString(1);
                }
                if(duplicate==null){
        
        String sql="Insert into profile(civilite_id,nom_complet,date_debut,date_fin,position_id,email,date_naissance,date_embauche,active_id,date_creation,derniere_modification,hierarchical_manager,functional_manager,id_metier) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        statement =  c.prepareStatement(sql);
        statement.setInt(1,civilite);
               statement.setString(2,nom_complet);
                statement.setString(3, date_debut);
                statement.setString(4, date_fin);
                statement.setInt(5,position);
                statement.setString(6,email);
                statement.setString(7,date_naissance);
                statement.setString(8,date_embauche);
                statement.setInt(9,active);
                statement.setString(10,date_creation);
                statement.setString(11,derniere_modification);
                statement.setString(12,hierarchical_manager);
                statement.setString(13,functional_manager);
                statement.setString(14,id_metier);
    statement.executeUpdate();
                }
               rs.close();
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

