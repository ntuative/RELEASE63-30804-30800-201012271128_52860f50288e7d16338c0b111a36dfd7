package com.sulake.habbo.session.furniture
{
   public class FurnitureData implements IFurnitureData
   {
      
      public static const const_1814:String = "i";
      
      public static const const_1657:String = "s";
      
      public static const const_1709:String = "e";
       
      
      private var _type:String;
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_2212:int;
      
      private var _revision:int;
      
      private var var_2211:int;
      
      private var var_2210:int;
      
      private var var_2214:int;
      
      private var var_1380:Array;
      
      private var _title:String;
      
      private var var_1469:String;
      
      private var var_2213:String;
      
      private var var_2030:int;
      
      private var _offerId:int;
      
      public function FurnitureData(param1:String, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int, param8:int, param9:Array, param10:String, param11:String, param12:String, param13:int, param14:int)
      {
         super();
         this._type = param1;
         this._id = param2;
         this._name = param3;
         this.var_2212 = param4;
         this._revision = param5;
         this.var_2211 = param6;
         this.var_2210 = param7;
         this.var_2214 = param8;
         this.var_1380 = param9;
         this._title = param10;
         this.var_1469 = param11;
         this.var_2213 = param12;
         this.var_2030 = param13;
         this._offerId = param14;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get colourIndex() : int
      {
         return this.var_2212;
      }
      
      public function get revision() : int
      {
         return this._revision;
      }
      
      public function get tileSizeX() : int
      {
         return this.var_2211;
      }
      
      public function get tileSizeY() : int
      {
         return this.var_2210;
      }
      
      public function get tileSizeZ() : int
      {
         return this.var_2214;
      }
      
      public function get colours() : Array
      {
         return this.var_1380;
      }
      
      public function get title() : String
      {
         return this._title;
      }
      
      public function get description() : String
      {
         return this.var_1469;
      }
      
      public function get adUrl() : String
      {
         return this.var_2213;
      }
      
      public function get catalogPageId() : int
      {
         return this.var_2030;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
   }
}