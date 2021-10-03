package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_535:String;
      
      private var var_2245:String;
      
      private var var_790:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = null, param3:String = null)
      {
         super();
         this.var_535 = param1;
         this.var_790 = param2;
         this.var_2245 = param3;
      }
      
      public function get figure() : String
      {
         return this.var_535;
      }
      
      public function get race() : String
      {
         return this.var_2245;
      }
      
      public function get gender() : String
      {
         return this.var_790;
      }
   }
}
