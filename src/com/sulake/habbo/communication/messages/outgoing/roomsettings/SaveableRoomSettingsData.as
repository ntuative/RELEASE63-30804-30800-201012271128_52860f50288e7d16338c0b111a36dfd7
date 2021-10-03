package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
   public class SaveableRoomSettingsData
   {
       
      
      private var _roomId:int;
      
      private var _name:String;
      
      private var var_1469:String;
      
      private var var_1943:int;
      
      private var _password:String;
      
      private var var_1237:int;
      
      private var var_1938:int;
      
      private var var_770:Array;
      
      private var var_1941:Array;
      
      private var var_1942:Boolean;
      
      private var var_1944:Boolean;
      
      private var var_1939:Boolean;
      
      private var var_1940:Boolean;
      
      public function SaveableRoomSettingsData()
      {
         super();
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_1942;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         this.var_1942 = param1;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return this.var_1944;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         this.var_1944 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return this.var_1939;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         this.var_1939 = param1;
      }
      
      public function get hideWalls() : Boolean
      {
         return this.var_1940;
      }
      
      public function set hideWalls(param1:Boolean) : void
      {
         this.var_1940 = param1;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function set roomId(param1:int) : void
      {
         this._roomId = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get description() : String
      {
         return this.var_1469;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1469 = param1;
      }
      
      public function get doorMode() : int
      {
         return this.var_1943;
      }
      
      public function set doorMode(param1:int) : void
      {
         this.var_1943 = param1;
      }
      
      public function get password() : String
      {
         return this._password;
      }
      
      public function set password(param1:String) : void
      {
         this._password = param1;
      }
      
      public function get categoryId() : int
      {
         return this.var_1237;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1237 = param1;
      }
      
      public function get maximumVisitors() : int
      {
         return this.var_1938;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         this.var_1938 = param1;
      }
      
      public function get tags() : Array
      {
         return this.var_770;
      }
      
      public function set tags(param1:Array) : void
      {
         this.var_770 = param1;
      }
      
      public function get controllers() : Array
      {
         return this.var_1941;
      }
      
      public function set controllers(param1:Array) : void
      {
         this.var_1941 = param1;
      }
   }
}
