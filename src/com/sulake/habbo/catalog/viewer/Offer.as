package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_1479:String = "pricing_model_unknown";
      
      public static const const_440:String = "pricing_model_single";
      
      public static const const_460:String = "pricing_model_multi";
      
      public static const const_508:String = "pricing_model_bundle";
      
      public static const const_1471:String = "price_type_none";
      
      public static const const_671:String = "price_type_credits";
      
      public static const const_1055:String = "price_type_activitypoints";
      
      public static const const_1090:String = "price_type_credits_and_activitypoints";
       
      
      private var var_706:String;
      
      private var var_1090:String;
      
      private var _offerId:int;
      
      private var var_1707:String;
      
      private var var_1089:int;
      
      private var var_1091:int;
      
      private var var_1487:int;
      
      private var var_372:ICatalogPage;
      
      private var var_705:IProductContainer;
      
      private var var_2402:int;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         this._offerId = param1.offerId;
         this.var_1707 = param1.localizationId;
         this.var_1089 = param1.priceInCredits;
         this.var_1091 = param1.priceInActivityPoints;
         this.var_1487 = param1.activityPointType;
         this.var_372 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(param1.localizationId);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         this.analyzePricingModel(_loc3_);
         this.analyzePriceType();
         this.createProductContainer(_loc3_);
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_372;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get localizationId() : String
      {
         return this.var_1707;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1089;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1091;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1487;
      }
      
      public function get productContainer() : IProductContainer
      {
         return this.var_705;
      }
      
      public function get pricingModel() : String
      {
         return this.var_706;
      }
      
      public function get priceType() : String
      {
         return this.var_1090;
      }
      
      public function get previewCallbackId() : int
      {
         return this.var_2402;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         this.var_2402 = param1;
      }
      
      public function dispose() : void
      {
         this._offerId = 0;
         this.var_1707 = "";
         this.var_1089 = 0;
         this.var_1091 = 0;
         this.var_1487 = 0;
         this.var_372 = null;
         if(this.var_705 != null)
         {
            this.var_705.dispose();
            this.var_705 = null;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(this.var_706)
         {
            case const_440:
               this.var_705 = new SingleProductContainer(this,param1);
               break;
            case const_460:
               this.var_705 = new MultiProductContainer(this,param1);
               break;
            case const_508:
               this.var_705 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + this.var_706);
         }
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               this.var_706 = const_440;
            }
            else
            {
               this.var_706 = const_460;
            }
         }
         else if(param1.length > 1)
         {
            this.var_706 = const_508;
         }
         else
         {
            this.var_706 = const_1479;
         }
      }
      
      private function analyzePriceType() : void
      {
         if(this.var_1089 > 0 && this.var_1091 > 0)
         {
            this.var_1090 = const_1090;
         }
         else if(this.var_1089 > 0)
         {
            this.var_1090 = const_671;
         }
         else if(this.var_1091 > 0)
         {
            this.var_1090 = const_1055;
         }
         else
         {
            this.var_1090 = const_1471;
         }
      }
   }
}
