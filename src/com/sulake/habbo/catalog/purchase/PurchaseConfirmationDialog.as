package com.sulake.habbo.catalog.purchase
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ICheckBoxWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.club.ClubBuyOfferData;
   import com.sulake.habbo.catalog.enum.ProductTypeEnum;
   import com.sulake.habbo.catalog.viewer.IProduct;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.communication.messages.parser.catalog.IsOfferGiftableMessageParser;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.ui.Keyboard;
   
   public class PurchaseConfirmationDialog implements IGetImageListener
   {
       
      
      private var _catalog:HabboCatalog;
      
      private var _localization:ICoreLocalizationManager;
      
      private var var_88:IPurchasableOffer;
      
      private var _pageId:int;
      
      private var _window:IFrameWindow;
      
      private var var_1328:String;
      
      private var var_2674:int = 0;
      
      private var var_2673:Boolean = false;
      
      private var var_200:Array;
      
      private var var_239:IWindowContainer;
      
      private var var_582:IWindowContainer;
      
      private var var_326:int = -1;
      
      private const const_1852:int = 10;
      
      private var var_2310:String = "";
      
      private var var_1650:Boolean;
      
      private var var_1649:Boolean;
      
      private var var_1327:int;
      
      private var var_1552:Array;
      
      private var var_690:Array;
      
      private var var_689:Array;
      
      private var var_325:int;
      
      private var var_327:int;
      
      private var var_1068:int;
      
      private const const_1585:uint = 4.293848814E9;
      
      private const const_1586:uint = 4.294967295E9;
      
      private const const_1851:uint = 4.291613146E9;
      
      public function PurchaseConfirmationDialog(param1:ICoreLocalizationManager)
      {
         this.var_690 = [];
         this.var_689 = [];
         super();
         this._localization = param1;
      }
      
      public function onIsOfferGiftable(param1:IsOfferGiftableMessageParser) : void
      {
         if(this.var_88 == null || this.var_88.offerId != param1.offerId)
         {
            return;
         }
         this.setGiftButtonState(param1.isGiftable);
      }
      
      public function dispose() : void
      {
         this.reset();
      }
      
      private function reset() : void
      {
         this.var_88 = null;
         this._pageId = -1;
         this.var_1328 = "";
         this.var_2674 = 0;
         this.var_2673 = false;
         this.var_200 = null;
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
         this.var_239 = null;
         if(this.var_582 != null)
         {
            this.var_582.dispose();
            this.var_582 = null;
         }
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         if(param1 == this.var_1327)
         {
            this.var_1327 = 0;
            this.setImage(param2,true);
         }
      }
      
      private function setImage(param1:BitmapData, param2:Boolean) : void
      {
         if(this._window == null || param1 == null)
         {
            return;
         }
         var _loc3_:IBitmapWrapperWindow = this._window.findChildByName("product_image") as IBitmapWrapperWindow;
         if(_loc3_ == null)
         {
            return;
         }
         if(_loc3_.bitmap != null)
         {
            _loc3_.bitmap.dispose();
            _loc3_.bitmap = null;
         }
         if(_loc3_.bitmap == null)
         {
            _loc3_.bitmap = new BitmapData(_loc3_.width,_loc3_.height,true,0);
         }
         var _loc4_:int = (_loc3_.width - param1.width) * 0.5;
         var _loc5_:int = (_loc3_.height - param1.height) * 0.5;
         _loc3_.bitmap.draw(param1,new Matrix(1,0,0,1,_loc4_,_loc5_));
         if(param2)
         {
            param1.dispose();
         }
      }
      
      public function showOffer(param1:IHabboCatalog, param2:IPurchasableOffer, param3:int, param4:String = "", param5:Array = null) : void
      {
         this.var_88 = param2;
         this._pageId = param3;
         this._catalog = param1 as HabboCatalog;
         this.var_1328 = param4;
         this.var_200 = param5;
         this.showConfirmationDialog();
      }
      
      private function showConfirmationDialog() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         if(this._catalog == null)
         {
            return;
         }
         if(this._window != null)
         {
            this._window.dispose();
         }
         this.updateLocalizations();
         this._window = this.createWindow("purchase_confirmation") as IFrameWindow;
         if(this._window == null)
         {
            return;
         }
         this._window.procedure = this.confirmationHandler;
         this.setGiftButtonState(false);
         this._window.center();
         var _loc1_:ITextWindow = this._window.findChildByName("product_name") as ITextWindow;
         if(_loc1_ != null)
         {
            _loc3_ = this._catalog.getProductData(this.var_88.localizationId);
            _loc1_.text = _loc3_ == null ? "" : _loc3_.name;
         }
         var _loc2_:IBitmapWrapperWindow = this._window.findChildByName("product_image") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc4_ = this.var_88.page.viewer.roomEngine;
            _loc7_ = 0;
            _loc8_ = "";
            _loc9_ = "";
            if(this.var_88 is Offer)
            {
               _loc10_ = this.var_88.productContainer.firstProduct;
               _loc9_ = _loc10_.productType;
               _loc7_ = _loc10_.productClassId;
               _loc8_ = _loc10_.extraParam;
            }
            else if(this.var_88 is ClubBuyOfferData)
            {
               _loc9_ = "null";
            }
            switch(_loc9_)
            {
               case ProductTypeEnum.const_87:
                  _loc5_ = _loc4_.getFurnitureIcon(_loc7_,this);
                  break;
               case ProductTypeEnum.const_77:
                  _loc5_ = _loc4_.getWallItemIcon(_loc7_,this,_loc8_);
                  break;
               case ProductTypeEnum.const_246:
                  _loc6_ = this._catalog.getPixelEffectIcon(_loc7_);
                  break;
               case ProductTypeEnum.const_359:
                  _loc6_ = this._catalog.getSubscriptionProductIcon(_loc7_);
            }
            if(_loc5_ != null)
            {
               _loc6_ = _loc5_.data;
               this.var_1327 = _loc5_.id;
            }
            this.setImage(_loc6_,true);
         }
      }
      
      private function setGiftButtonState(param1:Boolean) : void
      {
         if(this._window == null)
         {
            return;
         }
         var _loc2_:IButtonWindow = IButtonWindow(this._window.findChildByName("gift_button"));
         if(param1)
         {
            _loc2_.enable();
         }
         else
         {
            _loc2_.disable();
         }
      }
      
      private function updateLocalizations() : void
      {
         var _loc1_:IProductData = this._catalog.getProductData(this.var_88.localizationId);
         var _loc2_:String = _loc1_ == null ? "" : _loc1_.name;
         this._catalog.windowManager.registerLocalizationParameter("catalog.purchase.confirmation.dialog.costs","offer_name",_loc2_);
         var _loc3_:BalanceAndCost = new BalanceAndCost(this._catalog,this._localization,this.var_88);
         this._catalog.windowManager.registerLocalizationParameter("catalog.purchase.confirmation.dialog.costs","price",_loc3_.cost);
         this._catalog.windowManager.registerLocalizationParameter("catalog.purchase.confirmation.dialog.amount","amount",_loc3_.balance);
      }
      
      private function showGiftDialog() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(this._window != null)
         {
            this._window.dispose();
         }
         var _loc1_:GiftWrappingConfiguration = this._catalog.giftWrappingConfiguration;
         var _loc2_:String = !!_loc1_.isEnabled ? "gift_wrapping" : "gift_no_wrapping";
         this._window = this.createWindow(_loc2_) as IFrameWindow;
         if(this._window == null)
         {
            return;
         }
         this._window.center();
         this._window.procedure = this.wrappingHandler;
         _loc3_ = this._window.findChildByName("name_input") as ITextFieldWindow;
         if(_loc3_ != null)
         {
            _loc3_.procedure = this.nameInputHandler;
         }
         _loc3_ = this._window.findChildByName("message_input") as ITextFieldWindow;
         if(_loc3_ != null)
         {
            _loc3_.procedure = this.messageInputHandler;
         }
         this.var_1650 = true;
         this.var_1649 = true;
         if(_loc1_.isEnabled)
         {
            _loc4_ = this._window.findChildByName("use_free_checkbox") as ICheckBoxWindow;
            if(_loc4_ != null)
            {
               _loc4_.procedure = this.checkboxHandler;
            }
            this._localization.registerParameter("catalog.gift_wrapping.price","price",_loc1_.price.toString());
            this.var_1552 = _loc1_.stuffTypes;
            this.var_689 = _loc1_.boxTypes;
            this.var_690 = _loc1_.ribbonTypes;
            this.var_1068 = this.var_1552[0];
            this.var_327 = this.var_689[0];
            this.var_325 = this.var_690[0];
            this.initColorGrid();
            this.updateColorGrid();
            this.updatePreview();
         }
      }
      
      private function updatePreview() : void
      {
         var _loc3_:* = null;
         if(this.var_325 < 0)
         {
            this.var_325 = this.var_690.length - 1;
         }
         if(this.var_325 > this.var_690.length - 1)
         {
            this.var_325 = 0;
         }
         if(this.var_327 < 0)
         {
            this.var_327 = this.var_689.length - 1;
         }
         if(this.var_327 > this.var_689.length - 1)
         {
            this.var_327 = 0;
         }
         var _loc1_:int = this.var_689[this.var_327] * 1000 + this.var_690[this.var_325];
         if(this._window == null)
         {
            return;
         }
         var _loc2_:IRoomEngine = this.var_88.page.viewer.roomEngine;
         _loc3_ = _loc2_.getFurnitureImage(this.var_1068,new Vector3d(180),64,this,_loc1_.toString());
         if(_loc3_ == null)
         {
            return;
         }
         this.var_1327 = _loc3_.id;
         this.setImage(_loc3_.data,true);
         this.showSuggestions(false);
      }
      
      private function initColorGrid() : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:* = 0;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:* = null;
         if(this._window == null)
         {
            return;
         }
         var _loc1_:IItemGridWindow = this._window.findChildByName("color_grid") as IItemGridWindow;
         _loc1_.destroyGridItems();
         var _loc2_:IWindowContainer = this.createWindow("gift_palette_item") as IWindowContainer;
         _loc2_.procedure = this.colorHandler;
         var _loc3_:Array = this.var_1552;
         for each(_loc6_ in _loc3_)
         {
            _loc4_ = this._catalog.getFurnitureData(_loc6_,ProductTypeEnum.const_87);
            _loc5_ = _loc2_.clone() as IWindowContainer;
            if(!(!_loc4_ || !_loc5_))
            {
               _loc7_ = uint(_loc4_.colours[0]);
               _loc8_ = (_loc7_ >> 16 & 255) / 255;
               _loc9_ = (_loc7_ >> 8 & 255) / 255;
               _loc10_ = (_loc7_ & 255) / 255;
               _loc11_ = new ColorTransform(_loc8_,_loc9_,_loc10_);
               this.setBitmapData(_loc5_,"border","ctlg_clr_27x22_1");
               this.setBitmapData(_loc5_,"color","ctlg_clr_27x22_2",_loc11_);
               this.setBitmapData(_loc5_,"selection","ctlg_clr_27x22_3");
               _loc5_.id = _loc6_;
               _loc1_.addGridItem(_loc5_);
            }
         }
      }
      
      private function setBitmapData(param1:IWindowContainer, param2:String, param3:String, param4:ColorTransform = null) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc5_:IBitmapWrapperWindow = param1.findChildByName(param2) as IBitmapWrapperWindow;
         if(_loc5_ == null)
         {
            return;
         }
         var _loc6_:BitmapDataAsset = this._catalog.assets.getAssetByName(param3) as BitmapDataAsset;
         if(_loc6_ == null)
         {
            return;
         }
         var _loc7_:BitmapData = _loc6_.content as BitmapData;
         if(_loc7_ == null)
         {
            return;
         }
         if(_loc5_.bitmap == null)
         {
            _loc5_.bitmap = new BitmapData(_loc5_.width,_loc5_.height,true,0);
         }
         _loc5_.bitmap.draw(_loc7_,null,param4);
      }
      
      private function createWindow(param1:String) : IWindow
      {
         if(this._catalog.windowManager == null || this._catalog.assets == null)
         {
            return null;
         }
         var _loc2_:XmlAsset = this._catalog.assets.getAssetByName(param1) as XmlAsset;
         if(_loc2_ == null || _loc2_.content == null)
         {
            return null;
         }
         return this._catalog.windowManager.buildFromXML(_loc2_.content as XML);
      }
      
      private function giveGift() : void
      {
         var _loc1_:ITextFieldWindow = this._window.findChildByName("name_input") as ITextFieldWindow;
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:String = _loc1_.text;
         var _loc3_:ITextFieldWindow = this._window.findChildByName("message_input") as ITextFieldWindow;
         var _loc4_:String = _loc3_ == null ? "" : _loc3_.text;
         var _loc5_:ICheckBoxWindow = this._window.findChildByName("use_free_checkbox") as ICheckBoxWindow;
         var _loc6_:Boolean = _loc5_ == null ? false : Boolean(_loc5_.isSelected);
         var _loc7_:int = !!_loc6_ ? 0 : int(this.var_1068);
         var _loc8_:int = !!_loc6_ ? 0 : int(this.var_689[this.var_327]);
         var _loc9_:int = !!_loc6_ ? 0 : int(this.var_690[this.var_325]);
         this._catalog.purchaseProductAsGift(this._pageId,this.var_88,this.var_1328,_loc2_,_loc4_,_loc7_,_loc8_,_loc9_);
      }
      
      private function confirmationHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1 == null || param2 == null)
         {
            return;
         }
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         switch(param2.name)
         {
            case "gift_button":
               this.showGiftDialog();
               break;
            case "buy_button":
               this._catalog.purchaseProduct(this._pageId,this.var_88.offerId,this.var_1328);
               this.dispose();
               break;
            case "cancel_button":
            case "header_button_close":
               this.dispose();
         }
      }
      
      private function wrappingHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1 == null || param2 == null)
         {
            return;
         }
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         switch(param2.name)
         {
            case "give_gift_button":
               this.giveGift();
               this.enableGiftButton(false);
               break;
            case "cancel_gifting_button":
            case "header_button_close":
               this.dispose();
               break;
            case "ribbon_prev":
               --this.var_325;
               this.updatePreview();
               break;
            case "ribbon_next":
               ++this.var_325;
               this.updatePreview();
               break;
            case "box_prev":
               --this.var_327;
               this.updatePreview();
               break;
            case "box_next":
               ++this.var_327;
               this.updatePreview();
               break;
            case "use_free_text":
               this.toggleCheckbox();
         }
      }
      
      private function toggleCheckbox() : void
      {
         if(this._window == null)
         {
            return;
         }
         var _loc1_:ICheckBoxWindow = this._window.findChildByName("use_free_checkbox") as ICheckBoxWindow;
         if(_loc1_ == null)
         {
            return;
         }
         if(_loc1_.isSelected)
         {
            _loc1_.unselect();
         }
         else
         {
            _loc1_.select();
         }
      }
      
      private function nameInputHandler(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(param1 == null)
         {
            return;
         }
         switch(param1.type)
         {
            case WindowEvent.const_102:
               _loc3_ = param1.window as ITextFieldWindow;
               if(_loc3_ == null)
               {
                  return;
               }
               if(this.var_2310 == _loc3_.text)
               {
                  return;
               }
               _loc4_ = _loc3_.text.toLowerCase();
               _loc5_ = [];
               for each(_loc7_ in this.var_200)
               {
                  if(_loc7_.toLowerCase().search(_loc4_) != -1)
                  {
                     _loc5_.push(_loc7_);
                  }
                  if(_loc5_.length >= this.const_1852)
                  {
                     break;
                  }
               }
               this.updateSuggestions(_loc5_);
               this.var_2310 = _loc3_.text;
               break;
            case WindowMouseEvent.const_39:
               this.showSuggestions(false);
               if(this.var_1650)
               {
                  _loc3_ = param2 as ITextFieldWindow;
                  if(_loc3_)
                  {
                     _loc3_.text = "";
                     this.var_1650 = false;
                  }
               }
               break;
            case WindowKeyboardEvent.const_321:
               _loc6_ = param1 as WindowKeyboardEvent;
               switch(_loc6_.keyCode)
               {
                  case Keyboard.UP:
                     this.highlightSuggestion(this.var_326 - 1);
                     break;
                  case Keyboard.DOWN:
                     this.highlightSuggestion(this.var_326 + 1);
                     break;
                  case Keyboard.ENTER:
                     this.selectHighlighted();
                     break;
                  case Keyboard.TAB:
                     this.focusMessageField();
               }
         }
      }
      
      private function focusMessageField() : void
      {
         if(this._window == null)
         {
            return;
         }
         var _loc1_:ITextFieldWindow = this._window.findChildByName("message_input") as ITextFieldWindow;
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.visible = true;
         _loc1_.focus();
      }
      
      private function selectHighlighted() : void
      {
         if(this.var_239 == null || !this.var_239.visible)
         {
            return;
         }
         var _loc1_:IItemListWindow = this.var_239.findChildByName("suggestion_list") as IItemListWindow;
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:IWindowContainer = _loc1_.getListItemAt(this.var_326) as IWindowContainer;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:ITextWindow = _loc2_.findChildByName("name_text") as ITextWindow;
         if(_loc3_ == null)
         {
            return;
         }
         this.setReceiverName(_loc3_.text);
         this.showSuggestions(false);
      }
      
      private function showSuggestions(param1:Boolean) : void
      {
         if(this.var_239 == null)
         {
            return;
         }
         this.var_239.visible = param1;
         if(!param1)
         {
            this.showMessageInput(true);
         }
      }
      
      private function showMessageInput(param1:Boolean) : void
      {
         var _loc2_:ITextFieldWindow = this._window.findChildByName("message_input") as ITextFieldWindow;
         if(_loc2_ != null)
         {
            _loc2_.visible = param1;
         }
      }
      
      private function messageInputHandler(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         switch(param1.type)
         {
            case WindowMouseEvent.const_39:
               if(this.var_1649)
               {
                  _loc3_ = param2 as ITextFieldWindow;
                  if(_loc3_)
                  {
                     _loc3_.text = "";
                     this.var_1649 = false;
                  }
               }
               break;
            case WindowEvent.const_175:
               this.showSuggestions(false);
         }
      }
      
      private function checkboxHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1 == null)
         {
            return;
         }
         switch(param1.type)
         {
            case WindowEvent.const_516:
               this.showSelectors(false);
               break;
            case WindowEvent.const_733:
               this.showSelectors(true);
         }
      }
      
      private function showSelectors(param1:Boolean) : void
      {
         if(this._window == null)
         {
            return;
         }
         var _loc2_:IWindowContainer = this._window.findChildByName("mask") as IWindowContainer;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.visible = !param1;
      }
      
      private function updateSuggestions(param1:Array) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(this.var_239 == null)
         {
            this.var_239 = this._window.findChildByName("suggestion_container") as IWindowContainer;
         }
         if(this.var_582 == null)
         {
            this.var_582 = this.createWindow("suggestion_list_item") as IWindowContainer;
            this.var_582.procedure = this.suggestionsEventHandler;
         }
         if(this.var_239 == null || this.var_582 == null)
         {
            return;
         }
         var _loc2_:IItemListWindow = this.var_239.findChildByName("suggestion_list") as IItemListWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.removeListItems();
         if(param1.length == 0)
         {
            this.showSuggestions(false);
            return;
         }
         this.showSuggestions(true);
         var _loc3_:int = 0;
         for each(_loc4_ in param1)
         {
            _loc5_ = this.var_582.clone() as IWindowContainer;
            if(_loc5_ != null)
            {
               _loc6_ = _loc5_.findChildByName("name_text") as ITextWindow;
               if(_loc6_ != null)
               {
                  _loc6_.text = _loc4_;
                  _loc2_.addListItem(_loc5_);
               }
               _loc5_.color = this.getColor(_loc3_);
               _loc3_++;
            }
         }
         this.showMessageInput(param1.length < 2);
         this.highlightSuggestion(0);
      }
      
      private function highlightSuggestion(param1:int) : void
      {
         var _loc3_:* = null;
         if(this.var_239 == null)
         {
            return;
         }
         var _loc2_:IItemListWindow = this.var_239.findChildByName("suggestion_list") as IItemListWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc3_ = _loc2_.getListItemAt(this.var_326) as IWindowContainer;
         if(_loc3_ != null)
         {
            _loc3_.color = this.getColor(this.var_326);
         }
         this.var_326 = param1;
         if(this.var_326 < 0)
         {
            this.var_326 = _loc2_.numListItems - 1;
         }
         if(this.var_326 >= _loc2_.numListItems)
         {
            this.var_326 = 0;
         }
         _loc3_ = _loc2_.getListItemAt(this.var_326) as IWindowContainer;
         if(_loc3_ != null)
         {
            _loc3_.color = this.const_1851;
         }
      }
      
      private function getColor(param1:int) : uint
      {
         return param1 % 2 == 0 ? uint(this.const_1585) : uint(this.const_1586);
      }
      
      private function suggestionsEventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         _loc3_ = param2 as IWindowContainer;
         if(_loc3_ == null)
         {
            return;
         }
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               _loc4_ = _loc3_.findChildByName("name_text") as ITextWindow;
               if(_loc4_ == null)
               {
                  return;
               }
               this.setReceiverName(_loc4_.text);
               this.showSuggestions(false);
               break;
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
               _loc5_ = this.var_239.findChildByName("suggestion_list") as IItemListWindow;
               if(_loc5_ == null)
               {
                  return;
               }
               this.highlightSuggestion(_loc5_.getListItemIndex(_loc3_));
               break;
         }
      }
      
      private function setReceiverName(param1:String) : void
      {
         if(this._window == null)
         {
            return;
         }
         var _loc2_:ITextFieldWindow = this._window.findChildByName("name_input") as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.text = param1;
         this.focusMessageField();
      }
      
      private function colorHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1 == null || param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.var_1068 = param2.id;
         this.updateColorGrid();
         this.updatePreview();
      }
      
      private function updateColorGrid() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this._window == null)
         {
            return;
         }
         var _loc1_:IItemGridWindow = this._window.findChildByName("color_grid") as IItemGridWindow;
         if(_loc1_ == null)
         {
            return;
         }
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_.numGridItems)
         {
            _loc2_ = _loc1_.getGridItemAt(_loc4_) as IWindowContainer;
            if(_loc2_ != null)
            {
               _loc3_ = _loc2_.findChildByName("selection") as IBitmapWrapperWindow;
               if(_loc3_ != null)
               {
                  _loc3_.visible = _loc2_.id == this.var_1068;
               }
            }
            _loc4_++;
         }
      }
      
      public function receiverNotFound() : void
      {
         this.enableGiftButton(true);
         if(!this._catalog || !this._catalog.windowManager)
         {
            return;
         }
         this._catalog.windowManager.alert("${catalog.gift_wrapping.receiver_not_found.title}","${catalog.gift_wrapping.receiver_not_found.info}",0,this.alertHandler);
      }
      
      private function alertHandler(param1:IAlertDialog, param2:Event) : void
      {
         param1.dispose();
         this.enableGiftButton(true);
      }
      
      private function enableGiftButton(param1:Boolean) : void
      {
         if(this._window == null)
         {
            return;
         }
         var _loc2_:IButtonWindow = this._window.findChildByName("give_gift_button") as IButtonWindow;
         if(_loc2_ != null)
         {
            if(param1)
            {
               _loc2_.enable();
            }
            else
            {
               _loc2_.disable();
            }
         }
      }
      
      public function notEnoughCredits() : void
      {
         if(this._window == null)
         {
            return;
         }
         this.enableGiftButton(true);
         var _loc1_:ICheckBoxWindow = this._window.findChildByName("use_free_checkbox") as ICheckBoxWindow;
         if(_loc1_ != null)
         {
            _loc1_.select();
         }
      }
   }
}