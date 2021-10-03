package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1606:int;
      
      private var _name:String;
      
      private var var_1277:int;
      
      private var var_2254:int;
      
      private var var_2092:int;
      
      private var _energy:int;
      
      private var _nutrition:int;
      
      private var var_535:String;
      
      private var var_2257:int;
      
      private var var_2256:int;
      
      private var var_2255:int;
      
      private var var_2089:int;
      
      private var var_2088:int;
      
      private var _ownerName:String;
      
      private var var_479:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1606;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get level() : int
      {
         return this.var_1277;
      }
      
      public function get maxLevel() : int
      {
         return this.var_2254;
      }
      
      public function get experience() : int
      {
         return this.var_2092;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get figure() : String
      {
         return this.var_535;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return this.var_2257;
      }
      
      public function get maxEnergy() : int
      {
         return this.var_2256;
      }
      
      public function get maxNutrition() : int
      {
         return this.var_2255;
      }
      
      public function get respect() : int
      {
         return this.var_2089;
      }
      
      public function get ownerId() : int
      {
         return this.var_2088;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get age() : int
      {
         return this.var_479;
      }
      
      public function flush() : Boolean
      {
         this.var_1606 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1606 = param1.readInteger();
         this._name = param1.readString();
         this.var_1277 = param1.readInteger();
         this.var_2254 = param1.readInteger();
         this.var_2092 = param1.readInteger();
         this.var_2257 = param1.readInteger();
         this._energy = param1.readInteger();
         this.var_2256 = param1.readInteger();
         this._nutrition = param1.readInteger();
         this.var_2255 = param1.readInteger();
         this.var_535 = param1.readString();
         this.var_2089 = param1.readInteger();
         this.var_2088 = param1.readInteger();
         this.var_479 = param1.readInteger();
         this._ownerName = param1.readString();
         return true;
      }
   }
}
