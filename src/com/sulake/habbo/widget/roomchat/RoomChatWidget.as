package com.sulake.habbo.widget.roomchat
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetChatUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomViewUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetChatSelectAvatarMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getTimer;
   
   public class RoomChatWidget extends RoomWidgetBase implements IUpdateReceiver
   {
      
      private static const const_101:int = 18;
      
      private static const const_1225:int = 9;
      
      private static const const_881:int = 10;
      
      private static const const_557:int = 25;
      
      private static const const_1142:int = 25;
      
      private static const const_882:int = 4000;
      
      private static const const_1228:int = 6000;
      
      private static const const_1226:int = 3;
      
      private static const const_1227:int = 1;
      
      private static const const_556:int = 8;
      
      private static const const_393:int = 0;
      
      private static const const_880:int = (const_556 + const_393) * const_101 + const_101;
      
      private static const const_392:int = 9;
       
      
      private var var_1132:int = 0;
      
      private var var_911:int = 0;
      
      private var var_34:IWindowContainer;
      
      private var var_341:IItemListWindow;
      
      private var var_111:IWindowContainer;
      
      private var _itemList:Array;
      
      private var var_65:Array;
      
      private var var_247:Array;
      
      private var var_2540:int;
      
      private var var_2538:int = 0;
      
      private var var_744:Number = 1;
      
      private var var_2539:String;
      
      private var var_912:Number = 1;
      
      private var var_1814:Number = 0;
      
      private var var_745:Point;
      
      private var var_26:RoomChatHistoryViewer;
      
      private var var_868:Boolean = false;
      
      private var var_1815:Boolean = false;
      
      private var _component:Component = null;
      
      private var _disposed:Boolean = false;
      
      private var var_2537:int = 150;
      
      private var var_208:int = 171.0;
      
      private var var_910:int = 18;
      
      public function RoomChatWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IHabboConfigurationManager, param5:int, param6:Component)
      {
         this._itemList = new Array();
         this.var_65 = new Array();
         this.var_247 = new Array();
         this.var_745 = new Point();
         super(param1,param2,param3);
         this.var_2540 = param5;
         this.var_34 = param1.createWindow("chat_container","",HabboWindowType.const_55,HabboWindowStyle.const_34,HabboWindowParam.const_37,new Rectangle(0,0,200,this.var_208 + RoomChatHistoryPulldown.const_79),null,0) as IWindowContainer;
         this.var_34.background = true;
         this.var_34.color = 33554431;
         this.var_34.tags.push("room_widget_chat");
         this.var_341 = param1.createWindow("chat_contentlist","",HabboWindowType.const_1009,HabboWindowStyle.const_37,0 | 0,new Rectangle(0,0,200,this.var_208),null,0) as IItemListWindow;
         this.var_34.addChild(this.var_341);
         this.var_111 = param1.createWindow("chat_active_content","",HabboWindowType.const_55,HabboWindowStyle.const_37,HabboWindowParam.const_58,new Rectangle(0,0,200,this.var_208),null,0) as IWindowContainer;
         this.var_111.clipping = false;
         this.var_341.addListItem(this.var_111);
         this.var_26 = new RoomChatHistoryViewer(this,param1,this.var_34,param2);
         this.var_2539 = param4.getKey("site.url");
         this.var_2537 = int(param4.getKey("chat.history.item.max.count","150"));
         var _loc7_:Boolean = int(param4.getKey("chat.history.disabled","0")) == 1 ? true : false;
         if(this.var_26 != null)
         {
            this.var_26.disabled = _loc7_;
         }
         if(param6 != null)
         {
            this._component = param6;
            this._component.registerUpdateReceiver(this,1);
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      override public function get mainWindow() : IWindow
      {
         return this.var_34;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(this._disposed)
         {
            return;
         }
         while(this.var_247.length > 0)
         {
            _loc1_ = this.var_247.shift();
         }
         this.var_26.dispose();
         this.var_26 = null;
         while(this._itemList.length > 0)
         {
            _loc1_ = this._itemList.shift();
            _loc1_.dispose();
         }
         while(this.var_65.length > 0)
         {
            _loc1_ = this.var_65.shift();
            _loc1_.dispose();
         }
         this.var_34.dispose();
         if(this._component != null)
         {
            this._component.removeUpdateReceiver(this);
            this._component = null;
         }
         super.dispose();
         this._disposed = true;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:int = 0;
         if(getTimer() > this.var_1132 && this.var_1132 > 0)
         {
            this.var_1132 = -1;
            this.animationStart();
         }
         if(this.var_868)
         {
            _loc2_ = param1 / const_1142 * const_1226;
            if(_loc2_ + this.var_911 > this.var_910)
            {
               _loc2_ = this.var_910 - this.var_911;
            }
            if(_loc2_ > 0)
            {
               this.moveItemsUp(_loc2_);
               this.var_911 += _loc2_;
            }
            if(this.var_911 >= this.var_910)
            {
               this.var_910 = const_101;
               this.var_911 = 0;
               this.animationStop();
               this.processBuffer();
               this.var_1132 = getTimer() + const_882;
            }
         }
         if(this.var_26 != null)
         {
            this.var_26.update(param1);
         }
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetChatUpdateEvent.const_739,this.onChatMessage);
         param1.addEventListener(RoomWidgetRoomViewUpdateEvent.const_287,this.onRoomViewUpdate);
         param1.addEventListener(RoomWidgetRoomViewUpdateEvent.const_621,this.onRoomViewUpdate);
         param1.addEventListener(RoomWidgetRoomViewUpdateEvent.const_610,this.onRoomViewUpdate);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetChatUpdateEvent.const_739,this.onChatMessage);
         param1.removeEventListener(RoomWidgetRoomViewUpdateEvent.const_287,this.onRoomViewUpdate);
         param1.removeEventListener(RoomWidgetRoomViewUpdateEvent.const_621,this.onRoomViewUpdate);
         param1.removeEventListener(RoomWidgetRoomViewUpdateEvent.const_610,this.onRoomViewUpdate);
      }
      
      private function onChatMessage(param1:RoomWidgetChatUpdateEvent) : void
      {
         var _loc2_:RoomChatItem = new RoomChatItem(this,windowManager,assets,this.getFreeItemId(),localizations,this.var_2539);
         _loc2_.define(param1);
         if(this.var_912 != 1)
         {
            _loc2_.senderX /= this.var_912;
         }
         _loc2_.senderX -= this.var_745.x;
         this.setChatItemLocHorizontal(_loc2_);
         this.var_65.push(_loc2_);
         this.processBuffer();
      }
      
      private function onRoomViewUpdate(param1:RoomWidgetRoomViewUpdateEvent) : void
      {
         var _loc2_:Rectangle = param1.rect;
         if(param1.scale > 0)
         {
            if(this.var_1814 == 0)
            {
               this.var_1814 = param1.scale;
            }
            else
            {
               this.var_912 = param1.scale / this.var_1814;
            }
         }
         if(param1.positionDelta != null)
         {
            this.var_745.x += param1.positionDelta.x / this.var_912;
            this.var_745.y += param1.positionDelta.y / this.var_912;
         }
         if(param1.rect != null)
         {
            if(this.var_26 == null)
            {
               return;
            }
            this.var_34.width = _loc2_.width;
            this.var_34.height = this.var_208 + this.var_26.pulldownBarHeight;
            this.var_341.width = this.var_34.width - this.var_26.scrollbarWidth;
            this.var_341.height = this.var_208;
            this.var_341.x = this.var_34.x;
            this.var_341.y = this.var_34.y;
            this.var_111.width = this.var_34.width - this.var_26.scrollbarWidth;
            this.var_111.height = this.var_208;
            if(this.historyViewerActive())
            {
               this.reAlignItemsToHistoryContent();
            }
            this.var_26.containerResized(this.var_34.rectangle,true);
         }
         this.alignItems();
      }
      
      private function processBuffer() : void
      {
         if(this.var_868)
         {
            return;
         }
         if(this.var_65.length == 0)
         {
            return;
         }
         while(this.var_65.length > const_1227 || this.historyViewerActive() && this.var_65.length > 0)
         {
            this.activateItemFromBuffer();
         }
         var _loc1_:Boolean = false;
         if(this._itemList.length == 0)
         {
            _loc1_ = true;
         }
         else
         {
            _loc1_ = this.checkLastItemAllowsAdding(this.var_65[0]);
         }
         if(_loc1_)
         {
            this.activateItemFromBuffer();
            this.var_1132 = getTimer() + const_882;
         }
         else
         {
            if(this._itemList.length > 0 && this.var_65.length > 0)
            {
               this.var_910 = this.getItemSpacing(this._itemList[this._itemList.length - 1],this.var_65[0]);
            }
            else
            {
               this.var_910 = const_101;
            }
            this.animationStart();
         }
      }
      
      private function activateItemFromBuffer() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         if(this.var_65.length == 0)
         {
            return;
         }
         if(this.historyViewerMinimized())
         {
            this.resetArea();
            this.hideHistoryViewer();
         }
         if(!this.checkLastItemAllowsAdding(this.var_65[0]))
         {
            this.selectItemsToMove();
            this.moveItemsUp(this.getItemSpacing(this._itemList[this._itemList.length - 1],this.var_65[0]));
            if(!this.checkLastItemAllowsAdding(this.var_65[0]))
            {
               this.var_111.height += const_101;
               if(this.var_26 != null)
               {
                  this.var_26.containerResized(this.var_34.rectangle);
               }
            }
         }
         _loc1_ = this.var_65.shift();
         if(_loc1_ != null)
         {
            _loc1_.renderView();
            _loc2_ = _loc1_.view;
            if(_loc2_ != null)
            {
               this.var_111.addChild(_loc2_);
               _loc1_.timeStamp = new Date().time;
               this._itemList.push(_loc1_);
               _loc3_ = 0;
               if(this._itemList.length > 1)
               {
                  _loc3_ = this._itemList[this._itemList.length - 2].screenLevel;
                  if(this.historyViewerActive())
                  {
                     _loc1_.screenLevel = _loc3_ + 1;
                  }
                  else
                  {
                     _loc1_.screenLevel = _loc3_ + Math.max(this.var_744,1);
                  }
               }
               else
               {
                  _loc1_.screenLevel = 100;
               }
               _loc1_.aboveLevels = this.var_744;
               if(_loc1_.aboveLevels > const_556 + const_393 + 2)
               {
                  _loc1_.aboveLevels = const_556 + const_393 + 2;
               }
               this.var_744 = 0;
               this.setChatItemLocHorizontal(_loc1_);
               this.setChatItemLocVertical(_loc1_);
               this.setChatItemRenderable(_loc1_);
            }
         }
      }
      
      private function checkLastItemAllowsAdding(param1:RoomChatItem) : Boolean
      {
         if(this._itemList.length == 0)
         {
            return true;
         }
         var _loc2_:RoomChatItem = this._itemList[this._itemList.length - 1];
         if(param1 == null || _loc2_ == null)
         {
            return false;
         }
         if(_loc2_.view == null)
         {
            return true;
         }
         if(this.var_111.rectangle.bottom - (this.var_111.y + _loc2_.y + _loc2_.height) <= this.getItemSpacing(_loc2_,param1))
         {
            return false;
         }
         return true;
      }
      
      private function alignItems() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(this.var_26 == null)
         {
            return;
         }
         _loc1_ = this._itemList.length - 1;
         while(_loc1_ >= 0)
         {
            _loc2_ = this._itemList[_loc1_];
            if(_loc2_ != null)
            {
               this.setChatItemLocHorizontal(_loc2_);
               this.setChatItemLocVertical(_loc2_);
            }
            _loc1_--;
         }
         _loc1_ = 0;
         while(_loc1_ < this._itemList.length)
         {
            _loc2_ = this._itemList[_loc1_];
            if(_loc2_ != null)
            {
               this.setChatItemRenderable(_loc2_);
            }
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.var_65.length)
         {
            _loc2_ = this.var_65[_loc1_];
            if(_loc2_ != null)
            {
               this.setChatItemLocHorizontal(_loc2_);
            }
            _loc1_++;
         }
      }
      
      private function animationStart() : void
      {
         if(this.var_868)
         {
            return;
         }
         this.selectItemsToMove();
         this.var_868 = true;
      }
      
      private function animationStop() : void
      {
         this.var_868 = false;
      }
      
      private function selectItemsToMove() : void
      {
         var _loc4_:* = null;
         if(this.var_868)
         {
            return;
         }
         this.purgeItems();
         this.var_247 = new Array();
         var _loc1_:int = new Date().time;
         var _loc2_:int = 0;
         if(this._itemList.length == 0)
         {
            this.var_744 = 1;
            return;
         }
         if(this.historyViewerActive())
         {
            return;
         }
         ++this.var_744;
         var _loc3_:int = this._itemList.length - 1;
         while(_loc3_ >= 0)
         {
            _loc4_ = this._itemList[_loc3_];
            if(_loc4_.view != null)
            {
               if(_loc4_.screenLevel > const_393 || _loc4_.screenLevel == _loc2_ - 1 || _loc1_ - _loc4_.timeStamp >= const_1228)
               {
                  _loc4_.timeStamp = _loc1_;
                  _loc2_ = _loc4_.screenLevel;
                  --_loc4_.screenLevel;
                  this.var_247.push(_loc4_);
               }
            }
            _loc3_--;
         }
      }
      
      private function moveItemsUp(param1:int) : void
      {
         var _loc3_:Boolean = false;
         if(this.var_247 == null)
         {
            return;
         }
         if(this.var_247.length == 0)
         {
            return;
         }
         var _loc2_:* = null;
         var _loc4_:int = -1;
         var _loc5_:int = this.var_247.length - 1;
         while(_loc5_ >= 0)
         {
            _loc2_ = this.var_247[_loc5_];
            if(_loc2_ != null)
            {
               if(_loc4_ == -1)
               {
                  _loc4_ = this._itemList.indexOf(_loc2_);
               }
               else
               {
                  _loc4_++;
               }
               _loc3_ = true;
               if(this.historyViewerActive())
               {
                  if(_loc2_.y - param1 + _loc2_.height < 0)
                  {
                     _loc3_ = false;
                  }
               }
               if(_loc4_ > 0)
               {
                  if(this._itemList[_loc4_ - 1].view != null)
                  {
                     if(_loc2_.y - param1 - this._itemList[_loc4_ - 1].y < this.getItemSpacing(this._itemList[_loc4_ - 1],_loc2_))
                     {
                        _loc3_ = false;
                     }
                  }
               }
               if(_loc3_)
               {
                  _loc2_.y -= param1;
               }
            }
            _loc5_--;
         }
      }
      
      private function setChatItemLocHorizontal(param1:RoomChatItem) : void
      {
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         if(param1 == null || this.var_26 == null)
         {
            return;
         }
         var _loc2_:Number = (param1.senderX + this.var_745.x) * this.var_912;
         var _loc3_:Number = _loc2_ - param1.width / 2;
         var _loc4_:Number = _loc3_ + param1.width;
         var _loc5_:Number = -this.var_34.width / 2 - const_881;
         var _loc6_:Number = this.var_34.width / 2 + const_881 - this.var_26.scrollbarWidth;
         var _loc7_:Boolean = _loc3_ >= _loc5_ && _loc3_ <= _loc6_;
         var _loc8_:Boolean = _loc4_ >= _loc5_ && _loc4_ <= _loc6_;
         if(_loc7_ && _loc8_)
         {
            _loc9_ = _loc3_;
            _loc10_ = _loc9_;
         }
         else if(_loc2_ >= 0)
         {
            _loc9_ = _loc6_ - param1.width;
         }
         else
         {
            _loc9_ = _loc5_;
         }
         param1.x = _loc9_ + this.var_34.width / 2 + this.var_34.x;
         if(_loc2_ < _loc5_ || _loc2_ > _loc6_)
         {
            param1.hidePointer();
         }
         else
         {
            param1.setPointerOffset(_loc3_ - _loc9_);
         }
      }
      
      private function setChatItemLocVertical(param1:RoomChatItem) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(param1 != null)
         {
            _loc2_ = this._itemList.indexOf(param1);
            _loc3_ = !!this.historyViewerActive() ? 0 : Number(this.var_744);
            if(_loc2_ == this._itemList.length - 1)
            {
               param1.y = this.getAreaBottom() - (_loc3_ + 1) * const_101 - const_392;
            }
            else
            {
               _loc4_ = this._itemList[_loc2_ + 1].aboveLevels;
               if(_loc4_ < 2)
               {
                  param1.y = this._itemList[_loc2_ + 1].y - this.getItemSpacing(param1,this._itemList[_loc2_ + 1]);
               }
               else
               {
                  param1.y = this._itemList[_loc2_ + 1].y - _loc4_ * const_101;
               }
            }
         }
      }
      
      private function setChatItemRenderable(param1:RoomChatItem) : void
      {
         if(param1 != null)
         {
            if(param1.y < -const_557)
            {
               if(param1.view != null)
               {
                  this.var_111.removeChild(param1.view);
                  param1.hideView();
               }
            }
            else if(param1.view == null)
            {
               param1.renderView();
               if(param1.view != null)
               {
                  this.var_111.addChild(param1.view);
               }
            }
         }
      }
      
      public function getTotalContentHeight() : int
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < this._itemList.length)
         {
            _loc1_ = this._itemList[_loc3_];
            if(_loc1_ != null)
            {
               if(_loc3_ == 0)
               {
                  _loc2_ += const_101;
               }
               else
               {
                  _loc2_ += this.getItemSpacing(this._itemList[_loc3_ - 1],_loc1_);
               }
               _loc2_ += (_loc1_.aboveLevels - 1) * const_101;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      private function getAreaBottom() : Number
      {
         if(this.historyViewerActive())
         {
            return this.var_111.height;
         }
         return this.var_208 + this.var_34.y;
      }
      
      private function getItemSpacing(param1:RoomChatItem, param2:RoomChatItem) : Number
      {
         if(param1.checkOverlap(param2.x,param1.y,param2.width,param2.height))
         {
            return const_101;
         }
         return const_1225;
      }
      
      private function purgeItems() : void
      {
         var _loc2_:* = null;
         if(this.historyViewerActive())
         {
            return;
         }
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         while(this._itemList.length > this.var_2537)
         {
            _loc2_ = this._itemList.shift();
            _loc3_ = this.var_247.indexOf(_loc2_);
            if(_loc3_ > -1)
            {
               this.var_247.splice(_loc3_,1);
            }
            if(_loc2_.view != null)
            {
               this.var_111.removeChild(_loc2_.view);
               _loc2_.hideView();
            }
            _loc2_.dispose();
            _loc2_ = null;
         }
         var _loc4_:Boolean = false;
         _loc1_ = 0;
         for(; _loc1_ < this._itemList.length; _loc1_++)
         {
            _loc2_ = this._itemList[_loc1_];
            if(_loc2_ != null)
            {
               if(_loc2_.y > -const_557)
               {
                  _loc4_ = true;
               }
               _loc2_.aboveLevels = 1;
               if(_loc2_.view != null)
               {
                  _loc3_ = this.var_247.indexOf(_loc2_);
                  if(_loc3_ > -1)
                  {
                     this.var_247.splice(_loc3_,1);
                  }
                  this.var_111.removeChild(_loc2_.view);
                  _loc2_.hideView();
               }
               continue;
               break;
            }
         }
         if(this.var_65.length > 0)
         {
            _loc4_ = true;
         }
         if(this.getTotalContentHeight() > const_101 && !_loc4_ && !this.historyViewerActive())
         {
            if(this.var_26 != null)
            {
               this.stretchAreaBottomTo(this.var_34.y);
               this.alignItems();
               if(!this.historyViewerActive())
               {
                  this.var_26.showHistoryViewer();
               }
               if(!this.historyViewerVisible())
               {
                  this.var_26.visible = true;
               }
            }
         }
         else if(this.historyViewerVisible())
         {
            this.var_26.visible = false;
         }
      }
      
      private function getFreeItemId() : String
      {
         return "chat_" + this.var_2540.toString() + "_item_" + (this.var_2538++).toString();
      }
      
      public function onItemMouseClick(param1:int, param2:String, param3:int, param4:int, param5:int, param6:WindowMouseEvent) : void
      {
         if(param6.shiftKey)
         {
            if(this.var_26 != null)
            {
               this.var_26.toggleHistoryViewer();
            }
            return;
         }
         var _loc7_:RoomWidgetRoomObjectMessage = new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_327,param1,param3);
         messageListener.processWidgetMessage(_loc7_);
         var _loc8_:RoomWidgetChatSelectAvatarMessage = new RoomWidgetChatSelectAvatarMessage(RoomWidgetChatSelectAvatarMessage.const_780,param1,param2,param4,param5);
         messageListener.processWidgetMessage(_loc8_);
      }
      
      public function onItemMouseDown(param1:int, param2:int, param3:int, param4:int, param5:WindowMouseEvent) : void
      {
         if(this.historyViewerVisible())
         {
            return;
         }
         if(this.var_26 != null)
         {
            this.var_26.beginDrag(param5.stageY);
         }
      }
      
      public function onItemMouseOver(param1:int, param2:int, param3:int, param4:int, param5:WindowMouseEvent) : void
      {
      }
      
      public function onItemMouseOut(param1:int, param2:int, param3:int, param4:int, param5:WindowMouseEvent) : void
      {
      }
      
      public function onPulldownMouseDown(param1:WindowMouseEvent) : void
      {
         if(this.var_26 != null)
         {
            this.var_26.beginDrag(param1.stageY,true);
         }
      }
      
      public function onPulldownCloseButtonClicked(param1:WindowMouseEvent) : void
      {
         if(this.var_26 != null)
         {
            this.var_26.hideHistoryViewer();
         }
      }
      
      public function stretchAreaBottomBy(param1:Number) : void
      {
         var _loc2_:Number = this.var_34.rectangle.bottom + param1 - 0;
         this.stretchAreaBottomTo(_loc2_);
      }
      
      public function stretchAreaBottomTo(param1:Number) : void
      {
         var _loc2_:int = this.var_34.context.getDesktopWindow().height - 0;
         param1 = Math.min(param1,_loc2_);
         this.var_208 = param1 - this.var_34.y;
         this.var_34.height = this.var_208 + RoomChatHistoryPulldown.const_79;
         if(this.var_26 != null)
         {
            this.var_26.containerResized(this.var_34.rectangle);
         }
      }
      
      public function resetArea() : void
      {
         if(this.var_26 == null)
         {
            return;
         }
         this.animationStop();
         this.var_208 = const_880 + const_392;
         this.var_34.height = this.var_208 + this.var_26.pulldownBarHeight;
         this.var_341.width = this.var_34.width - this.var_26.scrollbarWidth;
         this.var_341.height = this.var_208;
         this.var_111.width = this.var_34.width - this.var_26.scrollbarWidth;
         if(this.historyViewerActive())
         {
            this.var_111.height = this.getTotalContentHeight() + const_392;
         }
         else
         {
            this.var_111.height = this.var_208;
         }
         this.var_341.scrollV = 1;
         if(!this.historyViewerActive())
         {
            this.var_26.containerResized(this.var_34.rectangle);
         }
         this.purgeItems();
         this.alignItems();
      }
      
      private function historyViewerActive() : Boolean
      {
         return this.var_26 == null ? false : Boolean(this.var_26.active);
      }
      
      private function historyViewerVisible() : Boolean
      {
         return this.var_26 == null ? false : Boolean(this.var_26.visible);
      }
      
      public function hideHistoryViewer() : void
      {
         if(this.var_26 != null)
         {
            this.var_26.hideHistoryViewer();
         }
      }
      
      private function historyViewerMinimized() : Boolean
      {
         return this.var_341.height <= 1;
      }
      
      public function resizeContainerToLowestItem() : void
      {
         var _loc4_:* = null;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this._itemList.length)
         {
            _loc4_ = this._itemList[_loc2_];
            if(_loc4_.y > _loc1_)
            {
               _loc1_ = _loc4_.y;
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.var_65.length)
         {
            _loc4_ = this.var_65[_loc2_];
            if(_loc4_.y > _loc1_)
            {
               _loc1_ = _loc4_.y;
            }
            _loc2_++;
         }
         _loc1_ += const_557;
         _loc1_ = _loc1_ < 0 ? 0 : int(_loc1_);
         var _loc3_:int = this.var_34.rectangle.bottom;
         this.stretchAreaBottomTo(this.var_34.rectangle.top + _loc1_);
         _loc3_ -= this.var_34.rectangle.bottom;
         if(Math.abs(_loc3_) < RoomChatHistoryViewer.const_1067)
         {
            this.resetArea();
            return;
         }
         _loc2_ = 0;
         while(_loc2_ < this._itemList.length)
         {
            _loc4_ = this._itemList[_loc2_];
            _loc4_.y += _loc3_;
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.var_65.length)
         {
            _loc4_ = this.var_65[_loc2_];
            _loc4_.y += _loc3_;
            _loc2_++;
         }
         this.var_1815 = true;
      }
      
      public function mouseUp() : void
      {
         var _loc1_:Number = this.var_34.rectangle.bottom - 0;
         if(_loc1_ < const_880)
         {
            if(_loc1_ <= this.var_208 + this.var_34.y)
            {
               if(this.historyViewerActive())
               {
                  this.hideHistoryViewer();
               }
               this.resetArea();
               return;
            }
         }
         if(this.var_1815 && !this.historyViewerActive())
         {
            this.resetArea();
            this.var_1815 = false;
         }
      }
      
      public function reAlignItemsToHistoryContent() : void
      {
         if(this.historyViewerActive())
         {
            this.var_111.height = this.getTotalContentHeight() + const_392;
            this.alignItems();
         }
      }
      
      public function enableDragTooltips() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         _loc2_ = 0;
         while(_loc2_ < this._itemList.length)
         {
            _loc1_ = this._itemList[_loc2_];
            _loc1_.enableTooltip();
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.var_65.length)
         {
            _loc1_ = this.var_65[_loc2_];
            _loc1_.enableTooltip();
            _loc2_++;
         }
      }
      
      public function disableDragTooltips() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         _loc2_ = 0;
         while(_loc2_ < this._itemList.length)
         {
            _loc1_ = this._itemList[_loc2_];
            _loc1_.disableTooltip();
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.var_65.length)
         {
            _loc1_ = this.var_65[_loc2_];
            _loc1_.disableTooltip();
            _loc2_++;
         }
      }
   }
}
