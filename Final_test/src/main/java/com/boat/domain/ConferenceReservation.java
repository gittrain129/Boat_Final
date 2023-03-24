package com.boat.domain;

public class ConferenceReservation {
    private String ID;
     private String RENTAL;
     private String START_TIME;
     private String END_TIME;
     private String CONTENT;

   
   public String getID() {
      return ID;
   }
   public void setID(String iD) {
      ID = iD;
   }
   public String getRENTAL() {
      return RENTAL;
   }
   public void setRENTAL(String rENTAL) {
      RENTAL = rENTAL;
   }
   public String getSTART_TIME() {
      return START_TIME;
   }
   public void setSTART_TIME(String sTART_TIME) {
      START_TIME = sTART_TIME;
   }
   public String getEND_TIME() {
      return END_TIME;
   }
   public void setEND_TIME(String eND_TIME) {
      END_TIME = eND_TIME;
   }

   public String getCONTENT() {
      return CONTENT;
   }
   public void setCONTENT(String cONTENT) {
      CONTENT = cONTENT;
   }     

}