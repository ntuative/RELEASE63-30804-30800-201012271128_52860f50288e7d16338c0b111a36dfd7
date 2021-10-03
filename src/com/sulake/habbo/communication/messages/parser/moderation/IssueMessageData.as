package com.sulake.habbo.communication.messages.parser.moderation
{
   public class IssueMessageData
   {
      
      public static const const_142:int = 1;
      
      public static const const_374:int = 2;
      
      public static const const_1460:int = 3;
       
      
      private var var_1985:int;
      
      private var _state:int;
      
      private var var_1237:int;
      
      private var _reportedCategoryId:int;
      
      private var var_1515:int;
      
      private var var_2054:int;
      
      private var var_2051:int = 0;
      
      private var var_2050:int;
      
      private var var_2056:String;
      
      private var var_1288:int;
      
      private var var_1584:String;
      
      private var var_2055:int;
      
      private var var_2052:String;
      
      private var _message:String;
      
      private var var_2057:int;
      
      private var var_783:String;
      
      private var var_1768:int;
      
      private var var_2053:String;
      
      private var var_303:int;
      
      private var var_2048:String;
      
      private var var_2049:String;
      
      private var var_1968:int;
      
      private var var_2028:int;
      
      public function IssueMessageData()
      {
         super();
      }
      
      public function get issueId() : int
      {
         return this.var_1985;
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function get categoryId() : int
      {
         return this.var_1237;
      }
      
      public function get reportedCategoryId() : int
      {
         return this._reportedCategoryId;
      }
      
      public function get timeStamp() : int
      {
         return this.var_1515;
      }
      
      public function get priority() : int
      {
         return this.var_2054 + this.var_2051;
      }
      
      public function get reporterUserId() : int
      {
         return this.var_2050;
      }
      
      public function get reporterUserName() : String
      {
         return this.var_2056;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1288;
      }
      
      public function get reportedUserName() : String
      {
         return this.var_1584;
      }
      
      public function get pickerUserId() : int
      {
         return this.var_2055;
      }
      
      public function get pickerUserName() : String
      {
         return this.var_2052;
      }
      
      public function get message() : String
      {
         return this._message;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2057;
      }
      
      public function get roomName() : String
      {
         return this.var_783;
      }
      
      public function get roomType() : int
      {
         return this.var_1768;
      }
      
      public function get flatType() : String
      {
         return this.var_2053;
      }
      
      public function get flatId() : int
      {
         return this.var_303;
      }
      
      public function get flatOwnerName() : String
      {
         return this.var_2048;
      }
      
      public function get roomResources() : String
      {
         return this.var_2049;
      }
      
      public function get unitPort() : int
      {
         return this.var_1968;
      }
      
      public function get worldId() : int
      {
         return this.var_2028;
      }
      
      public function set issueId(param1:int) : void
      {
         this.var_1985 = param1;
      }
      
      public function set state(param1:int) : void
      {
         this._state = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1237 = param1;
      }
      
      public function set reportedCategoryId(param1:int) : void
      {
         this._reportedCategoryId = param1;
      }
      
      public function set timeStamp(param1:int) : void
      {
         this.var_1515 = param1;
      }
      
      public function set priority(param1:int) : void
      {
         this.var_2054 = param1;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         this.var_2051 = param1;
      }
      
      public function set reporterUserId(param1:int) : void
      {
         this.var_2050 = param1;
      }
      
      public function set reporterUserName(param1:String) : void
      {
         this.var_2056 = param1;
      }
      
      public function set reportedUserId(param1:int) : void
      {
         this.var_1288 = param1;
      }
      
      public function set reportedUserName(param1:String) : void
      {
         this.var_1584 = param1;
      }
      
      public function set pickerUserId(param1:int) : void
      {
         this.var_2055 = param1;
      }
      
      public function set pickerUserName(param1:String) : void
      {
         this.var_2052 = param1;
      }
      
      public function set message(param1:String) : void
      {
         this._message = param1;
      }
      
      public function set chatRecordId(param1:int) : void
      {
         this.var_2057 = param1;
      }
      
      public function set roomName(param1:String) : void
      {
         this.var_783 = param1;
      }
      
      public function set roomType(param1:int) : void
      {
         this.var_1768 = param1;
      }
      
      public function set flatType(param1:String) : void
      {
         this.var_2053 = param1;
      }
      
      public function set flatId(param1:int) : void
      {
         this.var_303 = param1;
      }
      
      public function set flatOwnerName(param1:String) : void
      {
         this.var_2048 = param1;
      }
      
      public function set roomResources(param1:String) : void
      {
         this.var_2049 = param1;
      }
      
      public function set unitPort(param1:int) : void
      {
         this.var_1968 = param1;
      }
      
      public function set worldId(param1:int) : void
      {
         this.var_2028 = param1;
      }
      
      public function getOpenTime(param1:int) : String
      {
         var _loc2_:int = (param1 - this.var_1515) / 1000;
         var _loc3_:int = _loc2_ % 60;
         var _loc4_:int = _loc2_ / 60;
         var _loc5_:int = _loc4_ % 60;
         var _loc6_:int = _loc4_ / 60;
         var _loc7_:String = _loc3_ < 10 ? "0" + _loc3_ : "" + _loc3_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         var _loc9_:String = _loc6_ < 10 ? "0" + _loc6_ : "" + _loc6_;
         return _loc9_ + ":" + _loc8_ + ":" + _loc7_;
      }
   }
}
