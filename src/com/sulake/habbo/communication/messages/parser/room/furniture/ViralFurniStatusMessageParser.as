package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ViralFurniStatusMessageParser implements IMessageParser
   {
       
      
      private var var_331:int;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var _status:int;
      
      private var var_1318:String;
      
      private var var_2047:String;
      
      public function ViralFurniStatusMessageParser()
      {
         super();
      }
      
      public function get objectId() : int
      {
         return this.var_331;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get shareId() : String
      {
         return this.var_1318;
      }
      
      public function get status() : int
      {
         return this._status;
      }
      
      public function get firstClickUserName() : String
      {
         return this.var_2047;
      }
      
      public function flush() : Boolean
      {
         this._roomId = 0;
         this._roomCategory = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_331 = param1.readInteger();
         this._status = param1.readInteger();
         this.var_1318 = param1.readString();
         this.var_2047 = param1.readString();
         return true;
      }
   }
}
