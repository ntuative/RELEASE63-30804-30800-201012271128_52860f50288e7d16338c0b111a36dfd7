package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var _offerId:int;
      
      private var _furniId:int;
      
      private var var_2583:int;
      
      private var var_1893:String;
      
      private var var_1713:int;
      
      private var _status:int;
      
      private var var_2582:int = -1;
      
      private var var_2360:int;
      
      private var var_1866:int;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int, param9:int = -1)
      {
         super();
         this._offerId = param1;
         this._furniId = param2;
         this.var_2583 = param3;
         this.var_1893 = param4;
         this.var_1713 = param5;
         this._status = param6;
         this.var_2582 = param7;
         this.var_2360 = param8;
         this.var_1866 = param9;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get furniType() : int
      {
         return this.var_2583;
      }
      
      public function get stuffData() : String
      {
         return this.var_1893;
      }
      
      public function get price() : int
      {
         return this.var_1713;
      }
      
      public function get status() : int
      {
         return this._status;
      }
      
      public function get timeLeftMinutes() : int
      {
         return this.var_2582;
      }
      
      public function get averagePrice() : int
      {
         return this.var_2360;
      }
      
      public function get offerCount() : int
      {
         return this.var_1866;
      }
   }
}
