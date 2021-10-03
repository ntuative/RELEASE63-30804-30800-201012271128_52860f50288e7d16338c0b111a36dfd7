package com.sulake.habbo.catalog.club
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.purse.Purse;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   import com.sulake.habbo.catalog.viewer.Offer;
   
   public class ClubBuyOfferData implements IPurchasableOffer
   {
       
      
      private var _offerId:int;
      
      private var var_1627:String;
      
      private var var_1713:int;
      
      private var var_2198:Boolean;
      
      private var var_2201:Boolean;
      
      private var var_2199:int;
      
      private var var_2196:int;
      
      private var var_372:ICatalogPage;
      
      private var var_2200:int;
      
      private var var_2195:int;
      
      private var var_2197:int;
      
      private var var_2406:Boolean = false;
      
      public function ClubBuyOfferData(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:int, param9:int, param10:int)
      {
         super();
         this._offerId = param1;
         this.var_1627 = param2;
         this.var_1713 = param3;
         this.var_2198 = param4;
         this.var_2201 = param5;
         this.var_2199 = param6;
         this.var_2196 = param7;
         this.var_2200 = param8;
         this.var_2195 = param9;
         this.var_2197 = param10;
      }
      
      public function dispose() : void
      {
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get productCode() : String
      {
         return this.var_1627;
      }
      
      public function get price() : int
      {
         return this.var_1713;
      }
      
      public function get upgrade() : Boolean
      {
         return this.var_2198;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2201;
      }
      
      public function get periods() : int
      {
         return this.var_2199;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2196;
      }
      
      public function get year() : int
      {
         return this.var_2200;
      }
      
      public function get month() : int
      {
         return this.var_2195;
      }
      
      public function get day() : int
      {
         return this.var_2197;
      }
      
      public function get priceInActivityPoints() : int
      {
         return 0;
      }
      
      public function get activityPointType() : int
      {
         return Purse.const_418;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1713;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_372;
      }
      
      public function get priceType() : String
      {
         return Offer.const_671;
      }
      
      public function get productContainer() : IProductContainer
      {
         return null;
      }
      
      public function get localizationId() : String
      {
         return this.var_1627;
      }
      
      public function set page(param1:ICatalogPage) : void
      {
         this.var_372 = param1;
      }
      
      public function get upgradeHcPeriodToVip() : Boolean
      {
         return this.var_2406;
      }
      
      public function set upgradeHcPeriodToVip(param1:Boolean) : void
      {
         this.var_2406 = param1;
      }
   }
}
