package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class GiftWrappingConfigurationParser implements IMessageParser
   {
       
      
      private var var_2158:Boolean;
      
      private var var_2157:int;
      
      private var var_1552:Array;
      
      private var var_689:Array;
      
      private var var_690:Array;
      
      public function GiftWrappingConfigurationParser()
      {
         super();
      }
      
      public function get isWrappingEnabled() : Boolean
      {
         return this.var_2158;
      }
      
      public function get wrappingPrice() : int
      {
         return this.var_2157;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_1552;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_689;
      }
      
      public function get ribbonTypes() : Array
      {
         return this.var_690;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         this.var_1552 = [];
         this.var_689 = [];
         this.var_690 = [];
         this.var_2158 = param1.readBoolean();
         this.var_2157 = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_1552.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_689.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_690.push(param1.readInteger());
            _loc2_++;
         }
         return true;
      }
   }
}
