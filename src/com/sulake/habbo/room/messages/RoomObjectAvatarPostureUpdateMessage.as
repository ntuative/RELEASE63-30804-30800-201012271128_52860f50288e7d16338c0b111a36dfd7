package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarPostureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_2143:String;
      
      private var var_1240:String;
      
      public function RoomObjectAvatarPostureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         this.var_2143 = param1;
         this.var_1240 = param2;
      }
      
      public function get postureType() : String
      {
         return this.var_2143;
      }
      
      public function get parameter() : String
      {
         return this.var_1240;
      }
   }
}
