package bean;

public class RoomImage {
   private String RI_Name;
   private String RI_Path;
   
   public RoomImage(String RI_Name, String RI_Path){
	   this.RI_Name = RI_Name;
	   this.RI_Path = RI_Path;
   }
public String getRI_Name() {
      return RI_Name;
   }
   public void setRI_Name(String rI_Name) {
      RI_Name = rI_Name;
   }
   public String getRI_Path() {
      return RI_Path;
   }
   public void setRI_Path(String rI_Path) {
      RI_Path = rI_Path;
   }
}