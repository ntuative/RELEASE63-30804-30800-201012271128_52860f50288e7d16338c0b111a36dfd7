package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_2360:int;
      
      private var var_2358:int;
      
      private var var_2359:int;
      
      private var _dayOffsets:Array;
      
      private var var_1679:Array;
      
      private var var_1680:Array;
      
      private var var_2356:int;
      
      private var var_2357:int;
      
      public function MarketplaceItemStats()
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
      
      public function set averagePrice(param1:int) : void
      {
         this.var_2360 = param1;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_2358 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         this.var_2359 = param1;
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         this._dayOffsets = param1.slice();
      }
      
      public function set averagePrices(param1:Array) : void
      {
         this.var_1679 = param1.slice();
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         this.var_1680 = param1.slice();
      }
      
      public function set furniTypeId(param1:int) : void
      {
         this.var_2356 = param1;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         this.var_2357 = param1;
      }
   }
}
