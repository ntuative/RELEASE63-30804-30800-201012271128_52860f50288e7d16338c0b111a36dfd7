package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1654:int = 0;
      
      public static const const_1527:int = 1;
      
      public static const const_1372:int = 2;
      
      public static const const_1612:int = 3;
      
      public static const const_1723:int = 4;
      
      public static const const_1776:int = 5;
      
      public static const const_1445:int = 10;
      
      public static const const_1764:int = 11;
      
      public static const const_1782:int = 12;
      
      public static const const_1780:int = 13;
      
      public static const const_1827:int = 16;
      
      public static const const_1710:int = 17;
      
      public static const const_1618:int = 18;
      
      public static const const_1602:int = 19;
      
      public static const const_1695:int = 20;
      
      public static const const_1742:int = 22;
      
      public static const const_1675:int = 23;
      
      public static const const_1632:int = 24;
      
      public static const const_1717:int = 25;
      
      public static const const_1739:int = 26;
      
      public static const const_1759:int = 27;
      
      public static const const_1720:int = 28;
      
      public static const const_1701:int = 29;
      
      public static const const_1743:int = 100;
      
      public static const const_1760:int = 101;
      
      public static const const_1633:int = 102;
      
      public static const const_1813:int = 103;
      
      public static const const_1653:int = 104;
      
      public static const const_1825:int = 105;
      
      public static const const_1796:int = 106;
      
      public static const const_1812:int = 107;
      
      public static const const_1750:int = 108;
      
      public static const const_1610:int = 109;
      
      public static const const_1785:int = 110;
      
      public static const const_1619:int = 111;
      
      public static const const_1627:int = 112;
      
      public static const const_1724:int = 113;
      
      public static const const_1788:int = 114;
      
      public static const const_1702:int = 115;
      
      public static const const_1746:int = 116;
      
      public static const const_1628:int = 117;
      
      public static const const_1737:int = 118;
      
      public static const const_1698:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(this.reason)
         {
            case const_1527:
            case const_1445:
               return "banned";
            case const_1372:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
