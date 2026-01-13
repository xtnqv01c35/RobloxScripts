return function(Signal: RBXScriptSignal, Callback: any)
	if typeof(Signal) ~= "RBXScriptSignal" or type(Callback) ~= "function" then
		
	else
		local obj = {
			ConnectionSignal = nil
		}

		function obj:Subscribe()
			if self.ConnectionSignal == nil then
				self.ConnectionSignal = Signal:Connect(Callback)
			end
		end

		function obj:UnSubscribe()
			if self.ConnectionSignal ~= nil then
				self.ConnectionSignal:Disconnect()
				self.ConnectionSignal = nil
			end
		end

		function obj:Destroy()
			self:UnSubscribe()
			table.clear(self)
		end

		return obj
	end
end
