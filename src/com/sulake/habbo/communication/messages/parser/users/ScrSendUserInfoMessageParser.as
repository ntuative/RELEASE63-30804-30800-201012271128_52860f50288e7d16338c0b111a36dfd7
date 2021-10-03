package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_1730:int = 1;
      
      public static const const_1411:int = 2;
       
      
      private var var_854:String;
      
      private var var_2441:int;
      
      private var var_2443:int;
      
      private var var_2438:int;
      
      private var var_2439:int;
      
      private var var_2442:Boolean;
      
      private var var_2351:Boolean;
      
      private var var_2350:int;
      
      private var var_2352:int;
      
      private var var_2440:Boolean;
      
      private var var_2437:int;
      
      private var var_2436:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_854 = param1.readString();
         this.var_2441 = param1.readInteger();
         this.var_2443 = param1.readInteger();
         this.var_2438 = param1.readInteger();
         this.var_2439 = param1.readInteger();
         this.var_2442 = param1.readBoolean();
         this.var_2351 = param1.readBoolean();
         this.var_2350 = param1.readInteger();
         this.var_2352 = param1.readInteger();
         this.var_2440 = param1.readBoolean();
         this.var_2437 = param1.readInteger();
         this.var_2436 = param1.readInteger();
         return true;
      }
      
      public function get productName() : String
      {
         return this.var_854;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return this.var_2441;
      }
      
      public function get memberPeriods() : int
      {
         return this.var_2443;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return this.var_2438;
      }
      
      public function get responseType() : int
      {
         return this.var_2439;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return this.var_2442;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2351;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2350;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2352;
      }
      
      public function get isShowBasicPromo() : Boolean
      {
         return this.var_2440;
      }
      
      public function get basicNormalPrice() : int
      {
         return this.var_2437;
      }
      
      public function get basicPromoPrice() : int
      {
         return this.var_2436;
      }
   }
}
