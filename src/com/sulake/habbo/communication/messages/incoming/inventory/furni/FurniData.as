package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_2411:int;
      
      private var var_1381:String;
      
      private var _objId:int;
      
      private var var_1826:int;
      
      private var _category:int;
      
      private var var_1893:String;
      
      private var var_2444:Boolean;
      
      private var var_2447:Boolean;
      
      private var var_2446:Boolean;
      
      private var var_2445:Boolean;
      
      private var var_2008:int;
      
      private var var_1390:int;
      
      private var var_1477:String = "";
      
      private var var_2494:int = -1;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         this.var_2411 = param1;
         this.var_1381 = param2;
         this._objId = param3;
         this.var_1826 = param4;
         this._category = param5;
         this.var_1893 = param6;
         this.var_2444 = param7;
         this.var_2447 = param8;
         this.var_2446 = param9;
         this.var_2445 = param10;
         this.var_2008 = param11;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         this.var_1477 = param1;
         this.var_1390 = param2;
      }
      
      public function get stripId() : int
      {
         return this.var_2411;
      }
      
      public function get itemType() : String
      {
         return this.var_1381;
      }
      
      public function get objId() : int
      {
         return this._objId;
      }
      
      public function get classId() : int
      {
         return this.var_1826;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_1893;
      }
      
      public function get isGroupable() : Boolean
      {
         return this.var_2444;
      }
      
      public function get isRecyclable() : Boolean
      {
         return this.var_2447;
      }
      
      public function get isTradeable() : Boolean
      {
         return this.var_2446;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2445;
      }
      
      public function get expiryTime() : int
      {
         return this.var_2008;
      }
      
      public function get slotId() : String
      {
         return this.var_1477;
      }
      
      public function get songId() : int
      {
         return this.var_2494;
      }
      
      public function get extra() : int
      {
         return this.var_1390;
      }
   }
}
