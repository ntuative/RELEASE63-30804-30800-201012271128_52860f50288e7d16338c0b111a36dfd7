package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_914:BigInteger;
      
      private var var_2398:BigInteger;
      
      private var var_1728:BigInteger;
      
      private var var_2430:BigInteger;
      
      private var var_1373:BigInteger;
      
      private var var_1729:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1373 = param1;
         this.var_1729 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1373.toString() + ",generator: " + this.var_1729.toString() + ",secret: " + param1);
         this.var_914 = new BigInteger();
         this.var_914.fromRadix(param1,param2);
         this.var_2398 = this.var_1729.modPow(this.var_914,this.var_1373);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_1728 = new BigInteger();
         this.var_1728.fromRadix(param1,param2);
         this.var_2430 = this.var_1728.modPow(this.var_914,this.var_1373);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_2398.toRadix(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_2430.toRadix(param1);
      }
   }
}
