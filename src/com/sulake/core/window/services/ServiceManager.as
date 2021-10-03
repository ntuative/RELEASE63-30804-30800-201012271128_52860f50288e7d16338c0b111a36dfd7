package com.sulake.core.window.services
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class ServiceManager implements IInternalWindowServices, IDisposable
   {
       
      
      private var var_2691:uint;
      
      private var var_133:DisplayObject;
      
      private var _disposed:Boolean = false;
      
      private var var_237:IWindowContext;
      
      private var var_1152:IMouseDraggingService;
      
      private var var_1157:IMouseScalingService;
      
      private var var_1155:IMouseListenerService;
      
      private var var_1154:IFocusManagerService;
      
      private var var_1153:IToolTipAgentService;
      
      private var var_1156:IGestureAgentService;
      
      public function ServiceManager(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         this.var_2691 = 0;
         this.var_133 = param2;
         this.var_237 = param1;
         this.var_1152 = new WindowMouseDragger(param2);
         this.var_1157 = new WindowMouseScaler(param2);
         this.var_1155 = new WindowMouseListener(param2);
         this.var_1154 = new FocusManager(param2);
         this.var_1153 = new WindowToolTipAgent(param2);
         this.var_1156 = new GestureAgentService();
      }
      
      public function dispose() : void
      {
         if(this.var_1152 != null)
         {
            this.var_1152.dispose();
            this.var_1152 = null;
         }
         if(this.var_1157 != null)
         {
            this.var_1157.dispose();
            this.var_1157 = null;
         }
         if(this.var_1155 != null)
         {
            this.var_1155.dispose();
            this.var_1155 = null;
         }
         if(this.var_1154 != null)
         {
            this.var_1154.dispose();
            this.var_1154 = null;
         }
         if(this.var_1153 != null)
         {
            this.var_1153.dispose();
            this.var_1153 = null;
         }
         if(this.var_1156 != null)
         {
            this.var_1156.dispose();
            this.var_1156 = null;
         }
         this.var_133 = null;
         this.var_237 = null;
         this._disposed = true;
      }
      
      public function getMouseDraggingService() : IMouseDraggingService
      {
         return this.var_1152;
      }
      
      public function getMouseScalingService() : IMouseScalingService
      {
         return this.var_1157;
      }
      
      public function getMouseListenerService() : IMouseListenerService
      {
         return this.var_1155;
      }
      
      public function getFocusManagerService() : IFocusManagerService
      {
         return this.var_1154;
      }
      
      public function getToolTipAgentService() : IToolTipAgentService
      {
         return this.var_1153;
      }
      
      public function getGestureAgentService() : IGestureAgentService
      {
         return this.var_1156;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
   }
}
