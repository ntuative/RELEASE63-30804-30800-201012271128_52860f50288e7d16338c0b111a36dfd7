package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var _offerId:int;
      
      private var var_1627:String;
      
      private var var_1713:int;
      
      private var var_2198:Boolean;
      
      private var var_2201:Boolean;
      
      private var var_2199:int;
      
      private var var_2196:int;
      
      private var var_2200:int;
      
      private var var_2195:int;
      
      private var var_2197:int;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         this._offerId = param1.readInteger();
         this.var_1627 = param1.readString();
         this.var_1713 = param1.readInteger();
         this.var_2198 = param1.readBoolean();
         this.var_2201 = param1.readBoolean();
         this.var_2199 = param1.readInteger();
         this.var_2196 = param1.readInteger();
         this.var_2200 = param1.readInteger();
         this.var_2195 = param1.readInteger();
         this.var_2197 = param1.readInteger();
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
   }
}
