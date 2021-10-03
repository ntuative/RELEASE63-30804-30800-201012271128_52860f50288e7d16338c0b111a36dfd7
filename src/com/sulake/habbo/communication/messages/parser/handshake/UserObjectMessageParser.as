package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_535:String;
      
      private var var_856:String;
      
      private var var_2509:String;
      
      private var var_1571:String;
      
      private var var_2508:int;
      
      private var var_2506:String;
      
      private var var_2507:int;
      
      private var var_2505:int;
      
      private var var_2260:int;
      
      private var _respectLeft:int;
      
      private var var_694:int;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_535 = param1.readString();
         this.var_856 = param1.readString();
         this.var_2509 = param1.readString();
         this.var_1571 = param1.readString();
         this.var_2508 = param1.readInteger();
         this.var_2506 = param1.readString();
         this.var_2507 = param1.readInteger();
         this.var_2505 = param1.readInteger();
         this.var_2260 = param1.readInteger();
         this._respectLeft = param1.readInteger();
         this.var_694 = param1.readInteger();
         return true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get figure() : String
      {
         return this.var_535;
      }
      
      public function get sex() : String
      {
         return this.var_856;
      }
      
      public function get customData() : String
      {
         return this.var_2509;
      }
      
      public function get realName() : String
      {
         return this.var_1571;
      }
      
      public function get tickets() : int
      {
         return this.var_2508;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2506;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2507;
      }
      
      public function get directMail() : int
      {
         return this.var_2505;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2260;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_694;
      }
   }
}
