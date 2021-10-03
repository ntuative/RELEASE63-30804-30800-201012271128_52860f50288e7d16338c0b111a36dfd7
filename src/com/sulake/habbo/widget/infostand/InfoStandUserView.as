package com.sulake.habbo.widget.infostand
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IBorderWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetChangeMottoMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetGetBadgeDetailsMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomTagSearchMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetUserActionMessage;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.ui.Keyboard;
   import flash.utils.getTimer;
   
   public class InfoStandUserView
   {
       
      
      protected var _widget:InfostandWidget;
      
      protected var _window:IItemListWindow;
      
      protected var var_47:IItemListWindow;
      
      protected var var_62:IItemListWindow;
      
      private var var_191:IBorderWindow;
      
      private var var_1124:TagListRenderer;
      
      private var var_117:IBorderWindow;
      
      private var var_2042:int;
      
      private const const_829:int = 5;
      
      private const const_1562:int = 39;
      
      private const const_1560:int = 7829367;
      
      private const const_1561:int = 16777215;
      
      private const const_1832:int = 2000;
      
      public function InfoStandUserView(param1:InfostandWidget, param2:String)
      {
         super();
         this._widget = param1;
         this.createWindow(param2,false);
         this.var_1124 = new TagListRenderer(param1,this.onTagSelected);
      }
      
      public function dispose() : void
      {
         this._widget = null;
         this._window.dispose();
         this._window = null;
         this.var_1124.dispose();
         this.var_1124 = null;
         this.disposeBadgeDetails();
      }
      
      public function get window() : IItemListWindow
      {
         return this._window;
      }
      
      protected function updateWindow() : void
      {
         if(this.var_47 == null || this.var_191 == null || this.var_62 == null)
         {
            return;
         }
         this.var_62.width = this.var_62.scrollableRegion.width;
         this.var_47.height = this.var_47.scrollableRegion.height;
         this.var_191.height = this.var_47.height + 20;
         this._window.width = Math.max(this.var_191.width,this.var_62.width);
         this._window.height = this._window.scrollableRegion.height;
         if(this.var_191.width < this.var_62.width)
         {
            this.var_191.x = this._window.width - this.var_191.width;
            this.var_62.x = 0;
         }
         else
         {
            this.var_62.x = this._window.width - this.var_62.width;
            this.var_191.x = 0;
         }
         this._widget.refreshContainer();
      }
      
      protected function createWindow(param1:String, param2:Boolean) : void
      {
         var _loc5_:* = null;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc3_:XmlAsset = this._widget.assets.getAssetByName("user_view") as XmlAsset;
         this._window = (this._widget.windowManager as ICoreWindowManager).buildFromXML(_loc3_.content as XML) as IItemListWindow;
         if(this._window == null)
         {
            throw new Error("Failed to construct window from XML!");
         }
         this.var_191 = this._window.getListItemByName("info_border") as IBorderWindow;
         this.var_62 = this._window.getListItemByName("button_list") as IItemListWindow;
         var _loc4_:* = [];
         this.var_62.groupListItemsWithTag("CMD_BUTTON",_loc4_,true);
         for each(_loc5_ in _loc4_)
         {
            if(_loc5_.parent)
            {
               _loc5_.parent.width = _loc5_.width;
            }
            _loc5_.addEventListener(WindowEvent.const_44,this.onButtonResized);
         }
         if(this.var_191 != null)
         {
            this.var_47 = this.var_191.findChildByName("infostand_element_list") as IItemListWindow;
         }
         this._window.name = param1;
         var _loc6_:IBitmapWrapperWindow = this.var_191.findChildByName("home_icon") as IBitmapWrapperWindow;
         if(_loc6_ != null && !param2)
         {
            _loc6_.bitmap = new BitmapData(_loc6_.width,_loc6_.height,true,0);
            _loc11_ = this._widget.assets.getAssetByName("icon_home") as BitmapDataAsset;
            _loc12_ = _loc11_.content as BitmapData;
            _loc6_.bitmap = new BitmapData(_loc6_.width,_loc6_.height,true,0);
            _loc6_.bitmap.copyPixels(_loc12_,_loc12_.rect,new Point(0,0));
            _loc6_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onButtonClicked);
         }
         this._widget.mainContainer.addChild(this._window);
         var _loc7_:IWindow = this.var_191.findChildByTag("close");
         if(_loc7_ != null)
         {
            _loc7_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onClose);
         }
         if(this.var_62 != null)
         {
            _loc8_ = 0;
            while(_loc8_ < this.var_62.numListItems)
            {
               _loc13_ = this.var_62.getListItemAt(_loc8_) as IRegionWindow;
               if(_loc13_ != null)
               {
                  _loc9_ = _loc13_.getChildAt(0);
                  _loc9_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onButtonClicked);
               }
               _loc8_++;
            }
         }
         _loc8_ = 0;
         while(_loc8_ < 5)
         {
            _loc10_ = this.var_191.findChildByName("badge_" + _loc8_);
            if(_loc10_ != null)
            {
               _loc10_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.showBadgeInfo);
               _loc10_.addEventListener(WindowMouseEvent.const_25,this.hideBadgeInfo);
            }
            _loc8_++;
         }
         _loc10_ = this.var_191.findChildByName("badge_group");
         if(_loc10_ != null && !param2)
         {
            _loc10_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.selectGroupBadge);
         }
      }
      
      private function selectGroupBadge(param1:WindowMouseEvent) : void
      {
         if(this._widget.userData.groupId < 0)
         {
            return;
         }
         var _loc2_:RoomWidgetGetBadgeDetailsMessage = new RoomWidgetGetBadgeDetailsMessage(this._widget.userData.groupId);
         this._widget.messageListener.processWidgetMessage(_loc2_);
      }
      
      private function showGroupBadgeInfo(param1:WindowMouseEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(this._widget.userData.groupId < 0)
         {
            return;
         }
         this.createBadgeDetails();
         var _loc2_:IBitmapWrapperWindow = param1.window as IBitmapWrapperWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc3_ = this.var_117.getChildByName("name") as ITextWindow;
         if(_loc3_ != null)
         {
            _loc3_.text = "Group Info";
         }
         _loc4_ = this.var_117.getChildByName("description") as ITextWindow;
         if(_loc4_ != null)
         {
            _loc4_.text = "Group Description";
         }
         var _loc5_:Rectangle = new Rectangle();
         _loc2_.getGlobalRectangle(_loc5_);
         this.var_117.x = _loc5_.left - this.var_117.width;
         this.var_117.y = _loc5_.top + (_loc5_.height - this.var_117.height) / 2;
      }
      
      private function hideGroupBadgeInfo(param1:WindowMouseEvent) : void
      {
         this.disposeBadgeDetails();
      }
      
      private function showBadgeInfo(param1:WindowMouseEvent) : void
      {
         var _loc6_:* = null;
         var _loc2_:IBitmapWrapperWindow = param1.window as IBitmapWrapperWindow;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:int = int(_loc2_.name.replace("badge_",""));
         if(_loc3_ < 0)
         {
            return;
         }
         var _loc4_:Array = this._widget.userData.badges;
         if(_loc4_ == null)
         {
            return;
         }
         if(_loc3_ >= _loc4_.length)
         {
            return;
         }
         var _loc5_:String = this._widget.userData.badges[_loc3_];
         if(_loc5_ == null)
         {
            return;
         }
         this.createBadgeDetails();
         _loc6_ = this.var_117.getChildByName("name") as ITextWindow;
         if(_loc6_ != null)
         {
            _loc6_.text = this._widget.localizations.getBadgeName(_loc5_);
         }
         _loc6_ = this.var_117.getChildByName("description") as ITextWindow;
         if(_loc6_ != null)
         {
            _loc6_.text = this._widget.localizations.getBadgeDesc(_loc5_);
         }
         var _loc7_:Rectangle = new Rectangle();
         _loc2_.getGlobalRectangle(_loc7_);
         this.var_117.x = _loc7_.left - this.var_117.width;
         this.var_117.y = _loc7_.top + (_loc7_.height - this.var_117.height) / 2;
      }
      
      private function hideBadgeInfo(param1:WindowMouseEvent) : void
      {
         this.disposeBadgeDetails();
      }
      
      private function createBadgeDetails() : void
      {
         if(this.var_117 != null)
         {
            return;
         }
         var _loc1_:XmlAsset = this._widget.assets.getAssetByName("badge_details") as XmlAsset;
         if(_loc1_ == null)
         {
            return;
         }
         this.var_117 = this._widget.windowManager.buildFromXML(_loc1_.content as XML) as IBorderWindow;
         if(this.var_117 == null)
         {
            throw new Error("Failed to construct window from XML!");
         }
      }
      
      private function disposeBadgeDetails() : void
      {
         if(this.var_117 != null)
         {
            this.var_117.dispose();
            this.var_117 = null;
         }
      }
      
      private function onClose(param1:WindowMouseEvent) : void
      {
         this._widget.close();
      }
      
      public function set name(param1:String) : void
      {
         var _loc2_:ITextWindow = this.var_47.getListItemByName("name_text") as ITextWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.text = param1;
         _loc2_.visible = true;
      }
      
      public function set realName(param1:String) : void
      {
         var _loc2_:ITextWindow = this.var_47.getListItemByName("realname_text") as ITextWindow;
         if(_loc2_ == null)
         {
            return;
         }
         if(param1.length == 0)
         {
            _loc2_.text = "";
         }
         else
         {
            this._widget.localizations.registerParameter("infostand.text.realname","realname",param1);
            _loc2_.text = this._widget.localizations.getKey("infostand.text.realname");
         }
         _loc2_.height = _loc2_.textHeight + this.const_829;
         _loc2_.visible = param1.length > 0;
      }
      
      public function set image(param1:BitmapData) : void
      {
         var _loc2_:IWindowContainer = this.var_47.getListItemByName("image_and_badges_container") as IWindowContainer;
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:IBitmapWrapperWindow = _loc2_.findChildByName("avatar_image") as IBitmapWrapperWindow;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.bitmap = param1;
         _loc3_.width = param1.width;
         _loc3_.height = param1.height;
         _loc3_.invalidate();
      }
      
      public function setMotto(param1:String, param2:Boolean) : void
      {
         var _loc3_:ITextWindow = this.var_47.getListItemByName("motto_text") as ITextWindow;
         var _loc4_:IWindowContainer = this.var_47.getListItemByName("motto_spacer") as IWindowContainer;
         if(_loc3_ == null || _loc4_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            param1 = "";
         }
         if(param2)
         {
            if(param1 == "")
            {
               param1 = this._widget.localizations.getKey("infostand.motto.change");
               _loc3_.textColor = this.const_1560;
            }
            else
            {
               _loc3_.textColor = this.const_1561;
            }
            _loc3_.enable();
         }
         else
         {
            _loc3_.textColor = this.const_1561;
            _loc3_.disable();
         }
         if(this._widget.config.getKey("infostand.motto.change.enabled","1") == "0")
         {
            _loc3_.disable();
         }
         _loc3_.text = param1;
         _loc3_.height = _loc3_.textHeight + this.const_829;
         if(param2)
         {
            _loc3_.addEventListener(WindowKeyboardEvent.const_321,this.onMottoKeyboard);
            _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onMottoClicked);
         }
         else
         {
            _loc3_.removeEventListener(WindowKeyboardEvent.const_321,this.onMottoClicked);
         }
         this.updateWindow();
      }
      
      public function set achievementScore(param1:int) : void
      {
         var _loc2_:ITextWindow = this.var_47.getListItemByName("score_value") as ITextWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.text = String(param1);
      }
      
      public function set carryItem(param1:int) : void
      {
         var _loc6_:* = null;
         var _loc2_:ITextWindow = this.var_47.getListItemByName("handitem_txt") as ITextWindow;
         var _loc3_:IWindowContainer = this.var_47.getListItemByName("handitem_spacer") as IWindowContainer;
         if(_loc2_ == null || _loc3_ == null)
         {
            return;
         }
         if(param1 > 0)
         {
            _loc6_ = this._widget.localizations.getKey("handitem" + param1,"handitem" + param1);
            this._widget.localizations.registerParameter("infostand.text.handitem","item",_loc6_);
         }
         _loc2_.height = _loc2_.textHeight + this.const_829;
         var _loc4_:Boolean = _loc2_.visible;
         var _loc5_:* = param1 > 0;
         _loc2_.visible = _loc5_;
         _loc3_.visible = _loc5_;
         if(_loc5_ != _loc4_)
         {
            this.var_47.arrangeListItems();
         }
         this.updateWindow();
      }
      
      public function set xp(param1:int) : void
      {
         var _loc2_:ITextWindow = this.var_47.getListItemByName("xp_text") as ITextWindow;
         var _loc3_:IWindowContainer = this.var_47.getListItemByName("xp_spacer") as IWindowContainer;
         if(_loc2_ == null || _loc3_ == null)
         {
            return;
         }
         this._widget.localizations.registerParameter("infostand.text.xp","xp",param1.toString());
         _loc2_.height = _loc2_.textHeight + this.const_829;
         var _loc4_:Boolean = _loc2_.visible;
         var _loc5_:* = param1 > 0;
         _loc2_.visible = _loc5_;
         _loc3_.visible = _loc5_;
         if(_loc5_ != _loc4_)
         {
            this.var_47.arrangeListItems();
         }
         this.updateWindow();
      }
      
      public function setTags(param1:Array, param2:Array = null) : void
      {
         var _loc3_:IWindowContainer = this.var_47.getListItemByName("tags_container") as IWindowContainer;
         var _loc4_:IWindowContainer = this.var_47.getListItemByName("tags_spacer") as IWindowContainer;
         if(_loc3_ == null || _loc4_ == null)
         {
            return;
         }
         if(param1.length != 0)
         {
            _loc3_.height = this.var_1124.renderTags(param1,_loc3_,param2);
            _loc4_.height = 1;
         }
         else
         {
            _loc3_.height = 0;
            _loc4_.height = 0;
         }
         this.updateWindow();
      }
      
      public function setBadgeImage(param1:int, param2:BitmapData) : void
      {
         var _loc3_:IWindowContainer = this.var_47.getListItemByName("image_and_badges_container") as IWindowContainer;
         var _loc4_:IBitmapWrapperWindow = _loc3_.findChildByName("badge_" + param1) as IBitmapWrapperWindow;
         if(_loc4_ == null)
         {
            return;
         }
         if(_loc4_.bitmap == null)
         {
            _loc4_.bitmap = new BitmapData(_loc4_.width,_loc4_.height,true,0);
         }
         this.copyToCenter(_loc4_.bitmap,param2);
         _loc4_.invalidate();
      }
      
      public function clearBadges() : void
      {
         var _loc3_:* = null;
         var _loc1_:IWindowContainer = this.var_47.getListItemByName("image_and_badges_container") as IWindowContainer;
         var _loc2_:int = 0;
         while(_loc2_ < 5)
         {
            _loc3_ = _loc1_.findChildByName("badge_" + _loc2_) as IBitmapWrapperWindow;
            if(_loc3_ != null)
            {
               _loc3_.bitmap = new BitmapData(_loc3_.width,_loc3_.height,true,0);
            }
            _loc2_++;
         }
      }
      
      public function clearGroupBadge() : void
      {
         var _loc1_:IWindowContainer = this.var_47.getListItemByName("image_and_badges_container") as IWindowContainer;
         var _loc2_:IBitmapWrapperWindow = _loc1_.findChildByName("badge_group") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc2_.bitmap = new BitmapData(_loc2_.width,_loc2_.height,true,0);
         }
      }
      
      public function setGroupBadgeImage(param1:BitmapData) : void
      {
         var _loc2_:IWindowContainer = this.var_47.getListItemByName("image_and_badges_container") as IWindowContainer;
         var _loc3_:IBitmapWrapperWindow = _loc2_.findChildByName("badge_group") as IBitmapWrapperWindow;
         if(_loc3_ == null)
         {
            return;
         }
         if(_loc3_.bitmap == null)
         {
            _loc3_.bitmap = new BitmapData(_loc3_.width,_loc3_.height,true,0);
         }
         this.copyToCenter(_loc3_.bitmap,param1);
         _loc3_.invalidate();
      }
      
      private function copyToCenter(param1:BitmapData, param2:BitmapData) : void
      {
         param1.fillRect(param1.rect,0);
         var _loc3_:int = (param1.width - param2.width) / 2;
         var _loc4_:int = (param1.height - param2.height) / 2;
         param1.copyPixels(param2,param2.rect,new Point(_loc3_,_loc4_));
      }
      
      private function onTagSelected(param1:WindowMouseEvent) : void
      {
         var _loc2_:ITextWindow = param1.target as ITextWindow;
         if(_loc2_ == null)
         {
            return;
         }
         this._widget.messageListener.processWidgetMessage(new RoomWidgetRoomTagSearchMessage(_loc2_.text));
      }
      
      public function update(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         this.clearBadges();
         this.clearGroupBadge();
         this.setTags([]);
         this.updateInfo(param1);
         this.updateButtons(param1);
      }
      
      protected function updateInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         this.name = param1.name;
         this.setMotto(param1.motto,param1.type == RoomWidgetUserInfoUpdateEvent.const_183);
         this.achievementScore = param1.achievementScore;
         this.carryItem = param1.carryItem;
         this.xp = param1.xp;
         this.image = param1.image;
      }
      
      private function enableButton(param1:String, param2:Boolean = true) : void
      {
         if(this.var_62 == null)
         {
            return;
         }
         var _loc3_:IRegionWindow = this.var_62.getListItemByName(param1) as IRegionWindow;
         var _loc4_:IWindow = _loc3_.getChildAt(0);
         if(_loc4_ != null)
         {
            if(param2)
            {
               _loc4_.enable();
            }
            else
            {
               _loc4_.disable();
            }
         }
      }
      
      protected function showButton(param1:String, param2:Boolean) : void
      {
         if(this.var_62 == null)
         {
            return;
         }
         var _loc3_:IWindow = this.var_62.getListItemByName(param1);
         if(_loc3_ != null)
         {
            _loc3_.visible = param2;
            this.var_62.arrangeListItems();
         }
      }
      
      protected function setButtonTooltip(param1:String, param2:String) : void
      {
         var _loc3_:IRegionWindow = this.var_62.getListItemByName(param1) as IRegionWindow;
         if(_loc3_ != null)
         {
            _loc3_.toolTipCaption = param2;
            _loc3_.toolTipDelay = 100;
         }
      }
      
      protected function updateButtons(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         var _loc2_:Boolean = false;
         if(this.var_62 == null)
         {
            return;
         }
         switch(param1.type)
         {
            case RoomWidgetUserInfoUpdateEvent.const_183:
               this.var_62.visible = false;
               break;
            case RoomWidgetUserInfoUpdateEvent.const_239:
               if(param1.isSpectatorMode)
               {
                  this.var_62.visible = false;
                  break;
               }
               this.enableButton("friend",true);
               this.showButton("friend",param1.canBeAskedAsFriend);
               this.updateRespectButton();
               this.updateIgnoreButton(param1.isIgnored);
               this.showButton("kick",(param1.amIOwner || param1.amIController || param1.amIAnyRoomController) && param1.canBeKicked);
               this.showButton("ban",(param1.amIOwner || param1.amIAnyRoomController) && param1.canBeKicked);
               this.updateRightsButton(param1.amIOwner,param1.hasFlatControl);
               this.enableButton("trade",param1.canTrade);
               this.setTradeButtonTooltip(param1.canTradeReason);
               _loc2_ = false;
               if(this._widget.config != null && this._widget.config.getKey("infostand.report.show","0") == "1")
               {
                  _loc2_ = true;
               }
               this.showButton("report",_loc2_);
               this.var_62.visible = true;
               break;
         }
         if(this._window != null)
         {
            this._window.arrangeListItems();
         }
         this.updateWindow();
      }
      
      private function updateRespectButton() : void
      {
         if(this.var_62 == null)
         {
            return;
         }
         var _loc1_:IWindow = this.var_62.getListItemByName("respect");
         if(_loc1_ == null)
         {
            throw new Error("Respect button not found.");
         }
         var _loc2_:int = this._widget.userData.respectLeft;
         this._widget.localizations.registerParameter("infostand.button.respect","count",_loc2_.toString());
         _loc1_.visible = _loc2_ > 0;
         this.var_62.arrangeListItems();
      }
      
      private function updateIgnoreButton(param1:Boolean) : void
      {
         this.showButton("ignore",!param1);
         this.showButton("unignore",param1);
      }
      
      protected function updateRightsButton(param1:Boolean, param2:Boolean) : void
      {
         if(param1)
         {
            this.showButton("give_rights",!param2);
            this.showButton("remove_rights",param2);
         }
         else
         {
            this.showButton("give_rights",false);
            this.showButton("remove_rights",false);
         }
      }
      
      protected function setTradeButtonTooltip(param1:int) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case RoomWidgetUserInfoUpdateEvent.TRADE_REASON_NO_OWN_RIGHT:
               _loc2_ = "${infostand.button.trade.tooltip.rights}";
               break;
            case RoomWidgetUserInfoUpdateEvent.const_986:
               _loc2_ = "${infostand.button.trade.tooltip.shutdown}";
               break;
            case RoomWidgetUserInfoUpdateEvent.const_1077:
               _loc2_ = "${infostand.button.trade.tooltip.tradingroom}";
               break;
            default:
               _loc2_ = "";
         }
         this.setButtonTooltip("trade",_loc2_);
      }
      
      protected function onMottoKeyboard(param1:WindowKeyboardEvent) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:ITextWindow = this.var_47.getListItemByName("motto_text") as ITextWindow;
         var _loc3_:String = _loc2_.text;
         if(param1.keyCode == Keyboard.ENTER)
         {
            _loc5_ = getTimer();
            if(_loc5_ - this.var_2042 > this.const_1832 && _loc3_ != this._widget.localizations.getKey("infostand.motto.change"))
            {
               _loc6_ = this._widget.userData.userId;
               _loc4_ = new RoomWidgetChangeMottoMessage(_loc3_);
               this._widget.messageListener.processWidgetMessage(_loc4_);
               this.var_2042 = _loc5_;
            }
         }
         else
         {
            _loc2_.textColor = this.const_1560;
            if(_loc3_.length >= this.const_1562)
            {
               _loc2_.text = _loc3_.substring(0,this.const_1562 - 1);
            }
         }
      }
      
      protected function onMottoClicked(param1:WindowMouseEvent) : void
      {
         var _loc2_:ITextWindow = this.var_47.getListItemByName("motto_text") as ITextWindow;
         if(_loc2_.text == this._widget.localizations.getKey("infostand.motto.change"))
         {
            _loc2_.text = "";
         }
      }
      
      protected function onButtonClicked(param1:WindowMouseEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc4_:IWindow = param1.target as IWindow;
         switch(_loc4_.name)
         {
            case "whisper":
               _loc3_ = "null";
               break;
            case "friend":
               _loc4_.disable();
               _loc3_ = "null";
               break;
            case "respect":
               --this._widget.userData.respectLeft;
               this.updateRespectButton();
               _loc3_ = "null";
               break;
            case "ignore":
               this.updateIgnoreButton(true);
               _loc3_ = "null";
               break;
            case "unignore":
               this.updateIgnoreButton(false);
               _loc3_ = "null";
               break;
            case "kick":
               _loc3_ = "null";
               break;
            case "ban":
               _loc3_ = "null";
               break;
            case "give_rights":
               this.updateRightsButton(true,true);
               _loc3_ = "null";
               break;
            case "remove_rights":
               this.updateRightsButton(true,false);
               _loc3_ = "null";
               break;
            case "trade":
               _loc3_ = "null";
               break;
            case "home_icon":
               _loc3_ = "null";
               break;
            case "report":
               _loc3_ = "null";
         }
         if(_loc3_ != null)
         {
            _loc5_ = this._widget.userData.userId;
            _loc2_ = new RoomWidgetUserActionMessage(_loc3_,_loc5_);
            this._widget.messageListener.processWidgetMessage(_loc2_);
         }
         this.updateWindow();
      }
      
      protected function onButtonResized(param1:WindowEvent) : void
      {
         var _loc2_:IWindow = param1.window.parent;
         if(_loc2_ && _loc2_.tags.indexOf("CMD_BUTTON_REGION") > -1)
         {
            _loc2_.width = param1.window.width;
         }
      }
   }
}
