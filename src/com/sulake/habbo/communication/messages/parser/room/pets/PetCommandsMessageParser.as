package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetCommandsMessageParser implements IMessageParser
   {
       
      
      private var var_1606:int;
      
      private var var_1087:Array;
      
      public function PetCommandsMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1606;
      }
      
      public function get enabledCommands() : Array
      {
         return this.var_1087;
      }
      
      public function flush() : Boolean
      {
         this.var_1606 = -1;
         this.var_1087 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1606 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this.var_1087 = new Array();
         while(_loc2_-- > 0)
         {
            this.var_1087.push(param1.readInteger());
         }
         return true;
      }
   }
}
