package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_2360:int;
      
      private var var_2358:int;
      
      private var var_2359:int;
      
      private var _dayOffsets:Array;
      
      private var var_1679:Array;
      
      private var var_1680:Array;
      
      private var var_2356:int;
      
      private var var_2357:int;
      
      public function MarketplaceItemStatsParser()
      {
         super();
      }
      
      public function get averagePrice() : int
      {
         return this.var_2360;
      }
      
      public function get offerCount() : int
      {
         return this.var_2358;
      }
      
      public function get historyLength() : int
      {
         return this.var_2359;
      }
      
      public function get dayOffsets() : Array
      {
         return this._dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return this.var_1679;
      }
      
      public function get soldAmounts() : Array
      {
         return this.var_1680;
      }
      
      public function get furniTypeId() : int
      {
         return this.var_2356;
      }
      
      public function get furniCategoryId() : int
      {
         return this.var_2357;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2360 = param1.readInteger();
         this.var_2358 = param1.readInteger();
         this.var_2359 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this._dayOffsets = [];
         this.var_1679 = [];
         this.var_1680 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this._dayOffsets.push(param1.readInteger());
            this.var_1679.push(param1.readInteger());
            this.var_1680.push(param1.readInteger());
            _loc3_++;
         }
         this.var_2357 = param1.readInteger();
         this.var_2356 = param1.readInteger();
         return true;
      }
   }
}
