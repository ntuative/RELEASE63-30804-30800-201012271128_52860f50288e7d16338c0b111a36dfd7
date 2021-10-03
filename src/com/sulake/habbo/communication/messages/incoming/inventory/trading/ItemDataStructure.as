package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_1962:int;
      
      private var var_1381:String;
      
      private var var_2484:int;
      
      private var var_2481:int;
      
      private var _category:int;
      
      private var var_1893:String;
      
      private var var_1390:int;
      
      private var var_2485:int;
      
      private var var_2480:int;
      
      private var var_2483:int;
      
      private var var_2482:int;
      
      private var var_2479:Boolean;
      
      private var var_2719:int;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         this.var_1962 = param1;
         this.var_1381 = param2;
         this.var_2484 = param3;
         this.var_2481 = param4;
         this._category = param5;
         this.var_1893 = param6;
         this.var_1390 = param7;
         this.var_2485 = param8;
         this.var_2480 = param9;
         this.var_2483 = param10;
         this.var_2482 = param11;
         this.var_2479 = param12;
      }
      
      public function get itemID() : int
      {
         return this.var_1962;
      }
      
      public function get itemType() : String
      {
         return this.var_1381;
      }
      
      public function get roomItemID() : int
      {
         return this.var_2484;
      }
      
      public function get itemTypeID() : int
      {
         return this.var_2481;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_1893;
      }
      
      public function get extra() : int
      {
         return this.var_1390;
      }
      
      public function get timeToExpiration() : int
      {
         return this.var_2485;
      }
      
      public function get creationDay() : int
      {
         return this.var_2480;
      }
      
      public function get creationMonth() : int
      {
         return this.var_2483;
      }
      
      public function get creationYear() : int
      {
         return this.var_2482;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2479;
      }
      
      public function get songID() : int
      {
         return this.var_1390;
      }
   }
}
