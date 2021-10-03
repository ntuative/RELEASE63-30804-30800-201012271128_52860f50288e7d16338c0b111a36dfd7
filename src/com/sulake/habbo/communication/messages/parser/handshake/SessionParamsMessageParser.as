package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class SessionParamsMessageParser implements IMessageParser
   {
       
      
      protected var var_1902:Boolean;
      
      protected var var_1905:Boolean;
      
      protected var var_2548:String;
      
      protected var var_1901:Boolean;
      
      protected var var_1904:Boolean;
      
      protected var var_1903:Boolean;
      
      protected var _confPartnerIntegration:Boolean;
      
      protected var var_2647:Boolean;
      
      protected var var_2648:String;
      
      protected var var_2649:Boolean;
      
      public function SessionParamsMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_1902 = false;
         this.var_1905 = false;
         this.var_2548 = "";
         this.var_1901 = false;
         this.var_1904 = false;
         this.var_1903 = false;
         this._confPartnerIntegration = false;
         this.var_2647 = false;
         this.var_2648 = "";
         this.var_2649 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc2_:int = param1.readInteger();
         Logger.log("[Parser.SessionParams] Got " + _loc2_ + " pairs");
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readInteger();
            Logger.log("[Parser.SessionParams] Got id: " + _loc4_);
            switch(_loc4_)
            {
               case 0:
                  _loc5_ = param1.readInteger();
                  this.var_1902 = _loc5_ > 0;
                  break;
               case 1:
                  _loc5_ = param1.readInteger();
                  this.var_1905 = _loc5_ > 0;
                  break;
               case 2:
                  _loc5_ = param1.readInteger();
                  this.var_1901 = _loc5_ > 0;
                  break;
               case 3:
                  _loc5_ = param1.readInteger();
                  this.var_1904 = _loc5_ > 0;
                  break;
               case 4:
                  _loc5_ = param1.readInteger();
                  this.var_1903 = _loc5_ > 0;
                  break;
               case 5:
                  _loc6_ = param1.readString();
                  break;
               case 6:
                  _loc5_ = param1.readInteger();
                  break;
               case 7:
                  _loc5_ = param1.readInteger();
                  break;
               case 8:
                  _loc7_ = param1.readString();
                  break;
               case 9:
                  _loc5_ = param1.readInteger();
                  break;
               default:
                  Logger.log("Unknown id: " + _loc4_);
                  break;
            }
            _loc3_++;
         }
         return true;
      }
      
      public function get coppa() : Boolean
      {
         return this.var_1902;
      }
      
      public function get voucher() : Boolean
      {
         return this.var_1905;
      }
      
      public function get parentEmailRequired() : Boolean
      {
         return this.var_1901;
      }
      
      public function get parentEmailRequiredInReRegistration() : Boolean
      {
         return this.var_1904;
      }
      
      public function get allowDirectEmail() : Boolean
      {
         return this.var_1903;
      }
      
      public function get date() : String
      {
         return this.var_2548;
      }
      
      public function get confPartnerIntegration() : Boolean
      {
         return this._confPartnerIntegration;
      }
      
      public function get allowProfileEditing() : Boolean
      {
         return this.var_2647;
      }
      
      public function get tracking_header() : String
      {
         return this.var_2648;
      }
      
      public function get tutorialEnabled() : Boolean
      {
         return this.var_2649;
      }
   }
}
