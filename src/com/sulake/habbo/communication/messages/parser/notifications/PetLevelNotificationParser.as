package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_1606:int;
      
      private var var_2514:String;
      
      private var var_1277:int;
      
      private var var_535:String;
      
      private var var_1354:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1606 = param1.readInteger();
         this.var_2514 = param1.readString();
         this.var_1277 = param1.readInteger();
         this.var_535 = param1.readString();
         this.var_1354 = param1.readInteger();
         return true;
      }
      
      public function get petId() : int
      {
         return this.var_1606;
      }
      
      public function get petName() : String
      {
         return this.var_2514;
      }
      
      public function get level() : int
      {
         return this.var_1277;
      }
      
      public function get figure() : String
      {
         return this.var_535;
      }
      
      public function get petType() : int
      {
         return this.var_1354;
      }
   }
}
