package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1685:int = 1;
      
      public static const const_1719:int = 2;
      
      public static const const_1660:int = 3;
      
      public static const const_1757:int = 4;
      
      public static const const_1308:int = 5;
      
      public static const const_1823:int = 6;
      
      public static const const_1290:int = 7;
      
      public static const const_1439:int = 8;
      
      public static const const_1805:int = 9;
      
      public static const const_1311:int = 10;
      
      public static const const_1389:int = 11;
      
      public static const const_1436:int = 12;
       
      
      private var _roomId:int;
      
      private var var_1574:int;
      
      private var var_1330:String;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._roomId = param1.readInteger();
         this.var_1574 = param1.readInteger();
         this.var_1330 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get errorCode() : int
      {
         return this.var_1574;
      }
      
      public function get info() : String
      {
         return this.var_1330;
      }
   }
}
