package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_1477:int;
      
      private var var_2085:String;
      
      private var var_790:String;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1477 = param1.readInteger();
         this.var_2085 = param1.readString();
         this.var_790 = param1.readString();
      }
      
      public function get slotId() : int
      {
         return this.var_1477;
      }
      
      public function get figureString() : String
      {
         return this.var_2085;
      }
      
      public function get gender() : String
      {
         return this.var_790;
      }
   }
}
