package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_257:String = "ROE_MOUSE_CLICK";
      
      public static const const_1700:String = "ROE_MOUSE_ENTER";
      
      public static const const_461:String = "ROE_MOUSE_MOVE";
      
      public static const const_1696:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1800:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_500:String = "ROE_MOUSE_DOWN";
       
      
      private var var_1517:String = "";
      
      private var var_2071:Boolean;
      
      private var var_2072:Boolean;
      
      private var var_2070:Boolean;
      
      private var var_2065:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:String, param3:int, param4:String, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false)
      {
         super(param1,param3,param4,param9,param10);
         this.var_1517 = param2;
         this.var_2071 = param5;
         this.var_2072 = param6;
         this.var_2070 = param7;
         this.var_2065 = param8;
      }
      
      public function get eventId() : String
      {
         return this.var_1517;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2071;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2072;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2070;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2065;
      }
   }
}
