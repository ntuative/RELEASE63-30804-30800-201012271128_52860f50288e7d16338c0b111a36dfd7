package com.sulake.habbo.catalog.purchase
{
   import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;
   
   public class GiftWrappingConfiguration
   {
       
      
      private var var_1216:Boolean = false;
      
      private var var_1713:int;
      
      private var var_1552:Array;
      
      private var var_689:Array;
      
      private var var_690:Array;
      
      public function GiftWrappingConfiguration(param1:GiftWrappingConfigurationEvent)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var _loc2_:GiftWrappingConfigurationParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         this.var_1216 = _loc2_.isWrappingEnabled;
         this.var_1713 = _loc2_.wrappingPrice;
         this.var_1552 = _loc2_.stuffTypes;
         this.var_689 = _loc2_.boxTypes;
         this.var_690 = _loc2_.ribbonTypes;
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1216;
      }
      
      public function get price() : int
      {
         return this.var_1713;
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
   }
}
